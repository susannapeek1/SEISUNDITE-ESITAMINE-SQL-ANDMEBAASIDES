SELECT 'Ootel' AS seisund
WHERE NOT EXISTS (SELECT * 
				  FROM   tellimus 
                  WHERE  ( tellimus.tellimuse_nr IN (SELECT arve.tellimuse_nr 
                                                     FROM   arve 
                                                     WHERE  arve.tasumise_aeg IS NULL) 
                  OR NOT EXISTS (SELECT * 
                                 FROM   arve 
                                 WHERE  tellimus.tellimuse_nr = arve.tellimuse_nr) ) 
               AND NOT EXISTS (SELECT * 
                               FROM   tellimuse_tuhistamine 
                               WHERE  tellimus.tellimuse_nr = tellimuse_tuhistamine.tellimuse_nr)) 
        UNION 
SELECT 'Töötlemisel' AS seisund 
WHERE  NOT EXISTS (SELECT * 
				   FROM tellimus
				   WHERE (tellimus.tellimuse_nr IN (SELECT arve.tellimuse_nr 
											  FROM   arve 
                                              WHERE  arve.tasumise_aeg IS NOT NULL) 
               AND NOT EXISTS (SELECT * 
                               FROM   saadetis 
                               WHERE  tellimus.tellimuse_nr = saadetis.tellimuse_nr)))
UNION 
SELECT 'Välja saadetud' AS seisund 
WHERE  NOT EXISTS (SELECT * 
					FROM tellimus
					WHERE (tellimus.tellimuse_nr IN 
               (SELECT saadetis.tellimuse_nr 
                FROM   saadetis 
                WHERE  saadetis.kliendile_uleandmise_aeg IS NULL)))
UNION 
SELECT 'Kohale toimetatud' AS seisund  
WHERE NOT EXISTS (SELECT *
				 FROM tellimus 
				 WHERE (tellimus.tellimuse_nr IN 
               (SELECT saadetis.tellimuse_nr 
                FROM   saadetis 
                WHERE  saadetis.kliendile_uleandmise_aeg IS NOT NULL)))
UNION 
SELECT 'Tühistatud' AS seisund 
WHERE NOT EXISTS (SELECT * 
				  FROM tellimus
				  WHERE (tellimus.tellimuse_nr IN (SELECT tellimuse_tuhistamine.tellimuse_nr 
                                         FROM   tellimuse_tuhistamine)));