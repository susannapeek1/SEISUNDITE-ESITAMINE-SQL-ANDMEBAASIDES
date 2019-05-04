SELECT 'Ootel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM Tellimus 
				  WHERE f_seisundi_dekodeerimine(Tellimus.seisund) = 'Ootel')
UNION 
SELECT 'Töötlemisel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM Tellimus 
				  WHERE f_seisundi_dekodeerimine(Tellimus.seisund) = 'Töötlemisel')
UNION 
SELECT 'Välja saadetud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM Tellimus 
				  WHERE f_seisundi_dekodeerimine(Tellimus.seisund) = 'Välja saadetud')
UNION 
SELECT 'Kohale toimetatud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM Tellimus 
			      WHERE f_seisundi_dekodeerimine(Tellimus.seisund) = 'Kohale toimetatud')
UNION 
SELECT 'Tühistatud' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM Tellimus 
				  WHERE f_seisundi_dekodeerimine(Tellimus.seisund) = 'Tühistatud');