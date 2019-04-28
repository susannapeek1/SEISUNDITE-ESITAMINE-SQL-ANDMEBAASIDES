SELECT tellimus.tellimuse_nr, 
       F_seisundi_dekodeerimine(seisund) AS hetkeseisund 
FROM   tellimus 
WHERE  tellimus.seisund != '10000' 
ORDER  BY tellimus.tellimuse_nr; 