OPEN SCHEMA "AOL_SCHEMA";

SELECT
        "ANONIDDIM"."ANONID" AS 'USER_ANONYMOUS_ID',
        TO_TIMESTAMP("TIMEDIM"."YEAR" || '-' || "TIMEDIM"."MONTH" || '-' || "TIMEDIM"."DAY_OF_THE_MONTH" || ' ' || "TIMEDIM"."HOUR" || ':' || "TIMEDIM"."MINUTE" || ':' || "TIMEDIM"."SECOND", 'YYYY-MONTH-DD HH:MI:SS') AS 'TIME_OF_SEARCH',
        "QUERYDIM"."QUERY" AS 'SEARCH_QUERY',
        "URLDIM"."URL" AS 'CLICKED_URL',
        "FACTS"."IRANK" AS 'RANK_OF_URL',
        "DMOZ_CATEGORIES"."TOPIC" AS 'TOPIC'
FROM
        "FACTS"
LEFT JOIN
        "ANONIDDIM"
ON
        "ANONIDDIM"."ID" = "FACTS"."ANONID"
LEFT JOIN
        "TIMEDIM"
ON
        "TIMEDIM"."ID" = "FACTS"."TIMEID"
LEFT JOIN
        "QUERYDIM"
ON
        "QUERYDIM"."ID" = "FACTS"."QUERYID"
LEFT JOIN
        "URLDIM"
ON
        "URLDIM"."ID" = "FACTS"."URLID"
LEFT JOIN
        "URL_CATEGORY"
ON
        "URL_CATEGORY"."URLID" = "URLDIM"."ID"
LEFT JOIN
        "DMOZ_CATEGORIES"
ON
        "DMOZ_CATEGORIES"."CATID" = "URL_CATEGORY"."CATEGORYID"
WHERE
        "FACTS"."CLICK" IS TRUE
        AND (
                "QUERYDIM"."QUERY" LIKE '%natural disaster%'
                OR "QUERYDIM"."QUERY" LIKE '%landslide%'
                OR "QUERYDIM"."QUERY" LIKE '%storm%'
                OR "QUERYDIM"."QUERY" LIKE '%avalanches%'
                OR "QUERYDIM"."QUERY" LIKE '%earthquake%'
                OR "QUERYDIM"."QUERY" LIKE '%sinkholes%'
                OR "QUERYDIM"."QUERY" LIKE '%volcanic%'
                OR "QUERYDIM"."QUERY" LIKE '%flood%'
                OR "QUERYDIM"."QUERY" LIKE '%tsunami%'
                OR "QUERYDIM"."QUERY" LIKE '%cyclone%'
                OR "QUERYDIM"."QUERY" LIKE '%blizzard%'
                OR "QUERYDIM"."QUERY" LIKE '%drought%'
                OR "QUERYDIM"."QUERY" LIKE '%tornado%'
                OR "QUERYDIM"."QUERY" LIKE '%hurricane%'
                OR "QUERYDIM"."QUERY" LIKE '%wildfire%'
                OR "QUERYDIM"."QUERY" LIKE '%heatwaves%'
                OR "QUERYDIM"."QUERY" LIKE '%coldwaves%'
        )
        AND (
                "DMOZ_CATEGORIES"."CATID" = 812035
                OR "DMOZ_CATEGORIES"."FATHERID" = 812035
        )
ORDER BY
        TO_TIMESTAMP("TIMEDIM"."YEAR" || '-' || "TIMEDIM"."MONTH" || '-' || "TIMEDIM"."DAY_OF_THE_MONTH" || ' ' || "TIMEDIM"."HOUR" || ':' || "TIMEDIM"."MINUTE" || ':' || "TIMEDIM"."SECOND", 'YYYY-MONTH-DD HH:MI:SS');
