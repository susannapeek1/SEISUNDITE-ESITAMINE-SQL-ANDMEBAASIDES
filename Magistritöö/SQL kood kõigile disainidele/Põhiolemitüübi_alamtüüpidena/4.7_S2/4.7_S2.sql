SELECT a.tellimuse_nr, 
       a.hetkeseisund 
FROM   (SELECT tootlemisel_tellimus.tellimuse_nr, 
               'Töötlemisel' AS hetkeseisund 
        FROM   tootlemisel_tellimus 
        UNION 
        SELECT tuhistatud_tellimus.tellimuse_nr, 
               'Tühistatud' AS hetkeseisund 
        FROM   tuhistatud_tellimus 
        UNION 
        SELECT valja_saadetud_tellimus.tellimuse_nr, 
               'Välja saadetud' AS hetkeseisund 
        FROM   valja_saadetud_tellimus 
        UNION 
        SELECT kohale_toimetatud_tellimus.tellimuse_nr, 
               'Kohale toimetatud' AS hetkeseisund 
        FROM   kohale_toimetatud_tellimus) a; 