SELECT
    ANONIDDIM.ANONID AS ANONID,
    AOL_TIME(TIMEDIM."YEAR", TIMEDIM."MONTH", TIMEDIM.DAY_OF_THE_MONTH, TIMEDIM."HOUR", TIMEDIM."MINUTE", TIMEDIM."SECOND") AS TIME_,
    QUERYDIM.QUERY AS QUERY,
    URLDIM.URL AS URL,
    NDCDIM.CATEGORY AS CATEGORY
FROM
    AOLND
LEFT JOIN
    ANONIDDIM
ON
    ANONIDDIM.ID = AOLND.ANONID
LEFT JOIN
    TIMEDIM
ON
    TIMEDIM.ID = AOLND.TIMEID
LEFT JOIN
    QUERYDIM
ON
    QUERYDIM.ID = AOLND.QUERYID
LEFT JOIN
    URLDIM
ON
    URLDIM.ID = AOLND.URLID
LEFT JOIN
    NDCDIM
ON
    NDCDIM.ID = AOLND.NDCID
WHERE
    NDCDIM.ID != -1
    AND MONTH(TO_DATE(TIMEDIM."MONTH", 'MONTH'))=3
    AND DAY(TO_DATE(TIMEDIM.DAY_OF_THE_MONTH, 'DD'))=14
ORDER BY
    TIME_ ASC;