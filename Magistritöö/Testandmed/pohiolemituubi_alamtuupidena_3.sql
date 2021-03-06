START TRANSACTION;

INSERT INTO pohiolemituubi_alamtuupidena_3.tellimus (tellimuse_nr, kohaletoimetamise_aadress) 
SELECT tellimuse_nr, kohaletoimetamise_aadress 
FROM seisundiklassifikaator_3.tellimus;

INSERT INTO pohiolemituubi_alamtuupidena_3.ootel_tellimus (tellimuse_nr, seisundimuudatuse_aeg) 
SELECT tellimuse_nr, seisundimuudatuse_aeg 
FROM seisundiklassifikaator_3.tellimus 
WHERE seisundiklassifikaator_3.tellimus.tellimuse_seisundi_liik_kood=1;

INSERT INTO pohiolemituubi_alamtuupidena_3.tootlemisel_tellimus (tellimuse_nr, seisundimuudatuse_aeg) 
SELECT tellimuse_nr, seisundimuudatuse_aeg 
FROM seisundiklassifikaator_3.tellimus 
WHERE seisundiklassifikaator_3.tellimus.tellimuse_seisundi_liik_kood=2;

INSERT INTO pohiolemituubi_alamtuupidena_3.valja_saadetud_tellimus (tellimuse_nr, seisundimuudatuse_aeg) 
SELECT tellimuse_nr, seisundimuudatuse_aeg 
FROM seisundiklassifikaator_3.tellimus 
WHERE seisundiklassifikaator_3.tellimus.tellimuse_seisundi_liik_kood=3;

INSERT INTO pohiolemituubi_alamtuupidena_3.kohale_toimetatud_tellimus (tellimuse_nr, seisundimuudatuse_aeg) 
SELECT tellimuse_nr, seisundimuudatuse_aeg 
FROM seisundiklassifikaator_3.tellimus 
WHERE seisundiklassifikaator_3.tellimus.tellimuse_seisundi_liik_kood=4;

INSERT INTO pohiolemituubi_alamtuupidena_3.tuhistatud_tellimus (tellimuse_nr, seisundimuudatuse_aeg) 
SELECT tellimuse_nr, seisundimuudatuse_aeg 
FROM seisundiklassifikaator_3.tellimus 
WHERE seisundiklassifikaator_3.tellimus.tellimuse_seisundi_liik_kood=5;

COMMIT;

