SELECT
    TD."MONTH" AS MONTH_OF_THE_YEAR, TD.DAY_OF_THE_MONTH, COUNT(AOLND.NDCID) AS "COUNT"
FROM AOLND, TIMEDIM TD
WHERE
    TD.ID = AOLND.TIMEID
    AND AOLND.NDCID != -1
GROUP BY
    ROLLUP (TD."MONTH", TD."DAY_OF_THE_MONTH")
ORDER BY COUNT DESC;