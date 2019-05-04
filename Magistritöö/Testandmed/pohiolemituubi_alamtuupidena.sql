START TRANSACTION;

INSERT INTO pohiolemituubi_alamtuupidena.tellimus (tellimuse_nr, kohaletoimetamise_aadress) 
SELECT tellimuse_nr, kohaletoimetamise_aadress 
FROM seisundiklassifikaator.tellimus;

INSERT INTO pohiolemituubi_alamtuupidena.ootel_tellimus (tellimuse_nr, seisundimuudatuse_aeg) 
SELECT tellimuse_nr, seisundimuudatuse_aeg 
FROM seisundiklassifikaator.tellimus 
WHERE seisundiklassifikaator.tellimus.tellimuse_seisundi_liik_kood=1;

INSERT INTO pohiolemituubi_alamtuupidena.tootlemisel_tellimus (tellimuse_nr, seisundimuudatuse_aeg) 
SELECT tellimuse_nr, seisundimuudatuse_aeg 
FROM seisundiklassifikaator.tellimus 
WHERE seisundiklassifikaator.tellimus.tellimuse_seisundi_liik_kood=2;

INSERT INTO pohiolemituubi_alamtuupidena.valja_saadetud_tellimus (tellimuse_nr, seisundimuudatuse_aeg) 
SELECT tellimuse_nr, seisundimuudatuse_aeg 
FROM seisundiklassifikaator.tellimus 
WHERE seisundiklassifikaator.tellimus.tellimuse_seisundi_liik_kood=3;

INSERT INTO pohiolemituubi_alamtuupidena.kohale_toimetatud_tellimus (tellimuse_nr, seisundimuudatuse_aeg) 
SELECT tellimuse_nr, seisundimuudatuse_aeg 
FROM seisundiklassifikaator.tellimus 
WHERE seisundiklassifikaator.tellimus.tellimuse_seisundi_liik_kood=4;

INSERT INTO pohiolemituubi_alamtuupidena.tuhistatud_tellimus (tellimuse_nr, seisundimuudatuse_aeg) 
SELECT tellimuse_nr, seisundimuudatuse_aeg 
FROM seisundiklassifikaator.tellimus 
WHERE seisundiklassifikaator.tellimus.tellimuse_seisundi_liik_kood=5;

COMMIT;

