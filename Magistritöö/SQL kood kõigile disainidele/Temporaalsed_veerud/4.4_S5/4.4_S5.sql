WITH seisundite_arvud AS (
SELECT COUNT(*) FILTER (WHERE ootel_aeg IS NOT NULL) AS ootel_tellimuste_arv,
COUNT(*) FILTER (WHERE tootlemisel_aeg IS NOT NULL) AS tootlemisel_tellimuste_arv,
COUNT(*) FILTER (WHERE valja_saadetud_aeg IS NOT NULL) AS valja_saadetud_tellimuste_arv,
COUNT(*) FILTER (WHERE kohale_toimetatud_aeg IS NOT NULL) AS kohale_toimetatud_tellimuste_arv,
COUNT(*) FILTER (WHERE tuhistatud_aeg IS NOT NULL) AS tuhistatud_tellimuste_arv
FROM tellimus)
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