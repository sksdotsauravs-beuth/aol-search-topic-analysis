DELETE FROM
    FACTS
WHERE
    "FACTS"."QUERYID" IS NULL
    AND "FACTS"."TIMEID" IS NULL
    AND "FACTS"."ANONID" IS NULL
    AND "FACTS"."URLID" IS NULL;