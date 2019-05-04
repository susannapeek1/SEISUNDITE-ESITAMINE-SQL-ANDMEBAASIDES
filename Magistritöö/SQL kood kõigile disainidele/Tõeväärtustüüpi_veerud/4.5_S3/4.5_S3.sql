SELECT CASE 
         WHEN tellimus.on_ootel = TRUE THEN 'Ootel' 
         WHEN tellimus.on_tootlemisel = TRUE  THEN 'Töötlemisel' 
         WHEN tellimus.on_valja_saadetud = TRUE  THEN 'Välja saadetud' 
         WHEN tellimus.on_kohale_toimetatud = TRUE  THEN 'Kohale toimetatud' 
         WHEN tellimus.on_tuhistatud = TRUE  THEN 'Tühistatud' 
		 ELSE 'Teadmata'
       END AS hetkeseisund 
FROM   tellimus 
WHERE  tellimus.tellimuse_nr = 200000; 