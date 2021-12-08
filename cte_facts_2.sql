WITH FACTS_2 AS (
    SELECT
        "FACTS_EXTENDED".ANONID AS ANONID,
        "FACTS_EXTENDED".TIMEID AS TIMEID,
        "FACTS_EXTENDED".QUERYID AS QUERYID,
        "FACTS_EXTENDED".URLID AS URLID,
        "FACTS_EXTENDED".NDCID,
        "QUERYDIM".QUERY AS QUERY,
        "NDCDIM".CATEGORY AS CATEGORY
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
)
SELECT * FROM FACTS_2 LIMIT 500;