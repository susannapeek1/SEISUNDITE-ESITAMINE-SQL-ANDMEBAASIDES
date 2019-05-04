SELECT tellimus.tellimuse_nr, 
       CASE 
         WHEN tellimus.on_tootlemisel = TRUE THEN 'Töötlemisel' 
         WHEN tellimus.on_valja_saadetud = TRUE THEN 'Välja saadetud' 
         WHEN tellimus.on_kohale_toimetatud = TRUE THEN 'Kohale toimetatud' 
         WHEN tellimus.on_tuhistatud = TRUE THEN 'Tühistatud' 
		 ELSE 'Teadmata'
       END AS hetkeseisund 
FROM   tellimus 
WHERE  tellimus.on_ootel = false 
ORDER  BY tellimus.tellimuse_nr;