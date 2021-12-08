SELECT
    NDCDIM.CATEGORY,
    CFETD."MONTH" AS MONTH_OF_THE_YEAR,
    CFETD.COUNT
FROM (
    SELECT
        FE.NDCID AS "NDCID", TD."MONTH" AS "MONTH", COUNT(FE.NDCID) AS "COUNT"
    FROM (
        SELECT
            FACTS_EXTENDED.QUERYID AS QUERYID,
            FACTS_EXTENDED.TIMEID AS TIMEID,
            FACTS_EXTENDED.ANONID AS ANONID,
            FACTS_EXTENDED.URLID AS URLID,
            FACTS_EXTENDED.NDCID AS NDCID
        FROM
            "FACTS_EXTENDED"
        LEFT JOIN
            "ANONIDDIM"
        ON
            "ANONIDDIM"."ID" = "FACTS_EXTENDED"."ANONID"
        LEFT JOIN
            "TIMEDIM"
        ON
            "TIMEDIM"."ID" = "FACTS_EXTENDED"."TIMEID"
        LEFT JOIN
            "QUERYDIM"
        ON
            "QUERYDIM"."ID" = "FACTS_EXTENDED"."QUERYID"
        LEFT JOIN
            "NDCDIM"
        ON
            "NDCDIM"."ID" = "FACTS_EXTENDED"."NDCID"
        LEFT JOIN
            "URLDIM"
        ON
            "URLDIM"."ID" = "FACTS_EXTENDED"."URLID"
    ) FE, TIMEDIM TD
    WHERE
        TD.ID = FE.TIMEID
        AND FE.NDCID != -1
    GROUP BY
        CUBE (FE.NDCID, TD."MONTH")
) CFETD
LEFT JOIN
    NDCDIM
ON
    CFETD.NDCID = NDCDIM.ID
ORDER BY
    NDCDIM.CATEGORY_ID, MONTH(TO_DATE(CFETD."MONTH", 'MONTH'));