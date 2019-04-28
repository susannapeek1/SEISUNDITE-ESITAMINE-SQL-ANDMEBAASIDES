CREATE TABLE Tellimuse_seisundi_liik (
	tellimuse_seisundi_liik_kood smallint NOT NULL,
	nimetus varchar(50) NOT NULL,
	CONSTRAINT PK_Tellimuse_seisundi_liik PRIMARY KEY (tellimuse_seisundi_liik_kood),
	CONSTRAINT AK_Tellimuse_seisundi_liik_nimetus UNIQUE (nimetus));
CREATE TABLE Tellimus (
	tellimuse_nr serial NOT NULL,
	kohaletoimetamise_aadress varchar(1000) NOT NULL,
	tellimuse_seisundi_liik_kood smallint NOT NULL DEFAULT 1,
	seisundimuudatuse_aeg timestamp without time zone NOT NULL DEFAULT LOCALTIMESTAMP(0),
	CONSTRAINT PK_Tellimus PRIMARY KEY (tellimuse_nr),
	CONSTRAINT CHK_Tellimuse_seisundimuudatuse_ajapiirang CHECK (seisundimuudatuse_aeg>='2000-01-01' AND seisundimuudatuse_aeg<'2200-01-01'),
	CONSTRAINT FK_Tellimus_Tellimuse_seisundi_liik FOREIGN KEY (tellimuse_seisundi_liik_kood) REFERENCES Tellimuse_seisundi_liik (tellimuse_seisundi_liik_kood) ON DELETE No Action ON UPDATE Cascade);
CREATE INDEX IXFK_Tellimus_Tellimuse_seisundi_liik ON Tellimus (tellimuse_seisundi_liik_kood ASC);
CREATE OR REPLACE FUNCTION F_kontroll_seisundi_vaartuse_ja_aja_muutusele() RETURNS TRIGGER AS $$
BEGIN
NEW.seisundimuudatuse_aeg = LOCALTIMESTAMP(0);
RETURN NEW;
END;$$ LANGUAGE plpgsql SECURITY DEFINER
SET search_path = seisundiklassifikaator, pg_temp;
CREATE TRIGGER T_kontroll_seisundi_vaartuse_ja_aja_muutusele
BEFORE UPDATE OF tellimuse_seisundi_liik_kood ON Tellimus
FOR EACH ROW
WHEN (OLD.tellimuse_seisundi_liik_kood<>NEW.tellimuse_seisundi_liik_kood)
EXECUTE FUNCTION F_kontroll_seisundi_vaartuse_ja_aja_muutusele();