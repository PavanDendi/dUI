-- orderby_bigint_expression.sql
---- QUERY: orderby_bigint_expression
-- Description : Scan a fact table and sort 50Million rows by an expression.
-- Target test case : Order by expensive expression without returning all
--   rows to the client.
SELECT *
FROM   (SELECT Rank()
                 OVER(
                   ORDER BY  cast(substr( concat(cast(l_orderkey as string), cast (l_shipdate as string)),1,13) as bigint)) AS rank
        FROM   lineitem
        WHERE  l_shipdate < '1992-02-11') a
WHERE  rank < 10
