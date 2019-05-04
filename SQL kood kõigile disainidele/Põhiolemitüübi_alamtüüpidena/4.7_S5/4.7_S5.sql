SELECT a.seisund, 
       a.tellimuste_arv 
FROM   (SELECT Count(*) AS tellimuste_arv, 
               'Ootel'  AS seisund 
        FROM   ootel_tellimus 
        UNION 
        SELECT Count(*)        AS tellimuste_arv, 
               'Töötlemisel' AS seisund 
        FROM   tootlemisel_tellimus 
        UNION 
        SELECT Count(*)      AS tellimuste_arv, 
               'Tühistatud' AS seisund 
        FROM   tuhistatud_tellimus 
        UNION 
        SELECT Count(*)          AS tellimuste_arv, 
               'Välja saadetud' AS seisund 
        FROM   valja_saadetud_tellimus 
        UNION 
        SELECT Count(*)            AS tellimuste_arv, 
               'Kohale toimetatud' AS seisund 
        FROM   kohale_toimetatud_tellimus) a; 