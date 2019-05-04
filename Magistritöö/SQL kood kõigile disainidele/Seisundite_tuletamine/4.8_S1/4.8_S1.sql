SELECT tellimus.tellimuse_nr 
FROM   tellimus 
INNER JOIN arve ON tellimus.tellimuse_nr = arve.tellimuse_nr 
WHERE  arve.tasumise_aeg IS NOT NULL 
       AND NOT EXISTS (SELECT * 
                       FROM   saadetis 
                       WHERE  tellimus.tellimuse_nr = saadetis.tellimuse_nr) 
ORDER  BY tellimus.tellimuse_nr; 