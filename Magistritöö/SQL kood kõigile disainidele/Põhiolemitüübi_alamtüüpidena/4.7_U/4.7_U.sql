DELETE FROM valja_saadetud_tellimus 
WHERE  tellimuse_nr = 290550; 
INSERT INTO kohale_toimetatud_tellimus (tellimuse_nr) 
VALUES      (290550); 