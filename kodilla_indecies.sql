USE MS;

EXPLAIN SELECT * FROM BOOKS
WHERE TITLE="In Search of Lost Time";

ALTER TABLE BOOKS ADD INDEX (TITLE);

EXPLAIN SELECT * FROM BOOKS
WHERE TITLE="In Search of Lost Time";


EXPLAIN SELECT * FROM BOOKS
WHERE TITLE="In Search of Lost Time";

EXPLAIN SELECT * FROM readers
WHERE FIRSTNAME="JOHN";


ALTER TABLE readers ADD INDEX (FIRSTNAME);

EXPLAIN SELECT * FROM readers
WHERE FIRSTNAME="JOHN";
