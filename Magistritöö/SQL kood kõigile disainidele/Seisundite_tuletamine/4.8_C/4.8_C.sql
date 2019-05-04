CREATE DOMAIN d_ajapiirang TIMESTAMP WITHOUT TIME ZONE CONSTRAINT chk_ajapiirang CHECK (VALUE>='2000-01-01' AND VALUE<'2200-01-01');
CREATE TABLE tellimus (
	tellimuse_nr serial NOT NULL,
	esitamise_aeg d_ajapiirang NOT NULL DEFAULT LOCALTIMESTAMP(0),
	kohaletoimetamise_aadress VARCHAR(1000) NOT NULL,
	CONSTRAINT PK_Tellimus PRIMARY KEY (tellimuse_nr));
CREATE TABLE arve (
	tellimuse_nr INTEGER NOT NULL,
	tasumise_aeg d_ajapiirang NULL,
	CONSTRAINT PK_Arve PRIMARY KEY (tellimuse_nr),
	CONSTRAINT FK_Arve_Tellimus FOREIGN KEY (tellimuse_nr) REFERENCES Tellimus (tellimuse_nr) ON DELETE Cascade ON UPDATE No Action);
CREATE TABLE saadetis (
	tellimuse_nr INTEGER NOT NULL,
	valjastamise_aeg d_ajapiirang NOT NULL DEFAULT LOCALTIMESTAMP(0),
	kliendile_uleandmise_aeg d_ajapiirang NULL,
	CONSTRAINT PK_Saadetis PRIMARY KEY (tellimuse_nr),
	CONSTRAINT CHK_Saadetise_uleandmisaeg_hilisem_kui_valjastamisaeg CHECK (kliendile_uleandmise_aeg>=valjastamise_aeg),
	CONSTRAINT FK_Saadetis_Tellimus FOREIGN KEY (tellimuse_nr) REFERENCES Tellimus (tellimuse_nr) ON DELETE Cascade ON UPDATE No Action);
CREATE TABLE tellimuse_tuhistamine (
	tellimuse_nr INTEGER NOT NULL,
	tuhistamise_aeg d_ajapiirang NOT NULL DEFAULT LOCALTIMESTAMP(0),
	CONSTRAINT PK_Tellimuse_tuhistamine PRIMARY KEY (tellimuse_nr),
	CONSTRAINT FK_Tellimuse_tuhistamine_Tellimus FOREIGN KEY (tellimuse_nr) REFERENCES tellimus (tellimuse_nr) ON DELETE Cascade ON UPDATE No Action);
CREATE INDEX idx_Arve_tasumise_aeg ON arve (tasumise_aeg) 
WHERE tasumise_aeg IS NOT NULL;
CREATE INDEX idx_Saadetis_valjastamise_aeg ON saadetis (valjastamise_aeg) 
WHERE valjastamise_aeg IS NOT NULL;
CREATE INDEX idx_Saadetis_kliendile_uleandmise_aeg ON saadetis (kliendile_uleandmise_aeg) 
WHERE kliendile_uleandmise_aeg IS NOT NULL;