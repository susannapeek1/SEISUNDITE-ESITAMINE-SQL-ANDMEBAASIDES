START TRANSACTION;

INSERT INTO tellimuse_seisundi_liik 
VALUES (1,'Ootel'), (2,'Töötlemisel'), (3,'Välja saadetud'), (4,'Kohale toimetatud'), (5,'Tühistatud');

INSERT INTO seisundiklassifikaator_3.tellimus (kohaletoimetamise_aadress,tellimuse_seisundi_liik_kood)
SELECT 
md5(random()::text),
floor(random()*(5-1+1) + 1)::int
FROM generate_series(1,2000000);

INSERT INTO seisundiklassifikaator_2.tellimus (tellimuse_nr, kohaletoimetamise_aadress, tellimuse_seisundi_liik_kood, seisundimuudatuse_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
tellimuse_seisundi_liik_kood,
seisundimuudatuse_aeg
FROM seisundiklassifikaator_3.tellimus;

DELETE FROM seisundiklassifikaator_2.tellimus 
WHERE tellimus.tellimuse_nr BETWEEN 1000001 AND 2000000;

INSERT INTO seisundiklassifikaator.tellimus (tellimuse_nr, kohaletoimetamise_aadress, tellimuse_seisundi_liik_kood, seisundimuudatuse_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
tellimuse_seisundi_liik_kood,
seisundimuudatuse_aeg
FROM seisundiklassifikaator_2.tellimus;

DELETE FROM seisundiklassifikaator.tellimus 
WHERE tellimus.tellimuse_nr BETWEEN 500001 AND 1000000;

COMMIT;


