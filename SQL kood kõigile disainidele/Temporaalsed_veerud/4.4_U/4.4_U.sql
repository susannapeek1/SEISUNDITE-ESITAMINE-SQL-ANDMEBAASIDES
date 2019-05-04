UPDATE tellimus SET valja_saadetud_aeg = NULL, 
					kohale_toimetatud_aeg = LOCALTIMESTAMP(0) 
WHERE  tellimuse_nr = 290550;