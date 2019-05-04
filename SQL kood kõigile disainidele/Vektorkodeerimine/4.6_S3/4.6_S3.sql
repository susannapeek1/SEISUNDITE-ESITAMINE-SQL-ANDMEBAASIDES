SELECT f_seisundi_dekodeerimine(tellimus.seisund) AS hetkeseisund 
FROM   tellimus 
WHERE  tellimus.tellimuse_nr = 200000; 