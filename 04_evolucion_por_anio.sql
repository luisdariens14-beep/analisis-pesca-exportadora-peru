USE PescaExportadora

SELECT 
    Anio,
    SUM(fob_miles_dolares) AS Total_exportado_usd
FROM PESCA_LIMPIA
WHERE fob_miles_dolares IS NOT NULL
GROUP BY anio
ORDER BY anio ASC