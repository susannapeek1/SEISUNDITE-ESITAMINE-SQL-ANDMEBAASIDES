SELECT a.seisund, 
       a.tellimuste_arv AS tellimuste_arv 
FROM   (SELECT Count(*) AS tellimuste_arv, 
               'Ootel'  AS seisund 
        FROM   tellimus 
        WHERE  tellimus.ootel_aeg IS NOT NULL 
        UNION 
        SELECT Count(*)        AS tellimuste_arv, 
               'Töötlemisel' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.tootlemisel_aeg IS NOT NULL 
        UNION 
        SELECT Count(*)          AS tellimuste_arv, 
               'Välja saadetud' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.valja_saadetud_aeg IS NOT NULL 
        UNION 
        SELECT Count(*)            AS tellimuste_arv, 
               'Kohale toimetatud' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.kohale_toimetatud_aeg IS NOT NULL 
        UNION 
        SELECT Count(*)      AS tellimuste_arv, 
               'Tühistatud' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.tuhistatud_aeg IS NOT NULL) a; 