SELECT tellimuse_seisundi_liik.nimetus AS seisund, 
       CASE 
         WHEN a.tellimuste_arv IS NULL THEN 0 
         ELSE a.tellimuste_arv 
       END AS tellimuste_arv 
FROM   tellimuse_seisundi_liik 
       LEFT JOIN (SELECT tellimus.tellimuse_seisundi_liik_kood, 
                         Count(*) AS tellimuste_arv 
                  FROM   tellimus 
                  GROUP  BY tellimus.tellimuse_seisundi_liik_kood) a 
                  ON tellimuse_seisundi_liik.tellimuse_seisundi_liik_kood = a.tellimuse_seisundi_liik_kood;