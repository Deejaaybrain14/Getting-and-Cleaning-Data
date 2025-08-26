

# Getting and Cleaning Data - Proyecto Final

Este repositorio contiene la entrega del proyecto final del curso **Getting and Cleaning Data** (Johns Hopkins, Coursera).

---

## Archivos incluidos

- `run_analysis.R` → Script en R que limpia y transforma los datos.  
- `tidy_dataset.txt` → Dataset final ordenado.  
- `CodeBook.md` → Libro de códigos que describe variables y transformaciones.  
- `README.md` → Explicación del proyecto y cómo ejecutar los scripts.  

---

## Instrucciones de ejecución

1. Clonar este repositorio o descargarlo en su computadora.  
2. Asegurarse de tener instalado R y el paquete `dplyr`.  
3. Ejecutar el script principal en RStudio o consola R:  

```r
source("run_analysis.R")


### Ejemplo de salida (`tidy_dataset.txt`)

Las primeras filas del dataset final (180 × 68):

| subject | activity           | TimeBodyAccelerometerMeanX | TimeBodyAccelerometerMeanY | TimeBodyAccelerometerMeanZ | TimeBodyAccelerometerSTDX |
|---------|--------------------|----------------------------|----------------------------|----------------------------|---------------------------|
| 1       | WALKING            | 0.277                      | -0.017                     | -0.111                     | -0.284                    |
| 1       | WALKING_UPSTAIRS   | 0.255                      | -0.024                     | -0.097                     | -0.355                    |
| 1       | WALKING_DOWNSTAIRS | 0.289                      | -0.0099                    | -0.108                     |  0.030                    |

