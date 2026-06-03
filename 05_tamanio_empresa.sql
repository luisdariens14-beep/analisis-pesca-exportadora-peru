USE PescaExportadora

SELECT 
    Tamano_empresa,
    SUM(fob_miles_dolares) AS Total_exportado_usd,
    COUNT(*) AS Cantidad_registros
FROM PESCA_LIMPIA
WHERE fob_miles_dolares IS NOT NULL
    AND tamano_empresa IS NOT NULL
GROUP BY tamano_empresa
ORDER BY total_exportado_usd DESC