SELECT tellimus.tellimuse_nr 
FROM   tellimus 
WHERE  f_seisundi_dekodeerimine(tellimus.seisund) = 'Töötlemisel'
ORDER  BY tellimus.tellimuse_nr; 