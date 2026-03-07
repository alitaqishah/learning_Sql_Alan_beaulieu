USE SAKILA;
CREATE TABLE string_tbl
(char_fld CHAR(30),
vchar_fld VARCHAR(30),
text_fld TEXT
);

INSERT INTO string_tbl (char_fld, vchar_fld, text_fld)
VALUES('This is char data',
'This is varchar data',
'This is text data');

UPDATE string_tbl
SET vchar_fld = 'This is a piece of extrememly long varchar data';

SELECT @@session.sql_mode;
SET sql_mode = 'ansi';

SELECT @@session.sql_mode;

SHOW WARNINGS;

SELECT vchar_fld
FROM string_tbl;

UPDATE string_tbl
SET text_fld = 'This string doesn't  work';

UPDATE string_tbl
SET text_fld = 'This string didn''t work, but it does now';
