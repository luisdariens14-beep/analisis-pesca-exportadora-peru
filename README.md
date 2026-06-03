# Análisis de Exportaciones Pesqueras del Perú 2019-2024

## Descripción
Análisis exploratorio del sector pesquero exportador peruano usando SQL Server.
Los datos cubren el período 2019-2024 e incluyen información de empresas, especies, departamentos y valores de exportación.

## Hallazgos principales
- Lima y Piura concentran el 96% de todas las exportaciones pesqueras del Perú
- La Harina de Pescado es el producto estrella del sector
- El sector cayó 18.98% en 2020 por COVID-19 y 29.07% en 2023 por El Niño
- La Gran Empresa concentra casi el 100% del valor exportado
- Tumbes exporta mucho con pocos trabajadores — alta eficiencia productiva

## Archivos
| Archivo | Descripción |
|---|---|
| 01_crear_tabla_limpia.sql | Limpieza y preparación de datos |
| 02_exportaciones_por_departamento.sql | Ranking de regiones exportadoras |
| 03_top_especies_exportadas.sql | Especies con mayor valor exportado |
| 04_evolucion_por_anio.sql | Tendencia anual 2019-2024 |
| 05_tamanio_empresa.sql | Exportaciones por tamaño de empresa |
| 06_trabajadores_por_departamento.sql | Empleo pesquero por región |
| 07_vista_resumen.sql | Vista consolidada del análisis |
| 08_concentracion_riesgo_departamento.sql | Concentración de riesgo por región |
| 09_tasa_crecimiento_anual.sql | Tasa de crecimiento año a año |
| 10_especie_por_departamento.sql | Especie principal por departamento |

## Herramientas
- SQL Server 2022
- SQL Server Management Studio (SSMS)

## Fuente de datos
SUNAT / PRODUCE — Exportaciones pesqueras Perú 2019-2024
## Resultados

### Ranking de departamentos exportadores
![ranking](ranking%20de%20departamentos.png)

### Evolución anual 2019-2024
![evolucion](evoluci%C3%B3n%20por%20a%C3%B1o.png)

### Concentración de riesgo por departamento
![concentracion](concentraci%C3%B3n%20de%20riesgo%20(%25%20por%20departamento).png)

### Tasa de crecimiento anual
![crecimiento](tasa%20de%20crecimiento%20anual.png)

## Dashboard interactivo
[Ver dashboard en vivo](https://luisdariens14-beep.github.io/analisis-pesca-exportadora-peru/dashboard_pesca_exportadora.html)
