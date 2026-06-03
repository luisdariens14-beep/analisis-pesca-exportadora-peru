USE PescaExportadora

SELECT 
    departamento,
    SUM(fob_miles_dolares) AS total_exportado_usd,
    ROUND(SUM(fob_miles_dolares) * 100.0 / 
        (SELECT SUM(fob_miles_dolares) 
         FROM PESCA_LIMPIA 
         WHERE fob_miles_dolares IS NOT NULL), 2) AS porcentaje_del_total
FROM PESCA_LIMPIA
WHERE fob_miles_dolares IS NOT NULL
GROUP BY departamento
ORDER BY porcentaje_del_total DESC