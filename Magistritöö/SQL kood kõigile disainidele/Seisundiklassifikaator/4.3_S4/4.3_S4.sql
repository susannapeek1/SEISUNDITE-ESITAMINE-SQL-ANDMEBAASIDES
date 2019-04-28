SELECT DISTINCT tellimuse_seisundi_liik.nimetus AS seisund 
FROM   tellimuse_seisundi_liik 
WHERE  NOT EXISTS (SELECT * 
                   FROM   tellimus 
                   WHERE  tellimuse_seisundi_liik.tellimuse_seisundi_liik_kood = tellimus.tellimuse_seisundi_liik_kood); 