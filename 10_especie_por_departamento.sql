USE PescaExportadora

SELECT 
    departamento,
    especie,
    SUM(fob_miles_dolares) AS total_exportado_usd
FROM PESCA_LIMPIA
WHERE fob_miles_dolares IS NOT NULL
    AND especie IS NOT NULL
GROUP BY departamento, especie
ORDER BY departamento ASC, total_exportado_usd DESC