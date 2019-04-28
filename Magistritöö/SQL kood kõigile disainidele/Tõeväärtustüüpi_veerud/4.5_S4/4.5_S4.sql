SELECT a.seisund 
FROM   (SELECT Count(*) AS tellimuste_arv, 
               'Ootel'  AS seisund 
        FROM   tellimus 
        WHERE  tellimus.on_ootel 
        UNION 
        SELECT Count(*)        AS tellimuste_arv, 
               'Töötlemisel' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.on_tootlemisel 
        UNION 
        SELECT Count(*)          AS tellimuste_arv, 
               'Välja saadetud' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.on_valja_saadetud 
        UNION 
        SELECT Count(*)            AS tellimuste_arv, 
               'Kohale toimetatud' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.on_kohale_toimetatud 
        UNION 
        SELECT Count(*)      AS tellimuste_arv, 
               'Tühistatud' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.on_tuhistatud) a 
WHERE  a.tellimuste_arv = 0; 