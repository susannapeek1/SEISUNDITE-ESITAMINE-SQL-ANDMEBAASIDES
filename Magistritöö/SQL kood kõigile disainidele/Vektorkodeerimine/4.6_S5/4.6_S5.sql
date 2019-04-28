SELECT a.seisund, 
       a.tellimuste_arv 
FROM   (SELECT Count(*) AS tellimuste_arv, 
               'Ootel'  AS seisund 
        FROM   tellimus 
        WHERE  tellimus.seisund = '10000' 
        UNION 
        SELECT Count(*)        AS tellimuste_arv, 
               'Töötlemisel' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.seisund = '01000' 
        UNION 
        SELECT Count(*)          AS tellimuste_arv, 
               'Välja saadetud' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.seisund = '00100' 
        UNION 
        SELECT Count(*)            AS tellimuste_arv, 
               'Kohale toimetatud' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.seisund = '00010' 
        UNION 
        SELECT Count(*)      AS tellimuste_arv, 
               'Tühistatud' AS seisund 
        FROM   tellimus 
        WHERE  tellimus.seisund = '00001') a; 