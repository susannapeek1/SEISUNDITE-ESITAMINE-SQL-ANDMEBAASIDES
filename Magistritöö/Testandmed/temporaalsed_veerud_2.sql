INSERT INTO temporaalsed_veerud_2.tellimus (tellimuse_nr, kohaletoimetamise_aadress, ootel_aeg, tootlemisel_aeg, valja_saadetud_aeg, kohale_toimetatud_aeg, tuhistatud_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
seisundimuudatuse_aeg,
NULL,
NULL,
NULL,
NULL
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 1;

INSERT INTO temporaalsed_veerud_2.tellimus (tellimuse_nr, kohaletoimetamise_aadress, ootel_aeg, tootlemisel_aeg, valja_saadetud_aeg, kohale_toimetatud_aeg, tuhistatud_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
NULL,
seisundimuudatuse_aeg,
NULL,
NULL,
NULL
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 2;

INSERT INTO temporaalsed_veerud_2.tellimus (tellimuse_nr, kohaletoimetamise_aadress, ootel_aeg, tootlemisel_aeg, valja_saadetud_aeg, kohale_toimetatud_aeg, tuhistatud_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
NULL,
NULL,
seisundimuudatuse_aeg,
NULL,
NULL
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 3;

INSERT INTO temporaalsed_veerud_2.tellimus (tellimuse_nr, kohaletoimetamise_aadress, ootel_aeg, tootlemisel_aeg, valja_saadetud_aeg, kohale_toimetatud_aeg, tuhistatud_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
NULL,
NULL,
NULL,
seisundimuudatuse_aeg,
NULL
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 4;

INSERT INTO temporaalsed_veerud_2.tellimus (tellimuse_nr, kohaletoimetamise_aadress, ootel_aeg, tootlemisel_aeg, valja_saadetud_aeg, kohale_toimetatud_aeg, tuhistatud_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
NULL,
NULL,
NULL,
NULL,
seisundimuudatuse_aeg
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 5;