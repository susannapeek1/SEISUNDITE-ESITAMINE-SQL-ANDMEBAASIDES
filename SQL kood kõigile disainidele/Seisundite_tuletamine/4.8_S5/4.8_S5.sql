SELECT a.seisund, 
       a.tellimuste_arv 
FROM   (SELECT Count(*) AS tellimuste_arv, 
               'Ootel'  AS seisund 
        FROM   tellimus 
        WHERE  ( tellimus.tellimuse_nr IN (SELECT arve.tellimuse_nr 
                                           FROM   arve 
                                           WHERE  arve.tasumise_aeg IS NULL) 
                  OR NOT EXISTS (SELECT * 
                                 FROM   arve 
                                 WHERE  tellimus.tellimuse_nr = arve.tellimuse_nr) ) 
               AND NOT EXISTS (SELECT * 
                               FROM   tellimuse_tuhistamine 
                               WHERE  tellimus.tellimuse_nr = tellimuse_tuhistamine.tellimuse_nr) 
        UNION 
        SELECT Count(*)      AS tellimuste_arv, 
               'Töötlemisel' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.tellimuse_nr IN (SELECT arve.tellimuse_nr 
                                         FROM   arve 
                                         WHERE  arve.tasumise_aeg IS NOT NULL) 
               AND NOT EXISTS (SELECT * 
                               FROM   saadetis 
                               WHERE  tellimus.tellimuse_nr = saadetis.tellimuse_nr) 
        UNION 
        SELECT Count(*)         AS tellimuste_arv, 
               'Välja saadetud' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.tellimuse_nr IN 
               (SELECT saadetis.tellimuse_nr 
                FROM   saadetis 
                WHERE  saadetis.kliendile_uleandmise_aeg IS NULL) 
        UNION 
        SELECT Count(*)            AS tellimuste_arv, 
               'Kohale toimetatud' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.tellimuse_nr IN 
               (SELECT saadetis.tellimuse_nr 
                FROM   saadetis 
                WHERE  saadetis.kliendile_uleandmise_aeg IS NOT NULL) 
        UNION 
        SELECT Count(*)     AS tellimuste_arv, 
               'Tühistatud' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.tellimuse_nr IN (SELECT tellimuse_tuhistamine.tellimuse_nr 
                                         FROM   tellimuse_tuhistamine)) a; 