USE PescaExportadora

SELECT 
    anio,
    SUM(fob_miles_dolares) AS total_exportado_usd,
    LAG(SUM(fob_miles_dolares)) OVER (ORDER BY anio) AS anio_anterior,
    ROUND(
        (SUM(fob_miles_dolares) - LAG(SUM(fob_miles_dolares)) OVER (ORDER BY anio)) 
        * 100.0 / LAG(SUM(fob_miles_dolares)) OVER (ORDER BY anio), 2
    ) AS tasa_crecimiento_pct
FROM PESCA_LIMPIA
WHERE fob_miles_dolares IS NOT NULL
GROUP BY anio
ORDER BY anio ASC