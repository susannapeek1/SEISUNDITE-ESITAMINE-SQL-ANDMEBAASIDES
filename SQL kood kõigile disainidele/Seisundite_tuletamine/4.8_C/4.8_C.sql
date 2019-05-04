CREATE DOMAIN D_ajapiirang TIMESTAMP WITHOUT TIME ZONE CONSTRAINT chk_ajapiirang CHECK (VALUE>='2000-01-01' AND VALUE<'2200-01-01');
CREATE TABLE Tellimus (
	tellimuse_nr serial NOT NULL,
	esitamise_aeg D_ajapiirang NOT NULL DEFAULT LOCALTIMESTAMP(0),
	kohaletoimetamise_aadress varchar(1000) NOT NULL,
	CONSTRAINT PK_Tellimus PRIMARY KEY (tellimuse_nr));
CREATE TABLE Arve (
	tellimuse_nr integer NOT NULL,
	tasumise_aeg D_ajapiirang NULL,
	CONSTRAINT PK_Arve PRIMARY KEY (tellimuse_nr),
	CONSTRAINT FK_Arve_Tellimus FOREIGN KEY (tellimuse_nr) REFERENCES Tellimus (tellimuse_nr) ON DELETE Cascade ON UPDATE No Action);
CREATE TABLE Saadetis (
	tellimuse_nr integer NOT NULL,
	valjastamise_aeg D_ajapiirang NOT NULL DEFAULT LOCALTIMESTAMP(0),
	kliendile_uleandmise_aeg D_ajapiirang NULL,
	CONSTRAINT PK_Saadetis PRIMARY KEY (tellimuse_nr),
	CONSTRAINT CHK_Saadetise_uleandmisaeg_hilisem_kui_valjastamisaeg CHECK (kliendile_uleandmise_aeg>=valjastamise_aeg),
	CONSTRAINT FK_Saadetis_Tellimus FOREIGN KEY (tellimuse_nr) REFERENCES Tellimus (tellimuse_nr) ON DELETE Cascade ON UPDATE No Action);
CREATE TABLE Tellimuse_tuhistamine (
	tellimuse_nr integer NOT NULL,
	tuhistamise_aeg D_ajapiirang NOT NULL DEFAULT LOCALTIMESTAMP(0),
	CONSTRAINT PK_Tellimuse_tuhistamine PRIMARY KEY (tellimuse_nr),
	CONSTRAINT FK_Tellimuse_tuhistamine_Tellimus FOREIGN KEY (tellimuse_nr) REFERENCES Tellimus (tellimuse_nr) ON DELETE Cascade ON UPDATE No Action);
CREATE INDEX IDX_Arve_tasumise_aeg ON Arve(tasumise_aeg) 
WHERE tasumise_aeg IS NOT NULL;
CREATE INDEX IDX_Saadetis_valjastamise_aeg ON Saadetis(valjastamise_aeg) 
WHERE valjastamise_aeg IS NOT NULL;
CREATE INDEX IDX_Saadetis_kliendile_uleandmise_aeg ON Saadetis(kliendile_uleandmise_aeg) 
WHERE kliendile_uleandmise_aeg IS NOT NULL;