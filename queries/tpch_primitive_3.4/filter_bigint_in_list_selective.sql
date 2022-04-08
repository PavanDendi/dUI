-- filter_bigint_in_list_selective.sql
---- QUERY: filter_bigint_in_list_selective
-- Description : Scan fact table while applying long in-list filter on bigint column that selects 468 out of 18,000,048,306 (0.000003%) records.
-- Target test case : Basic scan and filter.
SELECT count(*)
FROM lineitem where l_orderkey in (1,6,11,16,21,26,31,36,41,46,51,56,61,66,71,76,81,86,91,96,101,
106,111,116,121,126,131,136,141,146,151,156,161,166,171,176,181,186,191,196,201,206,211,216,221,
226,231,236,241,246,251,256,261,266,271,276,281,286,291,296,301,306,311,316,321,326,331,336,341,
346,351,356,361,366,371,376,381,386,391,396,401,406,411,416,421,426,431,436,441,446,451,456,461,
466,471,476,481,486,491,496,501,506,511,516,521,526,531,536,541,546,551,556,561,566,571,576,581,
586,591,596,601,606,611,616,621,626,631,636,641,646,651,656,661,666,671,676,681,686,691,696,701,
706,711,716,721,726,731,736,741,746,751,756,761,766,771,776,781,786,791,796,801,806,811,816,821,
826,831,836,841,846,851,856,861,866,871,876,881,886,891,896,901,906,911,916,921,926,931,936,941,
946,951,956,961,966,971,976,981,986,991,996,1001,1006,1011,1016,1021,1026,1031,1036,1041,1046,1051,
1056,1061,1066,1071,1076,1081,1086,1091,1096,1101,1106,1111,1116,1121,1126,1131,1136,1141,1146,1151,
1156,1161,1166,1171,1176,1181,1186,1191,1196,1201,1206,1211,1216,1221,1226,1231,1236,1241,1246,1251,
1256,1261,1266,1271,1276,1281,1286,1291,1296,1301,1306,1311,1316,1321,1326,1331,1336,1341,1346,1351,
356,1361,1366,1371,1376,1381,1386,1391,1396,1401,1406,1411,1416,1421,1426,1431,1436,1441,1446,1451,
1456,1461,1466,1471,1476,1481,1486,1491,1496,1501,1506,1511,1516,1521,1526,1531,1536,1541,1546,1551,
1556,1561,1566,1571,1576,1581,1586,1591,1596,1601,1606,1611,1616,1621,1626,1631,1636,1641,1646,1651,
1656,1661,1666,1671,1676,1681,1686,1691,1696,1701,1706,1711,1716,1721,1726,1731,1736,1741,1746,1751,
1756,1761,1766,1771,1776,1781,1786,1791,1796,1801,1806,1811,1816,1821,1826,1831,1836,1841,1846,1851,
1856,1861,1866,1871,1876,1881,1886,1891,1896,1901,1906,1911,1916,1921,1926,1931,1936,1941,1946,1951,
1956,1961,1966,1971,1976,1981,1986,1991,1996,2001,2006,2011,2016,2021,2026,2031,2036,2041,2046,2051,
2056,2061,2066,2071,2076,2081,2086,2091,2096,2101,2106,2111,2116,2121,2126,2131,2136,2141,2146,2151,
2156,2161,2166,2171,2176,2181,2186,2191,2196,2201,2206,2211,2216,2221,2226,2231,2236,2241,2246,2251,
2256,2261,2266,2271,2276,2281,2286)
