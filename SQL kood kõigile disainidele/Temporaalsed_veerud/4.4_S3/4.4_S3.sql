SELECT CASE 
         WHEN tellimus.ootel_aeg IS NOT NULL THEN 'Ootel' 
         WHEN tellimus.tootlemisel_aeg IS NOT NULL THEN 'Töötlemisel' 
         WHEN tellimus.valja_saadetud_aeg IS NOT NULL THEN 'Välja saadetud' 
         WHEN tellimus.kohale_toimetatud_aeg IS NOT NULL THEN 'Kohale toimetatud' 
         WHEN tellimus.tuhistatud_aeg IS NOT NULL THEN 'Tühistatud' 
		 ELSE 'Teadmata'
       END AS hetkeseisund 
FROM   tellimus 
WHERE  tellimus.tellimuse_nr = 200000; 