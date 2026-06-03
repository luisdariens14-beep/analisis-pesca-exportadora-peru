USE PescaExportadora

SELECT 
    Especie,
    SUM(fob_miles_dolares) AS Total_exportado_usd
FROM PESCA_LIMPIA
WHERE fob_miles_dolares IS NOT NULL
    AND especie IS NOT NULL
GROUP BY especie
ORDER BY total_exportado_usd DESC