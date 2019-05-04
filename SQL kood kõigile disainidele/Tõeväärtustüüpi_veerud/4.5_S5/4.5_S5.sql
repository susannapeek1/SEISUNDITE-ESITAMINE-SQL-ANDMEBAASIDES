WITH seisundite_arvud AS (
SELECT COUNT(*) FILTER (WHERE on_ootel = TRUE) AS ootel_tellimuste_arv,
COUNT(*) FILTER (WHERE on_tootlemisel = TRUE) AS tootlemisel_tellimuste_arv,
COUNT(*) FILTER (WHERE on_valja_saadetud = TRUE) AS valja_saadetud_tellimuste_arv,
COUNT(*) FILTER (WHERE on_kohale_toimetatud = TRUE) AS kohale_toimetatud_tellimuste_arv,
COUNT(*) FILTER (WHERE on_tuhistatud = TRUE) AS tuhistatud_tellimuste_arv
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