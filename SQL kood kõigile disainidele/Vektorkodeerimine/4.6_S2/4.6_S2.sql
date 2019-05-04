SELECT tellimus.tellimuse_nr, 
       f_seisundi_dekodeerimine(seisund) AS hetkeseisund 
FROM   tellimus 
WHERE  f_seisundi_dekodeerimine(tellimus.seisund)<>'Ootel'
ORDER  BY tellimus.tellimuse_nr; 