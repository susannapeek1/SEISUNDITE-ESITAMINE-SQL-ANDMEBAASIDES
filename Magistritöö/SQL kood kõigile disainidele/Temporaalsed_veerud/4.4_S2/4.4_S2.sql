SELECT tellimus.tellimuse_nr, 
       CASE 
         WHEN tellimus.tootlemisel_aeg IS NOT NULL THEN 'Töötlemisel' 
         WHEN tellimus.valja_saadetud_aeg IS NOT NULL THEN 'Välja saadetud' 
         WHEN tellimus.kohale_toimetatud_aeg IS NOT NULL THEN 
         'Kohale toimetatud' 
         WHEN tellimus.tuhistatud_aeg IS NOT NULL THEN 'Tühistatud' 
       END AS hetkeseisund 
FROM   tellimus 
WHERE  tellimus.ootel_aeg IS NULL 
ORDER  BY tellimus.tellimuse_nr; 