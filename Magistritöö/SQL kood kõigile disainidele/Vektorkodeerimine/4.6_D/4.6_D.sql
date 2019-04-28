ALTER TABLE tellimus DROP CONSTRAINT CHK_Tellimus_saab_olla_maksimaalselt_uhes_seisundis, 
					 ADD CONSTRAINT CHK_Tellimus_saab_olla_maksimaalselt_uhes_seisundis CHECK seisund~'^([0-1]{4})$');
CREATE OR REPLACE FUNCTION F_seisundi_dekodeerimine(seisund text) 
RETURNS TEXT AS $$
SELECT CASE
	WHEN seisund = '100000' THEN 'Ootel'
	WHEN seisund = '010000' THEN 'Töötlemisel'
	WHEN seisund = '001000' THEN 'Välja saadetud'
	WHEN seisund = '000100' THEN 'Kohale toimetatud'
END AS seisundi_tulem;
$$ LANGUAGE sql;