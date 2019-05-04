SELECT 'Ootel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
				  WHERE ootel_aeg IS NOT NULL)
UNION 
SELECT 'Töötlemisel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
				  WHERE tootlemisel_aeg IS NOT NULL)
UNION 
SELECT 'Välja saadetud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
				  WHERE valja_saadetud_aeg IS NOT NULL)
UNION 
SELECT 'Kohale toimetatud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
			      WHERE kohale_toimetatud_aeg IS NOT NULL)
UNION 
SELECT 'Tühistatud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
				  WHERE tellimus.tuhistatud_aeg IS NOT NULL);