START TRANSACTION;

INSERT INTO vektorkodeerimine.tellimus (tellimuse_nr, kohaletoimetamise_aadress, seisund, seisundimuudatuse_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
'10000',
seisundimuudatuse_aeg
FROM seisundiklassifikaator.tellimus WHERE seisundiklassifikaator.tellimus.tellimuse_seisundi_liik_kood = 1;

INSERT INTO vektorkodeerimine.tellimus (tellimuse_nr, kohaletoimetamise_aadress, seisund, seisundimuudatuse_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
'01000',
seisundimuudatuse_aeg
FROM seisundiklassifikaator.tellimus WHERE seisundiklassifikaator.tellimus.tellimuse_seisundi_liik_kood = 2;

INSERT INTO vektorkodeerimine.tellimus (tellimuse_nr, kohaletoimetamise_aadress, seisund, seisundimuudatuse_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
'00100',
seisundimuudatuse_aeg
FROM seisundiklassifikaator.tellimus WHERE seisundiklassifikaator.tellimus.tellimuse_seisundi_liik_kood = 3;

INSERT INTO vektorkodeerimine.tellimus (tellimuse_nr, kohaletoimetamise_aadress, seisund, seisundimuudatuse_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
'00010',
seisundimuudatuse_aeg
FROM seisundiklassifikaator.tellimus WHERE seisundiklassifikaator.tellimus.tellimuse_seisundi_liik_kood = 4;

INSERT INTO vektorkodeerimine.tellimus (tellimuse_nr, kohaletoimetamise_aadress, seisund, seisundimuudatuse_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
'00001',
seisundimuudatuse_aeg
FROM seisundiklassifikaator.tellimus WHERE seisundiklassifikaator.tellimus.tellimuse_seisundi_liik_kood = 5;

COMMIT;