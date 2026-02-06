# Prueba Técnica - Automatizador E2E (Playwright + Cucumber + TypeScript) + SQL

Automatización E2E del flujo en **SauceDemo**: login, agregar producto al carrito y checkout completo, usando **Playwright + Cucumber (TypeScript)**.  
Incluye escenarios con **tags**, **Scenario Outline (Data Driven)**, **steps parametrizables**, **timeouts globales** configurados en el **World**, **video por escenario**, **screenshots automáticos solo al fallar**, y **reporte HTML** generado desde el JSON de Cucumber.

---

## 📌 Stack
- Playwright
- Cucumber.js
- TypeScript
- SQL (PostgreSQL 15 recomendado)

---

## ✅ Requisitos
- Node.js 18+ (recomendado)
- NPM 9+
- (Opcional) PostgreSQL 15 si deseas ejecutar scripts SQL

---

## 🚀 Instalación paso a paso

1. Clonar repositorio
```bash
git clone https://github.com/juanpinto1007/automatizacion_saucedemo_gft.git
cd automatizacion_saucedemo_gft
```
2. Instalar dependencias
```bash
npm install
```
3. Instalar navegadores de Playwright
```bash
npx playwright install
```
## ▶️ Ejecución de tests

1. Ejecutar SOLO Smoke (@smoke)
```bash
npm run test:smoke
```
2. Ejecutar SOLO Regression (@regression)
```bash
npm run test:regression
```
Nota: Los tags se controlan desde cucumber.js.
## 📊 Reporte HTML

1. Ejecutar tests (genera reports/cucumber-report.json):
```bash
npm run test:smoke
```

2. Generar reporte HTML:
```bash
npm run report
```

3. Abrir reporte:

    Ruta: reports/html/index.html

## 🧾 Evidencias (videos y screenshots)
### 🎥 Videos (por escenario)

Carpeta: reports/videos/ (formato .webm)

### 📸 Screenshots (solo cuando el escenario falla)

Carpeta: reports/screenshots/

##  Estructura del proyecto
```bash
automatizacion_saucedemo_gft/
├─ features/
├─ src/
│  ├─ pages/
│  ├─ steps/
│  └─ support/
├─ reports/
└─ dataBase/
```
## Consideraciones
Timeouts globales en World con setDefaultTimeout y setDefaultNavigationTimeout

Steps parametrizables {string}

Scenario Outline + Examples (Data Driven)

Tags: @smoke, @regression, @negative, @critical

Screenshot solo al fallar (hook After)

Video por escenario (recordVideo)

Reporte HTML desde JSON de Cucumber

## Parte 2 - SQL
Dentro de dataBase/ se incluyen:

01_schema.sql

02_seed.sql

queries.sql

