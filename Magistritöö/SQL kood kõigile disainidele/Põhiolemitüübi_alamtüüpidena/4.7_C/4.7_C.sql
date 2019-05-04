CREATE DOMAIN d_ajapiirang TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT LOCALTIMESTAMP(0) CONSTRAINT chk_ajapiirang CHECK (VALUE>='2000-01-01' AND VALUE<'2200-01-01');
CREATE TABLE tellimus (
	tellimuse_nr SERIAL NOT NULL,
	kohaletoimetamise_aadress varchar(1000) NOT NULL,
	CONSTRAINT PK_Tellimus PRIMARY KEY (tellimuse_nr));
CREATE TABLE kohale_toimetatud_tellimus (
	tellimuse_nr INTEGER NOT NULL,
	seisundimuudatuse_aeg d_ajapiirang,
	CONSTRAINT PK_Kohale_toimetatud_tellimus PRIMARY KEY (tellimuse_nr),
	CONSTRAINT FK_Kohale_toimetatud_tellimus_Tellimus FOREIGN KEY (tellimuse_nr) REFERENCES Tellimus (tellimuse_nr) ON DELETE Cascade ON UPDATE No Action);
CREATE TABLE ootel_tellimus (
	tellimuse_nr INTEGER NOT NULL,
	seisundimuudatuse_aeg d_ajapiirang,
	CONSTRAINT PK_Ootel_tellimus PRIMARY KEY (tellimuse_nr),
	CONSTRAINT FK_Ootel_tellimus_Tellimus FOREIGN KEY (tellimuse_nr) REFERENCES Tellimus (tellimuse_nr) ON DELETE Cascade ON UPDATE No Action);
CREATE TABLE tootlemisel_tellimus (
	tellimuse_nr INTEGER NOT NULL,
	seisundimuudatuse_aeg d_ajapiirang,
	CONSTRAINT PK_Tootlemisel_tellimus PRIMARY KEY (tellimuse_nr),
	CONSTRAINT FK_Tootlemisel_tellimus_Tellimus FOREIGN KEY (tellimuse_nr) REFERENCES Tellimus (tellimuse_nr) ON DELETE Cascade ON UPDATE No Action);
CREATE TABLE tuhistatud_tellimus (
	tellimuse_nr INTEGER NOT NULL,
	seisundimuudatuse_aeg d_ajapiirang,
	CONSTRAINT PK_Tuhistatud_tellimus PRIMARY KEY (tellimuse_nr),
	CONSTRAINT FK_Tuhistatud_tellimus_Tellimus FOREIGN KEY (tellimuse_nr) REFERENCES Tellimus (tellimuse_nr) ON DELETE Cascade ON UPDATE No Action);
CREATE TABLE valja_saadetud_tellimus (
	tellimuse_nr INTEGER NOT NULL,
	seisundimuudatuse_aeg d_ajapiirang,
	CONSTRAINT PK_Valja_saadetud_tellimus PRIMARY KEY (tellimuse_nr),
	CONSTRAINT FK_Valja_saadetud_tellimus_Tellimus FOREIGN KEY (tellimuse_nr) REFERENCES Tellimus (tellimuse_nr) ON DELETE Cascade ON UPDATE No Action);
CREATE OR REPLACE FUNCTION f_Tellimus_peab_olema_kindlasti_mingis_seisundis() RETURNS TRIGGER AS $$
DECLARE 
arv INTEGER;
BEGIN
SELECT INTO arv COUNT(*) 
FROM (SELECT Ootel_Tellimus.tellimuse_nr FROM Ootel_tellimus WHERE tellimuse_nr = NEW.tellimuse_nr
UNION 
SELECT Tuhistatud_tellimus.tellimuse_nr FROM Tuhistatud_tellimus WHERE tellimuse_nr = NEW.tellimuse_nr
UNION
SELECT Tootlemisel_tellimus.tellimuse_nr FROM Tootlemisel_Tellimus WHERE tellimuse_nr = NEW.tellimuse_nr
UNION
SELECT Valja_saadetud_tellimus.tellimuse_nr FROM Valja_saadetud_tellimus WHERE tellimuse_nr = NEW.tellimuse_nr
UNION
SELECT Kohale_toimetatud_tellimus.tellimuse_nr FROM Kohale_toimetatud_tellimus WHERE tellimuse_nr = NEW.tellimuse_nr) a;
IF arv<1 THEN
RAISE EXCEPTION 'Tegevus ebaõnnestus - tellimus peab olema kindlasti mingis seisundis';
END IF;
RETURN NEW;
END;$$ LANGUAGE plpgsql SECURITY DEFINER
SET search_path = pohiolemituubi_alamtuupidena, pg_temp;
CREATE CONSTRAINT TRIGGER t_Tellimus_peab_olema_kindlasti_mingis_seisundis
AFTER INSERT OR UPDATE OF tellimuse_nr ON tellimus
INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION f_Tellimus_peab_olema_kindlasti_mingis_seisundis();
CREATE OR REPLACE FUNCTION t_ootel_tellimus_saab_olla_korraga_uhes_seisundis() RETURNS TRIGGER AS $$
DECLARE 
arv INTEGER;
t_tellimuse_nr Tellimus.tellimuse_nr%TYPE;	
BEGIN
SELECT tellimuse_nr INTO t_tellimuse_nr FROM Tellimus WHERE tellimuse_nr = NEW.tellimuse_nr FOR UPDATE;
SELECT INTO arv COUNT(*) 
FROM (SELECT Tootlemisel_tellimus.tellimuse_nr FROM Tootlemisel_Tellimus 
UNION 
SELECT Tuhistatud_tellimus.tellimuse_nr FROM Tuhistatud_tellimus
UNION
SELECT Valja_saadetud_tellimus.tellimuse_nr FROM Valja_saadetud_tellimus
UNION
SELECT Kohale_toimetatud_tellimus.tellimuse_nr FROM Kohale_toimetatud_tellimus) a
WHERE a.tellimuse_nr = NEW.tellimuse_nr;
IF arv>0 THEN
RAISE EXCEPTION 'Tegevus ebaõnnestus - tellimus saab olla korraga ainult ühes seisundis';
END IF;
RETURN NEW;
END;$$ LANGUAGE plpgsql SECURITY DEFINER
SET search_path = pohiolemituubi_alamtuupidena, pg_temp;
CREATE TRIGGER t_ootel_tellimus_saab_olla_uhes_seisundis
BEFORE INSERT OR UPDATE ON ootel_tellimus
FOR EACH ROW 
EXECUTE FUNCTION f_ootel_tellimus_saab_olla_korraga_uhes_seisundis();
CREATE OR REPLACE FUNCTION f_tootlemisel_tellimus_saab_olla_korraga_uhes_seisundis() RETURNS TRIGGER AS $$
DECLARE 
arv INTEGER;
t_tellimuse_nr Tellimus.tellimuse_nr%TYPE;	
BEGIN
SELECT tellimuse_nr INTO t_tellimuse_nr FROM Tellimus WHERE tellimuse_nr = NEW.tellimuse_nr FOR UPDATE;
SELECT INTO arv COUNT(*) 
FROM (SELECT Ootel_tellimus.tellimuse_nr FROM Ootel_Tellimus 
UNION 
SELECT Tuhistatud_tellimus.tellimuse_nr FROM Tuhistatud_tellimus
UNION
SELECT Valja_saadetud_tellimus.tellimuse_nr FROM Valja_saadetud_tellimus
UNION
SELECT Kohale_toimetatud_tellimus.tellimuse_nr FROM Kohale_toimetatud_tellimus) a
WHERE a.tellimuse_nr = NEW.tellimuse_nr;
IF arv>0 THEN
RAISE EXCEPTION 'Tegevus ebaõnnestus - tellimus saab olla korraga ainult ühes seisundis';
END IF;
RETURN NEW;
END;$$ LANGUAGE plpgsql SECURITY DEFINER
SET search_path = pohiolemituubi_alamtuupidena, pg_temp;
CREATE TRIGGER t_tootlemisel_tellimus_saab_olla_uhes_seisundis
BEFORE INSERT OR UPDATE ON tootlemisel_tellimus
FOR EACH ROW 
EXECUTE FUNCTION f_tootlemisel_tellimus_saab_olla_korraga_uhes_seisundis();
CREATE OR REPLACE FUNCTION f_valja_saadetud_tellimus_saab_olla_korraga_uhes_seisundis() RETURNS TRIGGER AS $$
DECLARE 
arv INTEGER;
t_tellimuse_nr Tellimus.tellimuse_nr%TYPE;	
BEGIN
SELECT tellimuse_nr INTO t_tellimuse_nr FROM Tellimus WHERE tellimuse_nr = NEW.tellimuse_nr FOR UPDATE;
SELECT INTO arv COUNT(*) 
FROM (SELECT Ootel_tellimus.tellimuse_nr FROM Ootel_Tellimus 
UNION 
SELECT Tuhistatud_tellimus.tellimuse_nr FROM Tuhistatud_tellimus
UNION
SELECT Tootlemisel_tellimus.tellimuse_nr FROM Tootlemisel_tellimus
UNION
SELECT Kohale_toimetatud_tellimus.tellimuse_nr FROM Kohale_toimetatud_tellimus) a
WHERE a.tellimuse_nr = NEW.tellimuse_nr;
IF arv>0 THEN
RAISE EXCEPTION 'Tegevus ebaõnnestus - tellimus saab olla korraga ainult ühes seisundis';
END IF;
RETURN NEW;
END;$$ LANGUAGE plpgsql SECURITY DEFINER
SET search_path = pohiolemituubi_alamtuupidena, pg_temp;
CREATE TRIGGER t_valja_saadetud_tellimus_saab_olla_uhes_seisundis
BEFORE INSERT OR UPDATE ON valja_saadetud_tellimus
FOR EACH ROW 
EXECUTE FUNCTION f_valja_saadetud_tellimus_saab_olla_korraga_uhes_seisundis();
CREATE OR REPLACE FUNCTION f_kohale_toimetatud_tellimus_saab_olla_korraga_uhes_seisundis() RETURNS TRIGGER AS $$
DECLARE 
arv INTEGER;
t_tellimuse_nr Tellimus.tellimuse_nr%TYPE;	
BEGIN
SELECT tellimuse_nr INTO t_tellimuse_nr FROM Tellimus WHERE tellimuse_nr = NEW.tellimuse_nr FOR UPDATE;
SELECT INTO arv COUNT(*) 
FROM (SELECT Ootel_tellimus.tellimuse_nr FROM Ootel_Tellimus 
UNION 
SELECT Tuhistatud_tellimus.tellimuse_nr FROM Tuhistatud_tellimus
UNION
SELECT Tootlemisel_tellimus.tellimuse_nr FROM Tootlemisel_tellimus
UNION
SELECT Valja_saadetud_tellimus.tellimuse_nr FROM Valja_saadetud_tellimus) a
WHERE a.tellimuse_nr = NEW.tellimuse_nr;
IF arv>0 THEN
RAISE EXCEPTION 'Tegevus ebaõnnestus - tellimus saab olla korraga ainult ühes seisundis';
END IF;
RETURN NEW;
END;$$ LANGUAGE plpgsql SECURITY DEFINER
SET search_path = pohiolemituubi_alamtuupidena, pg_temp;
CREATE TRIGGER t_kohale_toimetatud_tellimus_saab_olla_uhes_seisundis
BEFORE INSERT OR UPDATE ON kohale_toimetatud_tellimus
FOR EACH ROW 
EXECUTE FUNCTION f_kohale_toimetatud_tellimus_saab_olla_korraga_uhes_seisundis();
CREATE OR REPLACE FUNCTION f_tuhistatud_tellimus_saab_olla_korraga_uhes_seisundis() RETURNS TRIGGER AS $$
DECLARE 
arv INTEGER;
t_tellimuse_nr Tellimus.tellimuse_nr%TYPE;	
BEGIN
SELECT tellimuse_nr INTO t_tellimuse_nr FROM Tellimus WHERE tellimuse_nr = NEW.tellimuse_nr FOR UPDATE;
SELECT INTO arv COUNT(*) 
FROM (SELECT Ootel_tellimus.tellimuse_nr FROM Ootel_Tellimus 
UNION 
SELECT Kohale_toimetatud_tellimus.tellimuse_nr FROM Kohale_toimetatud_tellimus
UNION
SELECT Tootlemisel_tellimus.tellimuse_nr FROM Tootlemisel_tellimus
UNION
SELECT Valja_saadetud_tellimus.tellimuse_nr FROM Valja_saadetud_tellimus) a
WHERE a.tellimuse_nr = NEW.tellimuse_nr;
IF arv>0 THEN
RAISE EXCEPTION 'Tegevus ebaõnnestus - tellimus saab olla korraga ainult ühes seisundis';
END IF;
RETURN NEW;
END;$$ LANGUAGE plpgsql SECURITY DEFINER
SET search_path = pohiolemituubi_alamtuupidena, pg_temp;
CREATE TRIGGER t_tuhistatud_tellimus_saab_olla_uhes_seisundis 
BEFORE INSERT OR UPDATE ON tuhistatud_tellimus
FOR EACH ROW 
EXECUTE FUNCTION f_tuhistatud_tellimus_saab_olla_korraga_uhes_seisundis();