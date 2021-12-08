SELECT
	FACTS.QUERYID, QUERYDIM_EXTENDED."Query", QUERYDIM_EXTENDED."Tag"
FROM
	 FACTS
LEFT JOIN
	QUERYDIM_EXTENDED
ON
	FACTS.QUERYID = QUERYDIM_EXTENDED.ID
WHERE
	QUERYDIM_EXTENDED."Tag" = 'lava'
	AND QUERYDIM_EXTENDED."Query" LIKE '%lava%';