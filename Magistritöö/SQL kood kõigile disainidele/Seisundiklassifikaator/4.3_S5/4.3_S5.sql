SELECT tellimuse_seisundi_liik.nimetus AS seisund, 
COALESCE (a.tellimuste_arv, 0) AS tellimuste_arv 
FROM tellimuse_seisundi_liik 
LEFT JOIN (SELECT tellimus.tellimuse_seisundi_liik_kood, 
				  COUNT(*) AS tellimuste_arv 
				  FROM tellimus 
				  GROUP BY tellimus.tellimuse_seisundi_liik_kood) a 
				  ON tellimuse_seisundi_liik.tellimuse_seisundi_liik_kood = a.tellimuse_seisundi_liik_kood;