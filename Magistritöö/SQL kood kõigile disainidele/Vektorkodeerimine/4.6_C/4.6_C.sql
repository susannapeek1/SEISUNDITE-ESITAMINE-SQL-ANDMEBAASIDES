CREATE TABLE Tellimus (
	tellimuse_nr serial NOT NULL,
	kohaletoimetamise_aadress varchar(1000) NOT NULL,
	seisund text NOT NULL,
	seisundimuudatuse_aeg timestamp without time zone NOT NULL   DEFAULT LOCALTIMESTAMP(0),
	CONSTRAINT PK_Tellimus PRIMARY KEY (tellimuse_nr),
	CONSTRAINT CHK_Tellimuse_seisundimuudatuse_ajapiirang CHECK (seisundimuudatuse_aeg>='2000-01-01' AND seisundimuudatuse_aeg<'2200-01-01'),
	CONSTRAINT CHK_Tellimuse_seisund_peab_vastama_kodeerimisreeglitele CHECK (seisund~'^([0-1]{5})$'),
	CONSTRAINT CHK_Tellimus_saab_olla_maksimaalselt_uhes_seisundis CHECK (seisund LIKE '%1%'AND seisund NOT LIKE '%1%1%'));
CREATE OR REPLACE FUNCTION F_seisundi_dekodeerimine(seisund text) 
RETURNS TEXT AS $$
SELECT CASE
	WHEN seisund = '10000' THEN 'Ootel'
	WHEN seisund = '01000' THEN 'Töötlemisel'
	WHEN seisund = '00100' THEN 'Välja saadetud'
	WHEN seisund = '00010' THEN 'Kohale toimetatud'
	WHEN seisund = '00001' THEN 'Tühistatud'
END AS seisundi_tulem;
$$ LANGUAGE sql;
CREATE INDEX IDX_tellimus_seisundi_dekodeerimine ON Tellimus (f_seisundi_dekodeerimine(seisund));
CREATE OR REPLACE FUNCTION F_kontroll_seisundi_vaartuse_ja_aja_muutusele() RETURNS TRIGGER AS $$
BEGIN
NEW.seisundimuudatuse_aeg = LOCALTIMESTAMP(0);
RETURN NEW;
END;$$ LANGUAGE plpgsql SECURITY DEFINER
SET search_path = vektorkodeerimine, pg_temp;
CREATE TRIGGER T_kontroll_seisundi_vaartuse_ja_aja_muutusele
BEFORE UPDATE OF seisund ON Tellimus
FOR EACH ROW
WHEN (OLD.seisund<>NEW.seisund)
EXECUTE FUNCTION F_kontroll_seisundi_vaartuse_ja_aja_muutusele();