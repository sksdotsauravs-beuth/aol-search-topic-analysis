CREATE TABLE AOL_SCHEMA.NATURAL_DISASTER_CATEGORY(
    "CATEGORY_ID" DEC(36,0),
    "CATEGORY" VARCHAR(512),
    "PARENT_CATEGORY_ID" DEC(36),
    "RELEVANT_TAGS" VARCHAR(1024)
);

IMPORT INTO AOL_SCHEMA.NATURAL_DISASTER_CATEGORY
FROM LOCAL CSV FILE 'C:\\semicolon-separated.csv' COLUMN SEPARATOR = ';';