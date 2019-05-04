SELECT tellimuse_seisundi_liik.nimetus AS hetkeseisund 
FROM   tellimus 
INNER JOIN tellimuse_seisundi_liik ON tellimus.tellimuse_seisundi_liik_kood = tellimuse_seisundi_liik.tellimuse_seisundi_liik_kood 
WHERE  tellimus.tellimuse_nr = 200000; 