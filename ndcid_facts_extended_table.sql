CREATE TABLE AOL_SCHEMA.FACTS_EXTENDED(
    "QUERYID" DEC(18,0),
    "TIMEID" DEC(18,0),
    "ANONID" DEC(18,0),
    "URLID" DEC(18,0),
    "NDCID" DEC(18,0),
    "IRANK" VARCHAR(100) UTF8,
    "CLICK" BOOLEAN
);

INSERT INTO FACTS_EXTENDED
SELECT
    "FACTS".QUERYID AS QUERYID,
    "FACTS".TIMEID AS TIMEID,
    "FACTS".ANONID AS ANONID,
    "FACTS".URLID AS URLID,
    CASE WHEN "NDCDIM".ID IS NULL THEN -1 ELSE "NDCDIM".ID END,
    "FACTS".IRANK AS IRANK,
    "FACTS".CLICK AS CLICK
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
    "QUERYDIM_EXTENDED"
ON
    "QUERYDIM_EXTENDED"."ID" = "FACTS"."QUERYID"
LEFT JOIN
    "NDCDIM"
ON
    "QUERYDIM_EXTENDED"."Category" = "NDCDIM"."CATEGORY"
LEFT JOIN
    "URLDIM"
ON
    "URLDIM"."ID" = "FACTS"."URLID";