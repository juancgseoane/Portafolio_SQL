# 🗄️ Portafolio SQL – Modelado y Análisis de Datos  

Este repositorio reúne proyectos desarrollados en **SQL**, enfocados en **modelado de datos, consultas avanzadas y análisis de negocio**. Cada proyecto incluye la **creación de tablas, inserción de datos y generación de KPIs**, con el objetivo de transformar datos en **insights clave para la toma de decisiones**.  

---

## 🚀 Tecnologías utilizadas  
- **PostgreSQL / MySQL**  
- **SQL estándar (DDL, DML, DQL)**  
- **Herramientas de administración de BD (pgAdmin / DBeaver / Workbench)**  

---

## 📂 Proyectos destacados  

### 📊 1. Análisis de ventas  
- **Objetivo:** identificar productos más vendidos, clientes con mayor recurrencia y tendencias de compra.  
- **Técnicas aplicadas:**  
  - `JOIN` entre tablas de clientes, productos y facturas.  
  - KPIs de **ventas totales, promedio por cliente y ranking de top productos**.  
  - Detección de clientes inactivos.  
- **Archivo principal:** `consultas_avanzadas.sql`  

---

### 🏥 2. Gestión de hospital  
- **Objetivo:** optimizar la administración de pacientes, médicos y atenciones.  
- **Técnicas aplicadas:**  
  - Modelado relacional de tablas (pacientes, médicos, diagnósticos, tratamientos).  
  - Consultas con `GROUP BY` para obtener atenciones por especialidad.  
  - KPI de **tiempo promedio de hospitalización**.  
- **Archivo principal:** `reportes_kpis.sql`  

---

### 📦 3. Logística y distribución  
- **Objetivo:** analizar la eficiencia en entregas y rutas.  
- **Técnicas aplicadas:**  
  - `JOIN` entre órdenes, vehículos y choferes.  
  - Identificación de entregas atrasadas y cálculo de porcentajes de cumplimiento.  
  - KPI de **nivel de servicio (%)**.  
- **Archivo principal:** `script_insercion_datos.sql`  

---

## ⚙️ Flujo de trabajo aplicado  

1. **Modelado de datos** – diseño de tablas con claves primarias y foráneas.  
2. **Carga de datos** – `INSERT INTO` con información simulada/realista.  
3. **Consultas avanzadas** – `JOIN`, `GROUP BY`, `ORDER BY`, `HAVING`.  
4. **Generación de KPIs** – métricas aplicadas a cada escenario de negocio.  

---

