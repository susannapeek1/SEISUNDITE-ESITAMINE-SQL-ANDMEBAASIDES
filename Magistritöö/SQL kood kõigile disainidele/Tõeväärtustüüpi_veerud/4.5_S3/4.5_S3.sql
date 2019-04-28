SELECT CASE 
         WHEN tellimus.on_ootel THEN 'Ootel' 
         WHEN tellimus.on_tootlemisel THEN 'Töötlemisel' 
         WHEN tellimus.on_valja_saadetud THEN 'Välja saadetud' 
         WHEN tellimus.on_kohale_toimetatud THEN 'Kohale toimetatud' 
         WHEN tellimus.on_tuhistatud THEN 'Tühistatud' 
       END AS hetkeseisund 
FROM   tellimus 
WHERE  tellimus.tellimuse_nr = 200000; 