SELECT CASE 
         WHEN ( tellimus.tellimuse_nr IN (SELECT arve.tellimuse_nr 
                                          FROM   arve 
                                          WHERE  arve.tasumise_aeg IS NULL) 
                 OR NOT EXISTS (SELECT * 
                                FROM   arve 
                                WHERE  tellimus.tellimuse_nr = arve.tellimuse_nr) ) 
              AND NOT EXISTS (SELECT * 
                              FROM   tellimuse_tuhistamine 
                              WHERE  tellimus.tellimuse_nr = tellimuse_tuhistamine.tellimuse_nr) THEN 'Ootel' 
         WHEN tellimus.tellimuse_nr IN (SELECT arve.tellimuse_nr 
                                        FROM   arve 
                                        WHERE  arve.tasumise_aeg IS NOT NULL) 
              AND NOT EXISTS (SELECT * 
                              FROM   saadetis 
                              WHERE  tellimus.tellimuse_nr = saadetis.tellimuse_nr) THEN 'Töötlemisel' 
         WHEN tellimus.tellimuse_nr IN (SELECT saadetis.tellimuse_nr 
                                        FROM   saadetis 
                                        WHERE  saadetis.kliendile_uleandmise_aeg IS NULL) THEN 'Välja saadetud' 
         WHEN tellimus.tellimuse_nr IN (SELECT saadetis.tellimuse_nr 
                                        FROM   saadetis 
                                        WHERE  saadetis.kliendile_uleandmise_aeg IS NOT NULL) THEN 'Kohale toimetatud' 
         WHEN tellimus.tellimuse_nr IN (SELECT tellimuse_tuhistamine.tellimuse_nr 
                                        FROM   tellimuse_tuhistamine) THEN 'Tühistatud' 
       END AS hetkeseisund 
FROM   tellimus 
WHERE  tellimus.tellimuse_nr = 200000;