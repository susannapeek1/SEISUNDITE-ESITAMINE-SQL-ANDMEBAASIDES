SELECT 'Ootel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM Tellimus 
				  WHERE ootel_aeg IS NOT NULL)
UNION 
SELECT 'Töötlemisel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM Tellimus 
				  WHERE tootlemisel_aeg IS NOT NULL)
UNION 
SELECT 'Välja saadetud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM Tellimus 
				  WHERE valja_saadetud_aeg IS NOT NULL)
UNION 
SELECT 'Kohale toimetatud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM Tellimus 
			      WHERE kohale_toimetatud_aeg IS NOT NULL)
UNION 
SELECT 'Tühistatud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM Tellimus 
				  WHERE tellimus.tuhistatud_aeg IS NOT NULL);