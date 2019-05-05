START TRANSACTION;
CREATE OR REPLACE FUNCTION f_seisundi_dekodeerimine(seisund text) 
RETURNS TEXT AS $$
SELECT CASE
	WHEN seisund = '1000' THEN 'Ootel'
	WHEN seisund = '0100' THEN 'Töötlemisel'
	WHEN seisund = '0010' THEN 'Välja saadetud'
	WHEN seisund = '0001' THEN 'Kohale toimetatud'
	ELSE 'Tundmatu'
END AS seisundi_tulem;
$$ LANGUAGE sql IMMUTABLE STRICT;
CREATE OR REPLACE FUNCTION f_tellimuse_seisundi_kodeerimine(seisund text) 
RETURNS TEXT AS $$
SELECT CASE
    WHEN seisund = 'Ootel' THEN '1000'
    WHEN seisund = 'Töötlemisel' THEN '0100'
    WHEN seisund = 'Välja saadetud' THEN '0010'
    WHEN seisund = 'Kohale toimetatud' THEN '0001'   
END AS seisundi_tulem;
$$ LANGUAGE sql IMMUTABLE STRICT;
ALTER TABLE tellimus DROP CONSTRAINT CHK_Tellimus_peab_vastama_kodeerimisreeglitele;
UPDATE tellimus SET seisund = '1000' WHERE seisund = '10000';
UPDATE tellimus SET seisund = '0100' WHERE seisund = '01000';
UPDATE tellimus SET seisund = '0010' WHERE seisund = '00100';
UPDATE tellimus SET seisund = '0001' WHERE seisund = '00010';
ALTER TABLE tellimus ADD CONSTRAINT CHK_Tellimus_peab_vastama_kodeerimisreeglitele CHECK seisund~'^([0-1]{4})$');
COMMIT;