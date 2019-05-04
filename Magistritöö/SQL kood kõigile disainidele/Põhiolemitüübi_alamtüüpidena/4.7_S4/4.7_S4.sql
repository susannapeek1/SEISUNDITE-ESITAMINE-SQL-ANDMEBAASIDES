SELECT 'Ootel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM ootel_tellimus)
UNION
SELECT 'Töötlemisel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tootlemisel_tellimus)
UNION 
SELECT 'Välja saadetud' AS seisund
WHERE NOT EXISTS (SELECT * 
                  FROM valja_saadetud_tellimus)
UNION 
SELECT 'Kohale toimetatud' AS seisund
WHERE NOT EXISTS (SELECT * 
	              FROM kohale_toimetatud_tellimus)
UNION SELECT 'Tühistatud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM tuhistatud_tellimus);