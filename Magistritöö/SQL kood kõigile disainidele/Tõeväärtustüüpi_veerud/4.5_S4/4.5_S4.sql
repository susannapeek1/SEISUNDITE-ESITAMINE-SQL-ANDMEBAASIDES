SELECT 'Ootel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
				  WHERE on_ootel = TRUE)
UNION 
SELECT 'Töötlemisel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
				  WHERE on_tootlemisel = TRUE)
UNION 
SELECT 'Välja saadetud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
				  WHERE on_valja_saadetud = TRUE)
UNION 
SELECT 'Kohale toimetatud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
			      WHERE on_kohale_toimetatud = TRUE)
UNION 
SELECT 'Tühistatud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus 
				  WHERE on_tuhistatud = TRUE);
