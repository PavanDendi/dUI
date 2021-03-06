from __future__ import annotations

import os
from pathlib import Path
import requests
from pprint import pprint
import sqlparse
from collections import namedtuple
from typing import NamedTuple, Dict

from . import CONTEXT


class Query(NamedTuple):
    name: str
    string: str


class JDBC(NamedTuple):
    string: str
    driver: str = "com.simba.spark.jdbc.Driver"
    user: str = "username"
    password: str = "password"


class ConnConfig(NamedTuple):
    parallel: int = 1
    repeats: int = 1
    timeout: int = 3000


class DBstressCfg(NamedTuple):
    yaml_path: os.PathLike = "/dbfs/tmp/dbstress/config.yaml"
    result_path: os.PathLike = "/dbfs/tmp/dbstress/output/"


# Name
# Cluster size
#     2X-Small
#     X-Small
#     Small
#     Medium
#     Large
#     X-Large
#     2X-Large
#     3X-Large
#     4X-Large

#     Auto Stop: bool, inactive mins
#     min max clusters
#     tags, key: value
#     serverless: bool
#     channel: current, preview
class EndpointCfg(NamedTuple):
    name: str = 'Storm Cloud'
    size: str = 'Medium'
    clusters_min: int = 1
    clusters_max: int = 1
    serverless: bool = True
    channel: str = "CHANNEL_NAME_CURRENT"
    tags: Dict[str, str] = {}


def ntuple(input: dict):
    """Recursively turn a dict into a named tuple"""
    for k, v in input.items():
        if hasattr(v, 'items') and (True in [hasattr(c, 'items') for c in v.items()]):
            print(v)
            ntuple(v)
        elif hasattr(v, 'items') and (True not in [hasattr(c, 'items') for c in v.items()]):
            input[k] = namedtuple(k, v.keys())(*v.values())
        else:
            input[k] = v
    input = namedtuple('ntuple', input.keys())(*input.values())
    return input


def format_str(detail_dict, filter_keys=None) -> str:
    if filter_keys:
        lines = [f'{k:<15}{str(detail_dict[k]):>30}' for k in filter_keys]
    else:
        lines = [f'{k:<15}{str(v):>30}' for k, v in detail_dict.items()]
    return "\n".join(lines)


def create_ep(token: str, host: str, ep_cfg: EndpointCfg = EndpointCfg()) -> str:
    request = {
        "name": ep_cfg.name,
        "cluster_size": ep_cfg.size,
        "min_num_clusters": ep_cfg.clusters_min,
        "max_num_clusters": ep_cfg.clusters_max,
        "enable_serverless_compute": ep_cfg.serverless,
        "channel": {
            "name": ep_cfg.channel
        }
    }
    apiurl = f"{host}/api/2.0/sql/endpoints/"
    headers = {"Authorization": f"Bearer {token}"}
    response = requests.post(apiurl, headers=headers, json=request).json()
    if (cluster_id := response.get('id', '')) == '':
        pprint(response)
        raise BaseException("Something went wrong creating an Endpoint")
    print("new cluster_id: " + cluster_id)
    return cluster_id


def get_or_del_ep(token: str, host: str, cluster_id: str, delete: bool = False):
    apiurl = f"{host}/api/2.0/sql/endpoints/{cluster_id}"
    headers = {"Authorization": f"Bearer {token}"}
    if delete:
        return requests.delete(apiurl, headers=headers).json()
    else:
        return ntuple(requests.get(apiurl, headers=headers).json())


def simba_jdbc(token: str, jdbc_d) -> JDBC:
    host = jdbc_d.hostname
    httpPath = jdbc_d.path
    port = jdbc_d.port
    string = f"jdbc:spark://{host}:{port}/{{database}};transportMode=http;ssl=1;"
    string += f"AuthMech=3;httpPath={httpPath};UID=token;PWD={token};UseNativeQuery=1"
    return JDBC(string)


# TODO: convert return result to using ntuple()
def get_sql_eps(token: str, host: str = CONTEXT.host):

    apiurl = f"{host}/api/2.0/sql/endpoints"
    headers = {"Authorization": f"Bearer {token}"}
    eps_raw = requests.get(apiurl, headers=headers).json()['endpoints']
    key_map = {
        "name": "Name",
        "cluster_size": "Size",
        "enable_photon": "Photon",
        "creator_name": "Creator",
        "enable_serverless_compute": "Serverless",
        "min_num_clusters": "Clusters_min",
        "max_num_clusters": "Clusters_max",
        "state": "State",
        "id": "ID",
        "odbc_params": "JDBC"
    }
    eps = {ep["name"]: {k: v for k, v in ep.items() if key_map.get(k)}
           for ep in eps_raw}

    ordered_keys = ["State", "Creator", "Size"]
    remove_keys = ["JDBC", "Name"]
    filter_keys = ordered_keys + \
        sorted(set(key_map.values()) - set(ordered_keys) - set(remove_keys))

    for ep in eps.values():
        ep["format_str"] = format_str(
            {v: ep[k] for k, v in key_map.items()}, filter_keys)
        ep["odbc_params"] = simba_jdbc(token, ep["odbc_params"])

    return {name: namedtuple('ep', e.keys())(*e.values()) for name, e in eps.items()}


# read in a list of sql filepaths and convert syntax and strip comments
def read_sql_files(sql_files: list(os.PathLike), info: bool = False) -> list(Query):
    named_queries = []
    for file in sql_files:
        with open(file, "r") as f:
            query_name = Path(file).stem
            generalized = sqlparse.format(
                f.read(), strip_comments=True).strip()
            named_queries.append(Query(query_name, generalized))
            if info:
                print(query_name + "\n")
                print(generalized + "\n\n")

    return named_queries


def read_sql_folder(path: os.PathLike, info: bool = False) -> list(Query):
    path = Path(path)
    sql_files = sorted(list(path.glob('./*.sql')))

    return read_sql_files(sql_files, info)


def check_dbs_cfg(dbs_cfg: DBstressCfg = DBstressCfg()) -> None:
    yaml_dir = Path(dbs_cfg.yaml_path).parent
    out_dir = Path(dbs_cfg.result_path)
    if not os.path.exists(yaml_dir):
        print(f"Config directory {yaml_dir} does not exist")
        print(f"Creating {yaml_dir}")
        os.makedirs(yaml_dir)
    if not os.path.exists(out_dir):
        print(f"Result directory {out_dir} does not exist")
        print(f"Creating {out_dir}")
        os.makedirs(out_dir)


def yaml_str(query: Query, jdbc: JDBC, conn: ConnConfig = ConnConfig()) -> str:
    out = "---\n"
    out += f"unit_name: {query.name}\n"
    out += f'query: "/* {query.name}  @@gen_query_id@@ */\n{query.string}"\n'
    out += f'uri: "{jdbc.string}"\n'
    out += f"driver_class: {jdbc.driver}\n"
    out += f"username: {jdbc.user}\n"
    out += f"password: {jdbc.password}\n"
    out += f"parallel_connections: {conn.parallel}\n"
    out += f"repeats: {conn.repeats}\n"
    out += f"connection_timeout: {conn.timeout}\n"
    return out


def write_yaml(yamls: list[str], dbs_cfg: DBstressCfg = DBstressCfg(), info: bool = False) -> None:
    yaml_out = "".join(yamls)
    yaml_path = dbs_cfg.yaml_path

    if info:
        print(f"Writing yaml config file to: {yaml_path}")
        print(yaml_out)
        with open(yaml_path, "w") as f:
            f.write(yaml_out)
