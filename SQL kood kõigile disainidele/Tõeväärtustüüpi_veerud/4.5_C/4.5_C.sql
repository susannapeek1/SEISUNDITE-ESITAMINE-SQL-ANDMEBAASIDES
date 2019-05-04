CREATE TABLE Tellimus (
	tellimuse_nr serial NOT NULL,
	kohaletoimetamise_aadress varchar(1000) NOT NULL,
	on_ootel boolean NOT NULL DEFAULT TRUE,
	on_tootlemisel boolean NOT NULL,
	on_valja_saadetud boolean NOT NULL,
	on_kohale_toimetatud boolean NOT NULL,
	on_tuhistatud boolean NOT NULL,
	seisundimuudatuse_aeg timestamp without time zone NOT NULL DEFAULT LOCALTIMESTAMP(0),
	CONSTRAINT PK_Tellimus PRIMARY KEY (tellimuse_nr),
	CONSTRAINT CHK_Tellimuse_seisundimuudatuse_ajapiirang CHECK (seisundimuudatuse_aeg>='2000-01-01' AND seisundimuudatuse_aeg<'2200-01-01'),
	CONSTRAINT CHK_Tellimus_saab_olla_maksimaalselt_uhes_seisundis CHECK (((on_ootel=true)::int + (on_tootlemisel=true)::int + (on_valja_saadetud=true)::int + (on_kohale_toimetatud=true)::int + (on_tuhistatud=true)::int )=1));
CREATE INDEX IDX_Tellimus_ootel ON Tellimus(on_ootel) 
WHERE on_ootel = TRUE;
CREATE INDEX IDX_Tellimus_tootlemisel ON Tellimus(on_tootlemisel) 
WHERE on_tootlemisel = TRUE;
CREATE INDEX IDX_Tellimus_valja_saadetud ON Tellimus(on_valja_saadetud) 
WHERE on_valja_saadetud = TRUE;
CREATE INDEX IDX_Tellimus_kohale_toimetatud ON Tellimus(on_kohale_toimetatud) 
WHERE on_kohale_toimetatud = TRUE;
CREATE INDEX IDX_Tellimus_tuhistatud ON Tellimus(on_tuhistatud) 
WHERE on_tuhistatud = TRUE;
CREATE OR REPLACE FUNCTION F_kontroll_seisundi_vaartuse_ja_aja_muutusele() RETURNS TRIGGER AS $$
BEGIN
NEW.seisundimuudatuse_aeg = LOCALTIMESTAMP(0);
RETURN NEW;
END;$$ LANGUAGE plpgsql SECURITY DEFINER
SET search_path = toevaartustuupi_veerud, pg_temp;
CREATE TRIGGER T_kontroll_seisundi_vaartuse_ja_aja_muutusele
BEFORE UPDATE OF on_ootel,on_tootlemisel,on_valja_saadetud,on_kohale_toimetatud,on_tuhistatud ON Tellimus
FOR EACH ROW
WHEN (NEW.on_ootel<>OLD.on_ootel 
	  OR NEW.on_tootlemisel<>OLD.on_tootlemisel 
	  OR NEW.on_valja_saadetud<>OLD.on_valja_saadetud 
	  OR NEW.on_kohale_toimetatud<>OLD.on_kohale_toimetatud 
	  OR NEW.on_tuhistatud<>OLD.on_tuhistatud)
EXECUTE FUNCTION F_kontroll_seisundi_vaartuse_ja_aja_muutusele();