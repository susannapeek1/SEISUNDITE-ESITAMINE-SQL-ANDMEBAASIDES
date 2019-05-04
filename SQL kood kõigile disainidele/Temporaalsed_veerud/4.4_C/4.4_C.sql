CREATE DOMAIN D_ajapiirang TIMESTAMP WITHOUT TIME ZONE NULL CONSTRAINT chk_ajapiirang CHECK (VALUE>='2000-01-01' AND VALUE<'2200-01-01');
CREATE TABLE Tellimus (
					   tellimuse_nr serial NOT NULL,
                       kohaletoimetamise_aadress varchar(1000) NOT NULL,
                       ootel_aeg D_ajapiirang,
                       tootlemisel_aeg D_ajapiirang,
                       valja_saadetud_aeg D_ajapiirang,
                       kohale_toimetatud_aeg D_ajapiirang,
                       tuhistatud_aeg D_ajapiirang,
                       CONSTRAINT PK_Tellimus PRIMARY KEY (tellimuse_nr), 
					   Tellimus_saab_olla_maksimaalselt_uhes_seisundis CHECK (num_nonnulls(ootel_aeg, tootlemisel_aeg, kohale_toimetatud_aeg, valja_saadetud_aeg, tuhistatud_aeg)=1));
CREATE INDEX IDX_Tellimus_ootel ON Tellimus(ootel_aeg)
WHERE ootel_aeg IS NOT NULL;
CREATE INDEX IDX_Tellimus_tootlemisel ON Tellimus(tootlemisel_aeg)
WHERE tootlemisel_aeg IS NOT NULL;
CREATE INDEX IDX_Tellimus_valja_saadetud ON Tellimus(valja_saadetud_aeg)
WHERE valja_saadetud_aeg IS NOT NULL;
CREATE INDEX IDX_Tellimus_kohale_toimetatud ON Tellimus(kohale_toimetatud_aeg)
WHERE kohale_toimetatud_aeg IS NOT NULL;
CREATE INDEX IDX_Tellimus_tuhistatud ON Tellimus(tuhistatud_aeg)
WHERE tuhistatud_aeg IS NOT NULL;