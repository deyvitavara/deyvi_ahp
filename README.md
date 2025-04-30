Aplicación de la metodología AHP
**El resultado me sale siempre igual, entonces hay algo mas que se debe cambiar, pero igual lo subo, quizás le ayude a alguién.**:

Aquí agrego una documento-guía que describe paso a paso la arquitectura, el flujo de datos y la lógica de tu app AHP, así como recomendaciones sobre qué hace cada parte y qué debes revisar o completar para que la metodología quede implementada “al 100 %”:

# AHP Offline App

![image](https://github.com/user-attachments/assets/a40ea6e8-9b0e-440a-8c48-9fa7647aa620)


Una aplicación móvil multiplataforma (Flutter) que implementa la metodología Analytic Hierarchy Process (AHP) **100 % real**, desde la definición de criterios y alternativas hasta la recomendación final.

---

## 📋 Contenido

1. [Descripción](#descripción)  
2. [Características](#características)  
3. [Arquitectura](#arquitectura)  
4. [Instalación y ejecución](#instalación-y-ejecución)  
5. [Estructura del código](#estructura-del-código)  
6. [Flujo de datos y módulos](#flujo-de-datos-y-módulos)  
7. [Cómo usarla](#cómo-usarla)  
8. [Pruebas y validación](#pruebas-y-validación)  
9. [Siguientes pasos](#siguientes-pasos)  

---

## 📖 Descripción

Esta app permite a estudiantes, empresas y académicos tomar decisiones multicriterio usando AHP:

1. **Definir** título, alternativas y criterios.  
2. **Seed‐ranking**: orden inicial de criterios.  
3. **Comparaciones adaptativas** de criterios hasta lograr consistencia (CR ≤ 0.10).  
4. **Comparaciones de alternativas** para cada criterio.  
5. **Cálculo final** de pesos y recomendación de la mejor alternativa.

---

## 🔥 Características

- **100 % offline**: toda la lógica y los datos residen en el dispositivo.  
- **UX ultra‐simple**: 4 pantallas, gestos drag & drop, swipes y clics.  
- **Metodología completa**: comparaciones 1–9, autovectores, control de consistencia.  
- **Minimalista & rápido**: curva de aprendizaje < 30 s.  
- **Exportable**: genera gráficos de barras y texto interpretativo.

---

## 🏗️ Arquitectura: Se hace lo que se puede jajajajja sorry mis amigos arquitectos de solución

Se usa **Clean Architecture**:

![image](https://github.com/user-attachments/assets/55e6dc42-ff39-4b5a-8623-950073e19449)

1. **CORE**  
   - `AhpSolver`  
     - Construcción de matriz de comparaciones (Floyd–Warshall multiplicativo).  
     - Método de la potencia para obtener el vector propio (pesos).  
     - Cálculo de Consistency Ratio (CR).  
   - `di.dart`  
     - Configuración de GetIt para inyección de dependencias.

2. **DATA**  
   - Drift (`app_database.dart`)  
     - Tablas: `Decisions`, `Criteria`, `Comparisons`, `Alternatives`, `AltComparisons`.  
     - Repositorio: `AhpRepositoryImpl` implementa `IAhpRepository` y expone operaciones CRUD + lógica de AHP.

3. **DOMAIN**  
   - **Entities**  
     - `DecisionEntity`, `CriterionEntity`, `AlternativeEntity`, `PairEntity`.  
   - **Use-Cases**  
     - `CreateDecisionUseCase`  
     - `AddDefaultComparisonsUseCase`  
     - `ComputeSeedWeightsUseCase`  
     - `ComputeConsistencyUseCase`  
     - `FetchComparisonsUseCase`  
     - `FetchCriticalPairsUseCase`  
     - `ComputeWeightsUseCase`  
     - `ComputeAltWeightsUseCase`  
     - `ComputeFinalWeightsUseCase`  

4. **PRESENTATION**  
   - **Providers** (`ChangeNotifier`)  
     - `DecisionProvider`  
     - `SeedProvider`  
     - `ComparisonProvider`  
     - `ResultProvider`  
   - **Screens**  
     1. **DataInputScreen**  
        - Entrada de título, alternativas y criterios.  
     2. **SeedRankingScreen**  
        - Arrastra y ordena criterios (seed).  
        - Calcula CR inicial tras juicios por defecto.  
     3. **AdaptiveComparisonScreen**  
        - Juicios adaptativos sobre los pares más inconsistentes hasta CR ≤ 0.10.  
     4. **AlternativeComparisonScreen**  
        - Para cada criterio, pairwise de alternativas (vector local).  
     5. **ResultScreen**  
        - Combina pesos de criterios (global) y locales de alternativas.  
        - Normaliza y presenta gráfica + mejor alternativa.

---

## 🔄 Flujo de Datos y Lógica

1. **Creación de decisión**  
   - Usuario ingresa título, lista de alternativas y criterios.  
   - `CreateDecisionUseCase` → BD: se guardan `Decisions`, `Alternatives`, `Criteria` con `seedOrder` inicial.

2. **Seed ranking**  
   - `SeedRankingScreen`: el usuario ordena criterios manualmente.  
   - Se graba el nuevo `seedOrder` en BD.  
   - `AddDefaultComparisonsUseCase`: inserta juicios con valor neutral (p. ej. 1.0 o 3.0) para generar la matriz inicial.  
   - `ComputeConsistencyUseCase`: calcula CR inicial con `AhpSolver`.

3. **Comparaciones adaptativas de criterios**  
   - `FetchCriticalPairsUseCase`: obtiene pares más inconsistentes (|Aᵢⱼ – wᵢ/wⱼ| > threshold).  
   - `AdaptiveComparisonScreen`: para cada par crítico, el usuario elige “Izquierda” o “Derecha” (v = 5.0 o 1/5.0).  
   - Se actualiza BD y se recalcula CR hasta cumplir CR ≤ 0.10.

4. **Pairwise de alternativas**  
   - `AlternativeComparisonScreen`: para cada criterio k (ordenado por seedOrder final), se comparan todas las parejas de alternativas.  
   - `ComputeAltWeightsUseCase` + `AhpSolver` → vector de pesos locales de alternativas para ese criterio.

5. **Resultados finales**  
   - `ResultScreen`:  
     - Obtiene pesos finales de criterios (`ComputeFinalWeightsUseCase`).  
     - Obtiene vectores locales de alternativas para cada criterio.  
     - Calcula puntaje global de cada alternativa:  
       \[
         S_i = \sum_{k=1}^{m} (w_k^{\text{criterio}} \times w_{i,k}^{\text{alternativa}})
       \]  
     - Normaliza \(\mathbf{S}\) para sumar 1.0.  
     - Muestra gráfica de barras, porcentajes y recomienda la alternativa con mayor puntaje.

---
## ⚙️ Instalación y ejecución

1. **Prerequisitos**:  
   - Flutter >= 3.x  
   - Dart SDK  
   - Un emulador o dispositivo móvil

2. **Clonar y preparar**:
   ```bash
   git clone https://github.com/tu-usuario/ahp_offline.git
   cd ahp_offline
   flutter pub get

Generar código Drift:
  flutter pub run build_runner build --delete-conflicting-outputs

Ejecutar:
  flutter run


