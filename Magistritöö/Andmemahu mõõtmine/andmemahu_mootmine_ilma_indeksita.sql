SELECT
    nspname AS schema,
    relname AS "relation",
    pg_size_pretty (
        pg_table_size (C .oid)
    ) AS "total_size"
FROM
    pg_class C
LEFT JOIN pg_namespace N ON (N.oid = C .relnamespace)
WHERE
    nspname NOT IN (
        'pg_catalog',
        'information_schema'
    )
AND C .relkind = 'r'
AND (nspname LIKE 'temporaalsed_veerud%' OR nspname LIKE 'toevaartus_veerud%' OR nspname LIKE 'seisundiklassifikaator%' OR nspname LIKE 'vektorkodeerimine%' OR nspname LIKE 'pohiolemituubi_alamtuupidena%' OR nspname LIKE 'seisundite_tuletamine%')
ORDER BY
    nspname, pg_table_size (C .oid), relname;
