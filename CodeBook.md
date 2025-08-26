# CodeBook

Este documento describe las variables, datos y transformaciones realizadas para generar el dataset ordenado `tidy_dataset.txt`.

---

## 1. Datos originales

Los datos provienen del **Human Activity Recognition Using Smartphones Dataset** (UCI Machine Learning Repository).  
- **Sujetos:** 30 voluntarios (19-48 años).  
- **Actividades:** caminar, caminar cuesta arriba, caminar cuesta abajo, sentarse, estar de pie y acostarse.  
- **Variables originales:** mediciones de acelerómetro y giroscopio en los ejes X, Y y Z, transformadas en dominio del tiempo y la frecuencia.  

---

## 2. Transformaciones realizadas

1. Se fusionaron los conjuntos de entrenamiento y prueba en un único dataset.  
2. Se seleccionaron únicamente las variables que representan **media (mean)** y **desviación estándar (std)**.  
3. Se reemplazaron los códigos de actividad por nombres descriptivos (por ejemplo: `1 → WALKING`).  
4. Se renombraron las variables con nombres más claros:
   - `t` → `Time`
   - `f` → `Frequency`
   - `Acc` → `Accelerometer`
   - `Gyro` → `Gyroscope`
   - `Mag` → `Magnitude`
   - `BodyBody` → `Body`
   - `mean()` → `Mean`
   - `std()` → `STD`
5. Se creó un dataset independiente con la **media de cada variable agrupada por sujeto y actividad**.

---

## 3. Descripción de variables finales

El dataset final `tidy_dataset.txt` tiene:

- **Filas:** 180 (30 sujetos × 6 actividades).  
- **Columnas:** 68.  

Variables clave:

- `subject`: Identificador del sujeto (1–30).  
- `activity`: Actividad realizada (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`).  
- `TimeBodyAccelerometerMeanX`: media de la aceleración del cuerpo en el eje X (tiempo).  
- `TimeBodyAccelerometerSTDZ`: desviación estándar de la aceleración del cuerpo en el eje Z (tiempo).  
- `FrequencyBodyGyroscopeMeanY`: media de la señal del giroscopio en el eje Y (frecuencia).  
- … y así para todas las combinaciones incluidas.

Todas las variables numéricas son **valores normalizados sin unidades absolutas** (resultado de la pre-procesamiento original UCI).

---

## 4. Estructura final del dataset

- **180 filas × 68 columnas.**  
- Cada fila corresponde a un par único `(sujeto, actividad)`.  
- Cada columna (excepto `subject` y `activity`) es el promedio de una medición de sensor.  
