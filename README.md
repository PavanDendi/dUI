# DEPRECATED

This project has been rebranded as ⚡tormFront.  This repo will be kept around until I see minimal traffic.

Please find the new repo at https://github.com/PavanDendi/StormFront

# How to Use This Repo

⚡tormFront is a notebook front end for the dbstress concurrency benchmarking tool.  It lets the user send multiple queries to a JDBC SQL endpoint without having to navigate too much code or manually edit config files.

⚡tormFront is meant to run in a Databricks workspace, and uses `ipywidgets` to generate the UI.

Clone this repo into your Databricks Workspace and open `StormFront.py`.  Run each cell one by one to select which sql files to run and which SQL endpoint to query.

# Dependencies

install `StormFront` either as a cluster library or as a notebook scoped library using `%pip install git+https://www.github.com/PavanDendi/StormFront`

Install `sqlstorm` jar from https://github.com/PavanDendi/sqlstorm/tree/databricks to your cluster.

Compiled binary can be found in the github Releases [HERE](https://github.com/PavanDendi/dbstress/releases/download/0.0.0/sqlstorm-assembly-0.0.0-SNAPSHOT.jar), or compile from source using `sbt assembly` from the sql⚡torm repo root directory.

Cluster can be a single node using a weak instance type since the cluster will only be sending API calls, and processing minimal data itself.

Cluster must be running a DBR version that supports ipykernel. Tested on DBR 10.4 LTS

If using DBR 11+, ipykernel is enabled by default.
For 11 >= DBR >= 10.3, enable ipykernel by adding to cluster config
```
spark.databricks.python.defaultPythonRepl ipykernel
```
