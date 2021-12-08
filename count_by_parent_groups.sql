WITH CTE_FACTS AS (
    SELECT
        FACTS_EXTENDED.QUERYID AS QUERYID,
        FACTS_EXTENDED.TIMEID AS TIMEID,
        FACTS_EXTENDED.ANONID AS ANONID,
        FACTS_EXTENDED.URLID AS URLID,
        FACTS_EXTENDED.NDCID AS NDCID,
        NDCDIM.CATEGORY_ID AS CATEGORY_ID,
        NDCDIM.PARENT_CATEGORY_ID AS PARENT_CATEGORY_ID
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
SELECT * FROM (
    SELECT COUNT(*) "TOTAL" FROM CTE_FACTS WHERE CTE_FACTS.NDCID IS NOT NULL,
    SELECT COUNT(*) "!NATURAL DISASTER" FROM CTE_FACTS WHERE CTE_FACTS.NDCID = -1,
    SELECT COUNT(*) "NATURAL DISASTER" FROM CTE_FACTS WHERE CTE_FACTS.CATEGORY_ID >= 0,
    SELECT COUNT(*) "GEOLOGICAL DISASTER" FROM CTE_FACTS WHERE CTE_FACTS.CATEGORY_ID = 1 OR CTE_FACTS.PARENT_CATEGORY_ID = 1,
    SELECT COUNT(*) "HYDROLOGICAL DISASTER" FROM CTE_FACTS WHERE CTE_FACTS.CATEGORY_ID = 2 OR CTE_FACTS.PARENT_CATEGORY_ID = 2,
    SELECT COUNT(*) "METEOROLOGICAL DISASTER" FROM CTE_FACTS WHERE CTE_FACTS.CATEGORY_ID = 3 OR CTE_FACTS.PARENT_CATEGORY_ID = 3,
    SELECT COUNT(*) "WILDFIRE" FROM CTE_FACTS WHERE CTE_FACTS.CATEGORY_ID = 4 OR CTE_FACTS.PARENT_CATEGORY_ID = 4,
    SELECT COUNT(*) "SPACE DISASTER" FROM CTE_FACTS WHERE CTE_FACTS.CATEGORY_ID = 5 OR CTE_FACTS.PARENT_CATEGORY_ID = 5
);
