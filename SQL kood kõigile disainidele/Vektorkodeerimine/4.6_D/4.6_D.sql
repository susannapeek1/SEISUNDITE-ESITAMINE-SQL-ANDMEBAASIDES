START TRANSACTION;
ALTER TABLE tellimus DROP CONSTRAINT CHK_Tellimus_peab_vastama_kodeerimisreeglitele, 
					 ADD CONSTRAINT CHK_Tellimus_peab_vastama_kodeerimisreeglitele CHECK seisund~'^([0-1]{4})$');
CREATE OR REPLACE FUNCTION F_seisundi_dekodeerimine(seisund text) 
RETURNS TEXT AS $$
SELECT CASE
	WHEN seisund = '100000' THEN 'Ootel'
	WHEN seisund = '010000' THEN 'Töötlemisel'
	WHEN seisund = '001000' THEN 'Välja saadetud'
	WHEN seisund = '000100' THEN 'Kohale toimetatud'
	ELSE 'Tundmatu'
END AS seisundi_tulem;
$$ LANGUAGE sql IMMUTABLE STRICT;
COMMIT;