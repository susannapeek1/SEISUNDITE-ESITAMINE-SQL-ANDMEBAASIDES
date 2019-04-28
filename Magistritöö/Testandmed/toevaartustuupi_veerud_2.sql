INSERT INTO toevaartustuupi_veerud_2.tellimus (tellimuse_nr, kohaletoimetamise_aadress, on_ootel, on_tootlemisel, on_valja_saadetud, on_kohale_toimetatud, on_tuhistatud, seisundimuudatuse_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
TRUE,
FALSE,
FALSE,
FALSE,
FALSE,
seisundimuudatuse_aeg
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 1;

INSERT INTO toevaartustuupi_veerud_2.tellimus (tellimuse_nr, kohaletoimetamise_aadress, on_ootel, on_tootlemisel, on_valja_saadetud, on_kohale_toimetatud, on_tuhistatud, seisundimuudatuse_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
FALSE,
TRUE,
FALSE,
FALSE,
FALSE,
seisundimuudatuse_aeg
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 2;

INSERT INTO toevaartustuupi_veerud_2.tellimus (tellimuse_nr, kohaletoimetamise_aadress, on_ootel, on_tootlemisel, on_valja_saadetud, on_kohale_toimetatud, on_tuhistatud, seisundimuudatuse_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
FALSE,
FALSE,
TRUE,
FALSE,
FALSE,
seisundimuudatuse_aeg
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 3;

INSERT INTO toevaartustuupi_veerud_2.tellimus (tellimuse_nr, kohaletoimetamise_aadress, on_ootel, on_tootlemisel, on_valja_saadetud, on_kohale_toimetatud, on_tuhistatud, seisundimuudatuse_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
FALSE,
FALSE,
FALSE,
TRUE,
FALSE,
seisundimuudatuse_aeg
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 4;

INSERT INTO toevaartustuupi_veerud_2.tellimus (tellimuse_nr, kohaletoimetamise_aadress, on_ootel, on_tootlemisel, on_valja_saadetud, on_kohale_toimetatud, on_tuhistatud, seisundimuudatuse_aeg)
SELECT 
tellimuse_nr,
kohaletoimetamise_aadress,
FALSE,
FALSE,
FALSE,
FALSE,
TRUE,
seisundimuudatuse_aeg
FROM seisundiklassifikaator_2.tellimus WHERE seisundiklassifikaator_2.tellimus.tellimuse_seisundi_liik_kood = 5;
