START TRANSACTION;

INSERT INTO seisundite_tuletamine_2.tellimus (tellimuse_nr,esitamise_aeg,kohaletoimetamise_aadress)
SELECT 
tellimuse_nr,
seisundimuudatuse_aeg,
kohaletoimetamise_aadress
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 1;

INSERT INTO seisundite_tuletamine_2.arve (tellimuse_nr, tasumise_aeg)
SELECT
tellimuse_nr,
NULL
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 1
ORDER BY RANDOM()
LIMIT 159825;


INSERT INTO seisundite_tuletamine_2.tellimus (tellimuse_nr, esitamise_aeg, kohaletoimetamise_aadress)
SELECT
tellimuse_nr,
seisundimuudatuse_aeg - '1 day'::INTERVAL,
kohaletoimetamise_aadress
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 5;

INSERT INTO seisundite_tuletamine_2.tellimuse_tuhistamine (tellimuse_nr, tuhistamise_aeg)
SELECT
tellimuse_nr,
seisundimuudatuse_aeg
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 5;

INSERT INTO seisundite_tuletamine_2.arve (tellimuse_nr, tasumise_aeg)
SELECT
tellimuse_nr,
NULL
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 5;


INSERT INTO seisundite_tuletamine_2.tellimus (tellimuse_nr, esitamise_aeg, kohaletoimetamise_aadress)
SELECT
tellimuse_nr,
seisundimuudatuse_aeg - '1 day'::INTERVAL,
kohaletoimetamise_aadress
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 2;

INSERT INTO seisundite_tuletamine_2.arve (tellimuse_nr, tasumise_aeg)
SELECT
tellimuse_nr,
seisundimuudatuse_aeg
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 2;


INSERT INTO seisundite_tuletamine_2.tellimus (tellimuse_nr, esitamise_aeg, kohaletoimetamise_aadress)
SELECT
tellimuse_nr,
seisundimuudatuse_aeg - '2 day'::INTERVAL,
kohaletoimetamise_aadress
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 3;

INSERT INTO seisundite_tuletamine_2.arve (tellimuse_nr, tasumise_aeg)
SELECT
tellimuse_nr,
seisundimuudatuse_aeg - '1 day'::INTERVAL
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 3;

INSERT INTO seisundite_tuletamine_2.saadetis (tellimuse_nr, valjastamise_aeg, kliendile_uleandmise_aeg)
SELECT
tellimuse_nr,
seisundimuudatuse_aeg,
NULL
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 3;


INSERT INTO seisundite_tuletamine_2.tellimus (tellimuse_nr, esitamise_aeg, kohaletoimetamise_aadress)
SELECT
tellimuse_nr,
seisundimuudatuse_aeg - '3 day'::INTERVAL,
kohaletoimetamise_aadress
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 4;

INSERT INTO seisundite_tuletamine_2.arve (tellimuse_nr, tasumise_aeg)
SELECT
tellimuse_nr,
seisundimuudatuse_aeg - '2 day'::INTERVAL
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 4;

INSERT INTO seisundite_tuletamine_2.saadetis (tellimuse_nr, valjastamise_aeg, kliendile_uleandmise_aeg)
SELECT
tellimuse_nr,
seisundimuudatuse_aeg -'1 day'::INTERVAL,
seisundimuudatuse_aeg
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 4;

COMMIT;