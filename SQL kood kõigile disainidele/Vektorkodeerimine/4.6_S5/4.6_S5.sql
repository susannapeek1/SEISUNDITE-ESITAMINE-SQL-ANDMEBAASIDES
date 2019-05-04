WITH seisundite_arvud AS (
SELECT COUNT(*) FILTER (WHERE f_seisundi_dekodeerimine(tellimus.seisund) = 'Ootel') AS ootel_tellimuste_arv,
COUNT(*) FILTER (WHERE f_seisundi_dekodeerimine(tellimus.seisund) = 'Töötlemisel') AS tootlemisel_tellimuste_arv,
COUNT(*) FILTER (WHERE f_seisundi_dekodeerimine(tellimus.seisund) = 'Välja saadetud') AS valja_saadetud_tellimuste_arv,
COUNT(*) FILTER (WHERE f_seisundi_dekodeerimine(tellimus.seisund) = 'Kohale toimetatud') AS kohale_toimetatud_tellimuste_arv,
COUNT(*) FILTER (WHERE f_seisundi_dekodeerimine(tellimus.seisund) = 'Tühistatud') AS tuhistatud_tellimuste_arv
FROM Tellimus)
SELECT 'Ootel' AS seisund, 
ootel_tellimuste_arv
FROM seisundite_arvud
UNION 
SELECT 'Töötlemisel' AS seisund, 
tootlemisel_tellimuste_arv
FROM seisundite_arvud
UNION 
SELECT 'Välja saadetud' AS seisund, 
valja_saadetud_tellimuste_arv
FROM seisundite_arvud
UNION 
SELECT 'Kohale toimetatud' AS seisund, 
kohale_toimetatud_tellimuste_arv
FROM seisundite_arvud
UNION 
SELECT 'Tühistatud' AS seisund, 
tuhistatud_tellimuste_arv
FROM seisundite_arvud;