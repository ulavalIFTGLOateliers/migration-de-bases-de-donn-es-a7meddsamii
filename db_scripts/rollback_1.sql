USE atelier_bd;

DROP TABLE IF EXISTS band;

SHOW TABLES;

ALTER TABLE musician
DROP COLUMN role,
DROP COLUMN bandName;

ALTER TABLE musician RENAME to singer;

ALTER TABLE singer RENAME COLUMN musicianName TO singerName;

SHOW TABLES


