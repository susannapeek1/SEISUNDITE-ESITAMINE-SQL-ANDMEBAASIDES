CREATE DOMAIN d_ajapiirang TIMESTAMP WITHOUT TIME ZONE NULL CONSTRAINT chk_ajapiirang CHECK (VALUE>='2000-01-01' AND VALUE<'2200-01-01');
CREATE TABLE tellimus (
	tellimuse_nr SERIAL NOT NULL,
    kohaletoimetamise_aadress VARCHAR(1000) NOT NULL,
    ootel_aeg d_ajapiirang,
    tootlemisel_aeg d_ajapiirang,
    valja_saadetud_aeg d_ajapiirang,
    kohale_toimetatud_aeg d_ajapiirang,
    tuhistatud_aeg d_ajapiirang,
    CONSTRAINT PK_Tellimus PRIMARY KEY (tellimuse_nr), 
    Tellimus_saab_olla_maksimaalselt_uhes_seisundis CHECK (num_nonnulls(ootel_aeg, tootlemisel_aeg, kohale_toimetatud_aeg, valja_saadetud_aeg, tuhistatud_aeg)=1));
CREATE INDEX idx_Tellimus_ootel ON tellimus (ootel_aeg)
WHERE ootel_aeg IS NOT NULL;
CREATE INDEX idx_Tellimus_tootlemisel ON tellimus (tootlemisel_aeg)
WHERE tootlemisel_aeg IS NOT NULL;
CREATE INDEX idx_Tellimus_valja_saadetud ON tellimus (valja_saadetud_aeg)
WHERE valja_saadetud_aeg IS NOT NULL;
CREATE INDEX idx_Tellimus_kohale_toimetatud ON tellimus (kohale_toimetatud_aeg)
WHERE kohale_toimetatud_aeg IS NOT NULL;
CREATE INDEX idx_Tellimus_tuhistatud ON tellimus (tuhistatud_aeg)
WHERE tuhistatud_aeg IS NOT NULL;