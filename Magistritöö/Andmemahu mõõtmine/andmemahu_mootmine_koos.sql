SELECT     
schema_name,     
round(sum(total_size)/1024/1024, 2) mb 
FROM (     
SELECT         
schema_name,         
pg_total_relation_size(table_name) AS total_size     
FROM ( 
SELECT 
('"' || table_schema || '"."' || table_name || '"') AS table_name,         
table_schema AS schema_name         
FROM information_schema.tables         
WHERE (table_schema LIKE 'seisundi%' OR table_schema LIKE 'tempor%' OR table_schema LIKE 'vektor%' OR table_schema LIKE 'toevaa%' OR table_schema LIKE 'pohiolemi%')) AS all_tables     
ORDER BY total_size DESC ) AS sizes 
GROUP BY schema_name;