USE PescaExportadora

SELECT 
    departamento,
    SUM(fob_miles_dolares) AS total_exportado_usd
FROM PESCA_LIMPIA
WHERE fob_miles_dolares IS NOT NULL
GROUP BY departamento
ORDER BY total_exportado_usd DESC