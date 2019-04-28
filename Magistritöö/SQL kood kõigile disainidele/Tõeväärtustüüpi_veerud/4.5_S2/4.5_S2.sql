SELECT tellimus.tellimuse_nr, 
       CASE 
         WHEN tellimus.on_tootlemisel THEN 'Töötlemisel' 
         WHEN tellimus.on_valja_saadetud THEN 'Välja saadetud' 
         WHEN tellimus.on_kohale_toimetatud THEN 'Kohale toimetatud' 
         WHEN tellimus.on_tuhistatud THEN 'Tühistatud' 
       END AS hetkeseisund 
FROM   tellimus 
WHERE  tellimus.on_ootel = false 
ORDER  BY tellimus.tellimuse_nr; 