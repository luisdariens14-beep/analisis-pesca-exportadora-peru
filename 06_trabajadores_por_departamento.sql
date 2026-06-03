USE PescaExportadora

SELECT 
    Departamento,
    SUM(trabajadores) AS Total_trabajadores
FROM PESCA_LIMPIA
WHERE trabajadores IS NOT NULL
GROUP BY departamento
ORDER BY total_trabajadores DESC