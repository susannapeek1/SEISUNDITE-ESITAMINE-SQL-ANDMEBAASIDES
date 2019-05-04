SELECT tellimus.tellimuse_nr, 
       f_seisundi_dekodeerimine(seisund) AS hetkeseisund 
FROM   tellimus 
WHERE  f_seisundi_dekodeerimine(seisund)<>'Ootel'
ORDER  BY tellimus.tellimuse_nr; 