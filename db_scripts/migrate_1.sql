USE atelier_bd;

ALTER TABLE singer
RENAME TO musician,
RENAME COLUMN singerName TO musicianName;

ALTER TABLE musician
ADD COLUMN role varchar(50);

UPDATE musician
SET role =
    CASE
        WHEN musicianName = 'Alina' THEN 'vocals'
        WHEN musicianName = 'Mysterio' THEN 'guitar'
        WHEN musicianName = 'Rainbow' THEN 'percussion'
        WHEN musicianName = 'Luna' THEN 'piano'
    END;

CREATE TABLE band (
    bandName varchar(50) PRIMARY KEY,
    creation YEAR,
    genre varchar(50)
);

ALTER TABLE musician
ADD COLUMN bandName varchar(50);



INSERT INTO band VALUES ('Crazy Duo', 2015, 'rock'), ('Luna', 2009, 'classical'), ('Mysterio', 2019, 'pop');

UPDATE musician AS m
LEFT JOIN band AS b ON m.musicianName = b.bandName
SET m.bandName = IFNULL(b.bandName, (SELECT bandName FROM band LIMIT 1));

