SELECT a.tellimuse_nr, 
       a.hetkeseisund 
FROM   (SELECT tellimuse_nr, 
               'Töötlemisel' AS hetkeseisund 
        FROM   tellimus 
        WHERE  tellimus.tellimuse_nr IN (SELECT arve.tellimuse_nr 
                                         FROM   arve 
                                         WHERE  arve.tasumise_aeg IS NOT NULL) 
               AND NOT EXISTS (SELECT * 
                               FROM   saadetis 
                               WHERE  tellimus.tellimuse_nr = saadetis.tellimuse_nr) 
        UNION 
        SELECT tellimuse_nr, 
               'Välja saadetud' AS hetkeseisund 
        FROM   tellimus 
        WHERE  tellimus.tellimuse_nr IN 
               (SELECT saadetis.tellimuse_nr 
                FROM   saadetis 
                WHERE  saadetis.kliendile_uleandmise_aeg IS NULL) 
        UNION 
        SELECT tellimuse_nr, 
               'Kohale toimetatud' AS hetkeseisund 
        FROM   tellimus 
        WHERE  tellimus.tellimuse_nr IN 
               (SELECT saadetis.tellimuse_nr 
                FROM   saadetis 
                WHERE  saadetis.kliendile_uleandmise_aeg IS NOT NULL) 
        UNION 
        SELECT tellimuse_nr, 
               'Tühistatud' AS hetkeseisund 
        FROM   tellimus 
        WHERE  tellimus.tellimuse_nr IN (SELECT tellimuse_tuhistamine.tellimuse_nr 
                                         FROM   tellimuse_tuhistamine)) a 
ORDER  BY a.tellimuse_nr;