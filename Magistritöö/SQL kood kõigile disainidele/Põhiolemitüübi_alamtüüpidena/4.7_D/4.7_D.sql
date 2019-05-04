START TRANSACTION;
CREATE OR REPLACE FUNCTION f_Tellimus_peab_olema_kindlasti_mingis_seisundis() RETURNS TRIGGER AS $$
DECLARE 
arv INTEGER;
BEGIN
SELECT INTO arv COUNT(*) 
FROM(SELECT Ootel_Tellimus.tellimuse_nr FROM Ootel_tellimus WHERE tellimuse_nr = NEW.tellimuse_nr
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
SET search_path = public, pg_temp;
CREATE OR REPLACE FUNCTION f_ootel_tellimus_saab_olla_korraga_uhes_seisundis() RETURNS TRIGGER AS $$
DECLARE 
arv INTEGER;
t_tellimuse_nr Tellimus.tellimuse_nr%TYPE;	
BEGIN
SELECT tellimuse_nr INTO t_tellimuse_nr FROM Tellimus WHERE tellimuse_nr = NEW.tellimuse_nr FOR UPDATE;
SELECT INTO arv COUNT(*) 
FROM (SELECT Tootlemisel_tellimus.tellimuse_nr FROM Tootlemisel_Tellimus 
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
CREATE OR REPLACE FUNCTION 
f_tootlemisel_tellimus_saab_olla_korraga_uhes_seisundis() RETURNS TRIGGER AS $$
DECLARE 
arv INTEGER;
t_tellimuse_nr Tellimus.tellimuse_nr%TYPE;	
BEGIN
SELECT tellimuse_nr INTO t_tellimuse_nr FROM Tellimus WHERE tellimuse_nr = NEW.tellimuse_nr FOR UPDATE;
SELECT INTO arv COUNT(*) 
FROM (SELECT Ootel_tellimus.tellimuse_nr FROM Ootel_Tellimus 
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
CREATE OR REPLACE FUNCTION f_valja_saadetud_tellimus_saab_olla_korraga_uhes_seisundis() RETURNS TRIGGER AS $$
DECLARE 
arv INTEGER;
t_tellimuse_nr Tellimus.tellimuse_nr%TYPE;	
BEGIN
SELECT tellimuse_nr INTO t_tellimuse_nr FROM Tellimus WHERE tellimuse_nr = NEW.tellimuse_nr FOR UPDATE;
SELECT INTO arv COUNT(*) 
FROM (SELECT Ootel_tellimus.tellimuse_nr FROM Ootel_Tellimus 
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
CREATE OR REPLACE FUNCTION f_kohale_toimetatud_tellimus_saab_olla_korraga_uhes_seisundis() RETURNS TRIGGER AS $$
DECLARE 
arv INTEGER;
t_tellimuse_nr Tellimus.tellimuse_nr%TYPE;	
BEGIN
SELECT tellimuse_nr INTO t_tellimuse_nr FROM Tellimus WHERE tellimuse_nr = NEW.tellimuse_nr FOR UPDATE;
SELECT INTO arv COUNT(*) 
FROM (SELECT Ootel_tellimus.tellimuse_nr FROM Ootel_Tellimus 
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
DROP TABLE tuhistatud_tellimus CASCADE;
COMMIT;