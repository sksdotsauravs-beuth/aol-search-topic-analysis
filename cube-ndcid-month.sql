SELECT
    NDCDIM.CATEGORY,
    CFETD."MONTH" AS MONTH_OF_THE_YEAR,
    CFETD.COUNT
FROM (
    SELECT
        AOLND.NDCID AS "NDCID", TD."MONTH" AS "MONTH", COUNT(AOLND.NDCID) AS "COUNT"
    FROM
        AOLND, TIMEDIM TD
    WHERE
        TD.ID = AOLND.TIMEID
    GROUP BY
        CUBE (AOLND.NDCID, TD."MONTH")
) CFETD
LEFT JOIN
    NDCDIM
ON
    CFETD.NDCID = NDCDIM.ID
ORDER BY
    NDCDIM.CATEGORY_ID, MONTH(TO_DATE(CFETD."MONTH", 'MONTH'));