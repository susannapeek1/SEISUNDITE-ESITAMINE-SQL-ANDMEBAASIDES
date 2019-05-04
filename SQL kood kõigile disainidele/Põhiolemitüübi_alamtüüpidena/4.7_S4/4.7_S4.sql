SELECT 'Ootel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM Ootel_tellimus)
UNION 
SELECT 'Töötlemisel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM Tootlemisel_tellimus)
UNION 
SELECT 'Välja saadetud' AS seisund
WHERE NOT EXISTS (SELECT * 
                  FROM Valja_saadetud_tellimus)
UNION 
SELECT 'Kohale toimetatud' AS seisund
WHERE NOT EXISTS (SELECT * 
	              FROM Kohale_toimetatud_tellimus)
UNION SELECT 'Tühistatud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM Tuhistatud_tellimus);