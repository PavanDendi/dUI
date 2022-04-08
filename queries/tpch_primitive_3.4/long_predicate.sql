-- long_predicate.sql
---- QUERY: long_predicate
-- Description: A simple scan with extremely long predicate.
-- Target test case: Query generated by BI tools with complex expressions. Aim to
--  exercise long codegen time due to inlining. Intentionally disabled query rewrite
--  in the FE to expose the long expressions to the BE.
SELECT COUNT(*)
FROM lineitem
WHERE
((l_orderkey = 520 AND l_shipdate between "2017-01-01 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 534 AND l_shipdate between "2017-01-02 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 518 AND l_shipdate between "2017-01-03 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 535 AND l_shipdate between "2017-01-04 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 496 AND l_shipdate between "2017-01-05 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 497 AND l_shipdate between "2017-01-06 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 516 AND l_shipdate between "2017-01-07 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 531 AND l_shipdate between "2017-01-08 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 533 AND l_shipdate between "2017-01-09 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 532 AND l_shipdate between "2017-01-10 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 546 AND l_shipdate between "2017-01-11 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 549 AND l_shipdate between "2017-01-12 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 548 AND l_shipdate between "2017-01-13 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 547 AND l_shipdate between "2017-01-14 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 513 AND l_shipdate between "2017-01-15 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 515 AND l_shipdate between "2017-01-16 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 507 AND l_shipdate between "2017-01-17 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 509 AND l_shipdate between "2017-01-18 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 519 AND l_shipdate between "2017-01-19 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 527 AND l_shipdate between "2017-01-20 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 501 AND l_shipdate between "2017-01-21 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 544 AND l_shipdate between "2017-01-22 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 545 AND l_shipdate between "2017-01-23 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 541 AND l_shipdate between "2017-01-24 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 550 AND l_shipdate between "2017-01-25 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 529 AND l_shipdate between "2017-01-26 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 528 AND l_shipdate between "2017-01-27 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 537 AND l_shipdate between "2017-01-28 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 538 AND l_shipdate between "2017-01-29 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 506 AND l_shipdate between "2017-01-30 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 502 AND l_shipdate between "2017-01-31 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 543 AND l_shipdate between "2017-03-01 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 390 AND l_shipdate between "2017-03-02 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 389 AND l_shipdate between "2017-03-03 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 0  AND l_shipdate between "2017-03-04 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 852 AND l_shipdate between "2017-03-05 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 853 AND l_shipdate between "2017-03-06 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 854 AND l_shipdate between "2017-03-07 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 844 AND l_shipdate between "2017-03-08 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 846 AND l_shipdate between "2017-03-09 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 843 AND l_shipdate between "2017-03-10 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 849 AND l_shipdate between "2017-03-11 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 850 AND l_shipdate between "2017-03-12 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 847 AND l_shipdate between "2017-03-13 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 746 AND l_shipdate between "2017-03-14 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 745 AND l_shipdate between "2017-03-15 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 901 AND l_shipdate between "2017-03-16 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 899 AND l_shipdate between "2017-03-17 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 895 AND l_shipdate between "2017-03-18 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 878 AND l_shipdate between "2017-03-19 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 884 AND l_shipdate between "2017-03-20 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 871 AND l_shipdate between "2017-03-21 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 872 AND l_shipdate between "2017-03-22 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 886 AND l_shipdate between "2017-03-23 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 879 AND l_shipdate between "2017-03-24 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 864 AND l_shipdate between "2017-03-25 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 889 AND l_shipdate between "2017-03-26 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 885 AND l_shipdate between "2017-03-27 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 848 AND l_shipdate between "2017-03-28 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 888 AND l_shipdate between "2017-03-29 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 863 AND l_shipdate between "2017-03-30 12:00:00" AND "2017-04-17 02:22:02") OR
(l_orderkey = 930 AND l_shipdate between "2017-03-31 12:00:00" AND "2017-04-17 02:22:03") OR
(l_orderkey = 891 AND l_shipdate between "2017-05-01 12:00:00" AND "2017-06-17 02:22:02") OR
(l_orderkey = 890 AND l_shipdate between "2017-05-02 12:00:00" AND "2017-06-17 02:22:03") OR
(l_orderkey = 926 AND l_shipdate between "2017-05-03 12:00:00" AND "2017-06-17 02:22:02") OR
(l_orderkey = 927 AND l_shipdate between "2017-05-04 12:00:00" AND "2017-06-17 02:22:03") OR
(l_orderkey = 892 AND l_shipdate between "2017-05-05 12:00:00" AND "2017-06-17 02:22:02") OR
(l_orderkey = 925 AND l_shipdate between "2017-05-06 12:00:00" AND "2017-06-17 02:22:03") OR
(l_orderkey = 887 AND l_shipdate between "2017-05-07 12:00:00" AND "2017-06-17 02:22:02") OR
(l_orderkey = 898 AND l_shipdate between "2017-05-08 12:00:00" AND "2017-06-17 02:22:03") OR
(l_orderkey = 902 AND l_shipdate between "2017-05-09 12:00:00" AND "2017-06-17 02:22:02") OR
(l_orderkey = 903 AND l_shipdate between "2017-05-10 12:00:00" AND "2017-06-17 02:22:03") OR
(l_orderkey = 904 AND l_shipdate between "2017-05-11 12:00:00" AND "2017-06-17 02:22:02") OR
(l_orderkey = 897 AND l_shipdate between "2017-05-12 12:00:00" AND "2017-06-17 02:22:03") OR
(l_orderkey = 900 AND l_shipdate between "2017-05-13 12:00:00" AND "2017-06-17 02:22:02") OR
(l_orderkey = 598 AND l_shipdate between "2017-05-14 12:00:00" AND "2017-06-17 02:22:03") OR
(l_orderkey = 597 AND l_shipdate between "2017-05-15 12:00:00" AND "2017-06-17 02:22:02") OR
(l_orderkey = 607 AND l_shipdate between "2017-05-16 12:00:00" AND "2017-06-17 02:22:03") OR
(l_orderkey = 288 AND l_shipdate between "2017-01-01 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 289 AND l_shipdate between "2017-01-02 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 281 AND l_shipdate between "2017-01-03 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 287 AND l_shipdate between "2017-01-04 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 290 AND l_shipdate between "2017-01-05 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 264 AND l_shipdate between "2017-01-06 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 292 AND l_shipdate between "2017-01-07 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 241 AND l_shipdate between "2017-01-08 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 291 AND l_shipdate between "2017-01-09 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 286 AND l_shipdate between "2017-01-10 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 148 AND l_shipdate between "2017-01-11 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 298 AND l_shipdate between "2017-01-12 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 278 AND l_shipdate between "2017-01-13 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 284 AND l_shipdate between "2017-01-14 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 285 AND l_shipdate between "2017-01-15 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 283 AND l_shipdate between "2017-01-16 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 295 AND l_shipdate between "2017-01-17 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 296 AND l_shipdate between "2017-01-18 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 293 AND l_shipdate between "2017-01-19 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 294 AND l_shipdate between "2017-01-20 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 282 AND l_shipdate between "2017-01-21 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 263 AND l_shipdate between "2017-01-22 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 297 AND l_shipdate between "2017-01-23 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 299 AND l_shipdate between "2017-01-24 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 300 AND l_shipdate between "2017-01-25 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 265 AND l_shipdate between "2017-01-26 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 267 AND l_shipdate between "2017-01-27 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 520 AND l_shipdate between "2017-01-28 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 534 AND l_shipdate between "2017-01-29 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 518 AND l_shipdate between "2017-01-30 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 535 AND l_shipdate between "2017-01-31 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 496 AND l_shipdate between "2017-02-01 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 497 AND l_shipdate between "2017-02-02 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 516 AND l_shipdate between "2017-02-03 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 531 AND l_shipdate between "2017-02-04 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 533 AND l_shipdate between "2017-02-05 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 532 AND l_shipdate between "2017-02-06 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 546 AND l_shipdate between "2017-02-07 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 549 AND l_shipdate between "2017-02-08 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 548 AND l_shipdate between "2017-02-09 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 547 AND l_shipdate between "2017-02-10 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 513 AND l_shipdate between "2017-02-11 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 515 AND l_shipdate between "2017-02-12 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 507 AND l_shipdate between "2017-02-13 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 509 AND l_shipdate between "2017-02-14 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 519 AND l_shipdate between "2017-02-15 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 527 AND l_shipdate between "2017-02-16 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 503 AND l_shipdate between "2017-02-17 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 498 AND l_shipdate between "2017-02-18 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 501 AND l_shipdate between "2017-02-19 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 544 AND l_shipdate between "2017-02-20 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 545 AND l_shipdate between "2017-02-21 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 540 AND l_shipdate between "2017-02-22 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 541 AND l_shipdate between "2017-02-23 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 550 AND l_shipdate between "2017-02-24 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 529 AND l_shipdate between "2017-02-25 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 528 AND l_shipdate between "2017-03-01 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 537 AND l_shipdate between "2017-03-02 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 538 AND l_shipdate between "2017-03-03 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 506 AND l_shipdate between "2017-03-04 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 500 AND l_shipdate between "2017-03-05 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 539 AND l_shipdate between "2017-03-06 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 512 AND l_shipdate between "2017-03-07 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 502 AND l_shipdate between "2017-03-08 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 504 AND l_shipdate between "2017-03-09 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 543 AND l_shipdate between "2017-03-10 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 390 AND l_shipdate between "2017-03-11 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 389 AND l_shipdate between "2017-03-12 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 0  AND l_shipdate between "2017-03-13 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 844 AND l_shipdate between "2017-03-14 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 846 AND l_shipdate between "2017-03-15 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 894 AND l_shipdate between "2017-03-16 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 843 AND l_shipdate between "2017-03-17 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 744 AND l_shipdate between "2017-04-01 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 847 AND l_shipdate between "2017-04-02 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 746 AND l_shipdate between "2017-04-03 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 745 AND l_shipdate between "2017-04-04 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 893 AND l_shipdate between "2017-04-05 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 901 AND l_shipdate between "2017-04-06 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 899 AND l_shipdate between "2017-04-07 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 878 AND l_shipdate between "2017-04-08 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 884 AND l_shipdate between "2017-04-09 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 883 AND l_shipdate between "2017-04-10 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 879 AND l_shipdate between "2017-04-11 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 929 AND l_shipdate between "2017-04-12 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 885 AND l_shipdate between "2017-04-13 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 891 AND l_shipdate between "2017-04-14 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 892 AND l_shipdate between "2017-04-15 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 882 AND l_shipdate between "2017-04-16 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 898 AND l_shipdate between "2017-04-17 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 876 AND l_shipdate between "2017-04-18 12:00:00" AND "2017-04-18 02:22:02") OR
(l_orderkey = 743 AND l_shipdate between "2017-04-19 12:00:00" AND "2017-06-18 02:22:02") OR
(l_orderkey = 900 AND l_shipdate between "2017-04-20 12:00:00" AND "2017-06-18 02:22:02") OR
(l_orderkey = 520 AND l_shipdate between "2018-01-01 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 534 AND l_shipdate between "2018-01-02 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 518 AND l_shipdate between "2018-01-03 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 535 AND l_shipdate between "2018-01-04 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 496 AND l_shipdate between "2018-01-05 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 497 AND l_shipdate between "2018-01-06 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 516 AND l_shipdate between "2018-01-07 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 531 AND l_shipdate between "2018-01-08 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 533 AND l_shipdate between "2018-01-09 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 532 AND l_shipdate between "2018-01-10 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 546 AND l_shipdate between "2018-01-11 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 549 AND l_shipdate between "2018-01-12 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 548 AND l_shipdate between "2018-01-13 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 547 AND l_shipdate between "2018-01-14 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 513 AND l_shipdate between "2018-01-15 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 515 AND l_shipdate between "2018-01-16 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 507 AND l_shipdate between "2018-01-17 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 509 AND l_shipdate between "2018-01-18 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 519 AND l_shipdate between "2018-01-19 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 527 AND l_shipdate between "2018-01-20 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 501 AND l_shipdate between "2018-01-21 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 544 AND l_shipdate between "2018-01-22 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 545 AND l_shipdate between "2018-01-23 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 541 AND l_shipdate between "2018-01-24 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 550 AND l_shipdate between "2018-01-25 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 529 AND l_shipdate between "2018-01-26 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 528 AND l_shipdate between "2018-01-27 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 537 AND l_shipdate between "2018-01-28 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 538 AND l_shipdate between "2018-01-29 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 506 AND l_shipdate between "2018-01-30 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 502 AND l_shipdate between "2018-01-31 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 543 AND l_shipdate between "2018-03-01 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 390 AND l_shipdate between "2018-03-02 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 389 AND l_shipdate between "2018-03-03 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 0  AND l_shipdate between "2018-03-04 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 852 AND l_shipdate between "2018-03-05 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 853 AND l_shipdate between "2018-03-06 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 854 AND l_shipdate between "2018-03-07 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 844 AND l_shipdate between "2018-03-08 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 846 AND l_shipdate between "2018-03-09 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 843 AND l_shipdate between "2018-03-10 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 849 AND l_shipdate between "2018-03-11 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 850 AND l_shipdate between "2018-03-12 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 847 AND l_shipdate between "2018-03-13 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 746 AND l_shipdate between "2018-03-14 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 745 AND l_shipdate between "2018-03-15 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 901 AND l_shipdate between "2018-03-16 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 899 AND l_shipdate between "2018-03-17 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 895 AND l_shipdate between "2018-03-18 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 878 AND l_shipdate between "2018-03-19 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 884 AND l_shipdate between "2018-03-20 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 871 AND l_shipdate between "2018-03-21 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 872 AND l_shipdate between "2018-03-22 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 886 AND l_shipdate between "2018-03-23 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 879 AND l_shipdate between "2018-03-24 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 864 AND l_shipdate between "2018-03-25 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 889 AND l_shipdate between "2018-03-26 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 885 AND l_shipdate between "2018-03-27 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 848 AND l_shipdate between "2018-03-28 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 888 AND l_shipdate between "2018-03-29 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 863 AND l_shipdate between "2018-03-30 12:00:00" AND "2018-04-17 02:22:02") OR
(l_orderkey = 930 AND l_shipdate between "2018-03-31 12:00:00" AND "2018-04-17 02:22:03") OR
(l_orderkey = 891 AND l_shipdate between "2018-05-01 12:00:00" AND "2018-06-17 02:22:02") OR
(l_orderkey = 890 AND l_shipdate between "2018-05-02 12:00:00" AND "2018-06-17 02:22:03") OR
(l_orderkey = 926 AND l_shipdate between "2018-05-03 12:00:00" AND "2018-06-17 02:22:02") OR
(l_orderkey = 927 AND l_shipdate between "2018-05-04 12:00:00" AND "2018-06-17 02:22:03") OR
(l_orderkey = 892 AND l_shipdate between "2018-05-05 12:00:00" AND "2018-06-17 02:22:02") OR
(l_orderkey = 925 AND l_shipdate between "2018-05-06 12:00:00" AND "2018-06-17 02:22:03") OR
(l_orderkey = 887 AND l_shipdate between "2018-05-07 12:00:00" AND "2018-06-17 02:22:02") OR
(l_orderkey = 898 AND l_shipdate between "2018-05-08 12:00:00" AND "2018-06-17 02:22:03") OR
(l_orderkey = 902 AND l_shipdate between "2018-05-09 12:00:00" AND "2018-06-17 02:22:02") OR
(l_orderkey = 903 AND l_shipdate between "2018-05-10 12:00:00" AND "2018-06-17 02:22:03") OR
(l_orderkey = 904 AND l_shipdate between "2018-05-11 12:00:00" AND "2018-06-17 02:22:02") OR
(l_orderkey = 897 AND l_shipdate between "2018-05-12 12:00:00" AND "2018-06-17 02:22:03") OR
(l_orderkey = 900 AND l_shipdate between "2018-05-13 12:00:00" AND "2018-06-17 02:22:02") OR
(l_orderkey = 598 AND l_shipdate between "2018-05-14 12:00:00" AND "2018-06-17 02:22:03") OR
(l_orderkey = 597 AND l_shipdate between "2018-05-15 12:00:00" AND "2018-06-17 02:22:02") OR
(l_orderkey = 607 AND l_shipdate between "2018-05-16 12:00:00" AND "2018-06-17 02:22:03") OR
(l_orderkey = 288 AND l_shipdate between "2018-01-01 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 289 AND l_shipdate between "2018-01-02 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 281 AND l_shipdate between "2018-01-03 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 287 AND l_shipdate between "2018-01-04 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 290 AND l_shipdate between "2018-01-05 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 264 AND l_shipdate between "2018-01-06 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 292 AND l_shipdate between "2018-01-07 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 241 AND l_shipdate between "2018-01-08 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 291 AND l_shipdate between "2018-01-09 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 286 AND l_shipdate between "2018-01-10 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 148 AND l_shipdate between "2018-01-11 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 298 AND l_shipdate between "2018-01-12 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 278 AND l_shipdate between "2018-01-13 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 284 AND l_shipdate between "2018-01-14 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 285 AND l_shipdate between "2018-01-15 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 283 AND l_shipdate between "2018-01-16 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 295 AND l_shipdate between "2018-01-17 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 296 AND l_shipdate between "2018-01-18 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 293 AND l_shipdate between "2018-01-19 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 294 AND l_shipdate between "2018-01-20 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 282 AND l_shipdate between "2018-01-21 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 263 AND l_shipdate between "2018-01-22 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 297 AND l_shipdate between "2018-01-23 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 299 AND l_shipdate between "2018-01-24 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 300 AND l_shipdate between "2018-01-25 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 265 AND l_shipdate between "2018-01-26 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 267 AND l_shipdate between "2018-01-27 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 520 AND l_shipdate between "2018-01-28 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 534 AND l_shipdate between "2018-01-29 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 518 AND l_shipdate between "2018-01-30 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 535 AND l_shipdate between "2018-01-31 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 496 AND l_shipdate between "2018-02-01 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 497 AND l_shipdate between "2018-02-02 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 516 AND l_shipdate between "2018-02-03 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 531 AND l_shipdate between "2018-02-04 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 533 AND l_shipdate between "2018-02-05 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 532 AND l_shipdate between "2018-02-06 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 546 AND l_shipdate between "2018-02-07 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 549 AND l_shipdate between "2018-02-08 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 548 AND l_shipdate between "2018-02-09 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 547 AND l_shipdate between "2018-02-10 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 513 AND l_shipdate between "2018-02-11 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 515 AND l_shipdate between "2018-02-12 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 507 AND l_shipdate between "2018-02-13 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 509 AND l_shipdate between "2018-02-14 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 519 AND l_shipdate between "2018-02-15 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 527 AND l_shipdate between "2018-02-16 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 503 AND l_shipdate between "2018-02-17 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 498 AND l_shipdate between "2018-02-18 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 501 AND l_shipdate between "2018-02-19 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 544 AND l_shipdate between "2018-02-20 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 545 AND l_shipdate between "2018-02-21 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 540 AND l_shipdate between "2018-02-22 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 541 AND l_shipdate between "2018-02-23 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 550 AND l_shipdate between "2018-02-24 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 529 AND l_shipdate between "2018-02-25 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 528 AND l_shipdate between "2018-03-01 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 537 AND l_shipdate between "2018-03-02 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 538 AND l_shipdate between "2018-03-03 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 506 AND l_shipdate between "2018-03-04 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 500 AND l_shipdate between "2018-03-05 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 539 AND l_shipdate between "2018-03-06 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 512 AND l_shipdate between "2018-03-07 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 502 AND l_shipdate between "2018-03-08 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 504 AND l_shipdate between "2018-03-09 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 543 AND l_shipdate between "2018-03-10 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 390 AND l_shipdate between "2018-03-11 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 389 AND l_shipdate between "2018-03-12 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 0  AND l_shipdate between "2018-03-13 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 844 AND l_shipdate between "2018-03-14 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 846 AND l_shipdate between "2018-03-15 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 894 AND l_shipdate between "2018-03-16 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 843 AND l_shipdate between "2018-03-17 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 744 AND l_shipdate between "2018-04-01 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 847 AND l_shipdate between "2018-04-02 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 746 AND l_shipdate between "2018-04-03 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 745 AND l_shipdate between "2018-04-04 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 893 AND l_shipdate between "2018-04-05 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 901 AND l_shipdate between "2018-04-06 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 899 AND l_shipdate between "2018-04-07 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 878 AND l_shipdate between "2018-04-08 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 884 AND l_shipdate between "2018-04-09 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 883 AND l_shipdate between "2018-04-10 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 879 AND l_shipdate between "2018-04-11 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 929 AND l_shipdate between "2018-04-12 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 885 AND l_shipdate between "2018-04-13 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 891 AND l_shipdate between "2018-04-14 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 892 AND l_shipdate between "2018-04-15 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 882 AND l_shipdate between "2018-04-16 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 898 AND l_shipdate between "2018-04-17 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 876 AND l_shipdate between "2018-04-18 12:00:00" AND "2018-04-18 02:22:02") OR
(l_orderkey = 743 AND l_shipdate between "2018-04-19 12:00:00" AND "2018-06-18 02:22:02") OR
(l_orderkey = 900 AND l_shipdate between "2018-04-20 12:00:00" AND "2018-06-18 02:22:02")) and l_commitdate ="2019-01-01"
