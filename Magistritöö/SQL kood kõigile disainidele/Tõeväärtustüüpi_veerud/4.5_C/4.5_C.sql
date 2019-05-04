CREATE TABLE tellimus (
	tellimuse_nr SERIAL NOT NULL,
	kohaletoimetamise_aadress VARCHAR(1000) NOT NULL,
	on_ootel BOOLEAN NOT NULL DEFAULT TRUE,
	on_tootlemisel BOOLEAN NOT NULL,
	on_valja_saadetud BOOLEAN NOT NULL,
	on_kohale_toimetatud BOOLEAN NOT NULL,
	on_tuhistatud BOOLEAN NOT NULL,
	seisundimuudatuse_aeg TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT LOCALTIMESTAMP(0),
	CONSTRAINT PK_Tellimus PRIMARY KEY (tellimuse_nr),
	CONSTRAINT CHK_Tellimuse_seisundimuudatuse_ajapiirang CHECK (seisundimuudatuse_aeg>='2000-01-01' AND seisundimuudatuse_aeg<'2200-01-01'),
	CONSTRAINT CHK_Tellimus_saab_olla_maksimaalselt_uhes_seisundis CHECK (((on_ootel=true)::int + (on_tootlemisel=true)::int + (on_valja_saadetud=true)::int + (on_kohale_toimetatud=true)::int + (on_tuhistatud=true)::int )=1));
CREATE INDEX idx_Tellimus_ootel ON tellimus(on_ootel) 
WHERE on_ootel = TRUE;
CREATE INDEX idx_Tellimus_tootlemisel ON tellimus(on_tootlemisel) 
WHERE on_tootlemisel = TRUE;
CREATE INDEX idx_Tellimus_valja_saadetud ON tellimus(on_valja_saadetud) 
WHERE on_valja_saadetud = TRUE;
CREATE INDEX idx_Tellimus_kohale_toimetatud ON tellimus(on_kohale_toimetatud) 
WHERE on_kohale_toimetatud = TRUE;
CREATE INDEX idx_Tellimus_tuhistatud ON tellimus(on_tuhistatud) 
WHERE on_tuhistatud = TRUE;
CREATE OR REPLACE FUNCTION f_kontroll_seisundi_vaartuse_ja_aja_muutusele() RETURNS TRIGGER AS $$
BEGIN
NEW.seisundimuudatuse_aeg = LOCALTIMESTAMP(0);
RETURN NEW;
END;$$ LANGUAGE plpgsql SECURITY DEFINER
SET search_path = toevaartustuupi_veerud, pg_temp;
CREATE TRIGGER t_kontroll_seisundi_vaartuse_ja_aja_muutusele
BEFORE UPDATE OF on_ootel,on_tootlemisel,on_valja_saadetud,on_kohale_toimetatud,on_tuhistatud ON Tellimus
FOR EACH ROW
WHEN (NEW.on_ootel<>OLD.on_ootel 
	  OR NEW.on_tootlemisel<>OLD.on_tootlemisel 
	  OR NEW.on_valja_saadetud<>OLD.on_valja_saadetud 
	  OR NEW.on_kohale_toimetatud<>OLD.on_kohale_toimetatud 
	  OR NEW.on_tuhistatud<>OLD.on_tuhistatud)
EXECUTE FUNCTION f_kontroll_seisundi_vaartuse_ja_aja_muutusele();