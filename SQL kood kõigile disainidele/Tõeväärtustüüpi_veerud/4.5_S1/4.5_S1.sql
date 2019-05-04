SELECT tellimus.tellimuse_nr 
FROM   tellimus 
WHERE  tellimus.on_tootlemisel = TRUE
ORDER  BY tellimus.tellimuse_nr; 