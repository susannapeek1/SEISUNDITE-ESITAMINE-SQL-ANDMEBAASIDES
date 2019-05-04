SELECT tellimus.tellimuse_nr 
FROM   tellimus 
WHERE  tellimus.tootlemisel_aeg IS NOT NULL 
ORDER  BY tellimus.tellimuse_nr; 