# update_data.R
library(Microsoft365R)
library(readxl)

cat("Iniciando descarga de datos...\n")

# Conectar a OneDrive
od <- get_personal_onedrive()
shared <- od$list_shared_items()
carpeta_camis <- shared[[1]]

# Acceder a la carpeta Barri
subcarpeta <- carpeta_camis$get_item("Barri")

# Descargar archivo
archivo <- subcarpeta$get_item("Lunes.xlsx")
archivo$download("temp_data.xlsx", overwrite = TRUE)

# Leer datos
datos <- read_excel("temp_data.xlsx")

# Guardar como CSV
write.csv(datos, "datos.csv", row.names = FALSE)

cat("Datos actualizados:", nrow(datos), "filas\n")
cat("Fecha de actualización:", as.character(Sys.time()), "\n")

# Limpiar archivo temporal
file.remove("temp_data.xlsx")


### 4. **Guardar el archivo:**
# - **File** → **Save As...**
#   - Navega a la carpeta donde clonaste el repositorio (ej: `C:/Users/Lesly/Documents/dashboard-onedrive`)
# - **Nombre del archivo:** `update_data.R`
# - **Clic en Save**
  
  ### 5. **Probar que funciona:**
# - En RStudio, con el archivo `update_data.R` abierto
# - Presiona **Ctrl + A** (seleccionar todo)
# - Presiona **Ctrl + Enter** (ejecutar)
# - O simplemente escribe en la consola: `source("update_data.R")`


  
  ## ✅ **¿Qué debería pasar?**
  
#   Si todo funciona bien:
# 1. Te pedirá autenticación en OneDrive (se abrirá el navegador)
# 2. Verás mensajes en la consola como:
#   ```
# Iniciando descarga de datos...
# Datos actualizados: XX filas
# Fecha de actualización: 2025-11-17...
# ```
# 3. Se creará un archivo **`datos.csv`** en la misma carpeta


  
## 🔍 **Verifica:**
#   
#   En la carpeta de tu repositorio deberías tener ahora:
#   ```
# dashboard-onedrive/
#   ├── README.md
# ├── update_data.R    ← Nuevo
# └── datos.csv        ← Nuevo (se creó al ejecutar el script)








