SELECT 'Ootel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
				  WHERE f_seisundi_dekodeerimine(seisund) = 'Ootel')
UNION 
SELECT 'Töötlemisel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
				  WHERE f_seisundi_dekodeerimine(seisund) = 'Töötlemisel')
UNION 
SELECT 'Välja saadetud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
				  WHERE f_seisundi_dekodeerimine(seisund) = 'Välja saadetud')
UNION 
SELECT 'Kohale toimetatud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
			      WHERE f_seisundi_dekodeerimine(seisund) = 'Kohale toimetatud')
UNION 
SELECT 'Tühistatud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
				  WHERE f_seisundi_dekodeerimine(seisund) = 'Tühistatud');