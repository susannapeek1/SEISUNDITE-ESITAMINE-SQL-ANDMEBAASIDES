SELECT COUNT(*) AS tellimuste_arv, 
'Ootel' AS seisund 
FROM tellimus 
WHERE f_seisundi_dekodeerimine (seisund)='Ootel'
UNION
SELECT COUNT(*) AS tellimuste_arv, 
'Töötlemisel' AS seisund 
FROM tellimus 
WHERE f_seisundi_dekodeerimine (seisund)='Töötlemisel'
UNION
SELECT COUNT(*) AS tellimuste_arv, 
'Välja saadetud' AS seisund 
FROM tellimus 
WHERE f_seisundi_dekodeerimine (seisund)='Välja saadetud'
UNION
SELECT COUNT(*) AS tellimuste_arv, 
'Kohale toimetatud' AS seisund 
FROM tellimus 
WHERE f_seisundi_dekodeerimine (seisund)='Kohale toimetatud'
UNION
SELECT COUNT(*) AS tellimuste_arv, 
'Tühistatud' AS seisund 
FROM tellimus 
WHERE f_seisundi_dekodeerimine (seisund)='Tühistatud';