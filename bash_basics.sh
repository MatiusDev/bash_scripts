#!/bin/bash

# ===================================================
# === GUÍA COMPLETA DE PROGRAMACIÓN EN BASH ===
# ===================================================
# Esta guía contiene conceptos básicos de bash scripting
# con comparaciones a Python y JavaScript para facilitar
# el aprendizaje si ya conoces estos lenguajes.

# ===================================================
# 1. VARIABLES Y TIPOS DE DATOS
# ===================================================

# --- 1.1 Variables simples ---
# En bash, no se utilizan espacios alrededor del signo '='
# Python: nombre = "Juan"
# JavaScript: let nombre = "Juan"
nombre="Juan"
edad=25

# Para usar una variable, se antepone el símbolo $
echo "Hola, $nombre"
echo "Tienes $edad años"

# --- 1.2 Variables de entorno ---
# Son accesibles en todo el sistema
export MI_VARIABLE="valor global"
echo $MI_VARIABLE

# --- 1.3 Variables especiales ---
# $0 - Nombre del script
# $1, $2, ... - Argumentos posicionales
# $# - Número de argumentos
# $@ - Todos los argumentos como lista
# $? - Código de salida del último comando
# $$ - PID del proceso actual

echo "Nombre del script: $0"
echo "PID del proceso: $$"

# ===================================================
# 2. ESTRUCTURAS DE DATOS
# ===================================================

# --- 2.1 Arrays (Arreglos) ---
# Python: frutas = ["manzana", "pera", "uva"]
# JavaScript: let frutas = ["manzana", "pera", "uva"]
frutas=("manzana" "pera" "uva" "naranja" "kiwi")

# Acceso a elementos (índice base 0)
echo "Primera fruta: ${frutas[0]}"
echo "Segunda fruta: ${frutas[1]}"
echo "Todas las frutas: ${frutas[@]}"
echo "Número de frutas: ${#frutas[@]}"

# Añadir elementos
frutas+=("banano" "fresa")
echo "Array actualizado: ${frutas[@]}"

# Eliminar elementos
unset frutas[1]  # Elimina "pera"
echo "Después de eliminar: ${frutas[@]}"

# --- 2.2 Arrays asociativos (equivalente a diccionarios/objetos) ---
# Python: persona = {"nombre": "Ana", "edad": 30}
# JavaScript: let persona = {nombre: "Ana", edad: 30}

# Declaración explícita necesaria
declare -A persona
persona[nombre]="Ana"
persona[edad]=30
persona[ciudad]="Madrid"

echo "Nombre: ${persona[nombre]}"
echo "Edad: ${persona[edad]}"
echo "Todas las claves: ${!persona[@]}"
echo "Todos los valores: ${persona[@]}"

# ===================================================
# 3. CONDICIONALES
# ===================================================

# --- 3.1 If-Else ---
# Python:
# if edad >= 18:
#     print("Es mayor de edad")
# else:
#     print("Es menor de edad")
#
# JavaScript:
# if (edad >= 18) {
#     console.log("Es mayor de edad");
# } else {
#     console.log("Es menor de edad");
# }

if [ $edad -ge 18 ]; then
    echo "Es mayor de edad"
else
    echo "Es menor de edad"
fi

# --- 3.2 If-Elif-Else ---
nota=75
if [ $nota -ge 90 ]; then
    echo "Sobresaliente"
elif [ $nota -ge 70 ]; then
    echo "Notable"
elif [ $nota -ge 60 ]; then
    echo "Bien"
elif [ $nota -ge 50 ]; then
    echo "Suficiente"
else
    echo "Suspenso"
fi

# --- 3.3 Case (switch) ---
# Python: No tiene equivalente directo, se usa if-elif
# JavaScript:
# switch(dia) {
#     case "lunes": console.log("Primer día"); break;
#     case "martes": console.log("Segundo día"); break;
#     default: console.log("Otro día");
# }

dia="lunes"
case $dia in
    "lunes")
        echo "Primer día de la semana"
        ;;
    "martes"|"miércoles")
        echo "Mitad de semana"
        ;;
    "jueves")
        echo "Casi viernes"
        ;;
    "viernes")
        echo "¡Por fin viernes!"
        ;;
    "sábado"|"domingo")
        echo "Fin de semana"
        ;;
    *)
        echo "Día no reconocido"
        ;;
esac

# --- 3.4 Operadores de comparación para números ---
# -eq : igual (==)
# -ne : no igual (!=)
# -gt : mayor que (>)
# -ge : mayor o igual que (>=)
# -lt : menor que (<)
# -le : menor o igual que (<=)

# --- 3.5 Operadores de comparación para strings ---
# = : igual
# != : no igual
# -z : string vacío
# -n : string no vacío
# < : menor alfabéticamente
# > : mayor alfabéticamente

nombre1="Ana"
nombre2="Beto"
if [[ $nombre1 = $nombre2 ]]; then
    echo "Los nombres son iguales"
fi

if [[ $nombre1 < $nombre2 ]]; then
    echo "$nombre1 viene antes que $nombre2 alfabéticamente"
fi

# --- 3.6 Operadores lógicos ---
# && : AND (Y)
# || : OR (O)
# !  : NOT (NO)

if [[ $edad -ge 18 && $edad -le 65 ]]; then
    echo "Edad laboral"
fi

if [[ $dia = "sábado" || $dia = "domingo" ]]; then
    echo "Es fin de semana"
fi

# ===================================================
# 4. BUCLES (LOOPS)
# ===================================================

# --- 4.1 For loop (estilo rango) ---
# Python: for i in range(1, 6):
# JavaScript: for(let i = 1; i <= 5; i++)
echo "Bucle for con rango:"
for i in {1..5}; do
    echo "  Número: $i"
done

# --- 4.2 For loop con paso personalizado ---
# Python: for i in range(0, 10, 2):
# JavaScript: for(let i = 0; i < 10; i += 2)
echo "Bucle for con paso 2:"
for i in {0..10..2}; do
    echo "  Número: $i"
done

# --- 4.3 For loop (estilo foreach) ---
# Python: for fruta in frutas:
# JavaScript: for(let fruta of frutas)
echo "Bucle foreach con array:"
for fruta in "${frutas[@]}"; do
    echo "  Fruta: $fruta"
done

# --- 4.4 While loop ---
# Python: while contador < 5:
# JavaScript: while(contador < 5)
echo "Bucle while:"
contador=0
while [ $contador -lt 5 ]; do
    echo "  Contador: $contador"
    ((contador++))
done

# --- 4.5 Until loop (no existe en Python/JS) ---
# Ejecuta hasta que la condición sea verdadera
echo "Bucle until:"
contador=5
until [ $contador -le 0 ]; do
    echo "  Cuenta atrás: $contador"
    ((contador--))
done

# --- 4.6 Break y Continue ---
# Funcionan igual que en Python y JavaScript
echo "Uso de break y continue:"
for i in {1..10}; do
    if [ $i -eq 3 ]; then
        echo "  Saltando 3 con continue"
        continue
    fi
    if [ $i -eq 8 ]; then
        echo "  Terminando en 8 con break"
        break
    fi
    echo "  Número: $i"
done

# ===================================================
# 5. FUNCIONES
# ===================================================

# --- 5.1 Declaración de funciones ---
# Python: def saludar(nombre):
# JavaScript: function saludar(nombre) {
saludar() {
    local nombre=$1  # $1 es el primer argumento
    echo "Hola, $nombre"
}

# Llamar a la función
saludar "María"

# --- 5.2 Funciones con retorno de valores ---
# Bash no tiene return de valores, pero puede simularlos
calcular_suma() {
    local num1=$1
    local num2=$2
    echo $((num1 + num2))  # Esto es el "retorno"
}

# Capturar el "retorno"
resultado=$(calcular_suma 5 3)
echo "La suma es: $resultado"

# --- 5.3 Funciones con múltiples argumentos ---
presentar_persona() {
    echo "Nombre: $1"
    echo "Edad: $2"
    echo "Ciudad: $3"
}

presentar_persona "Carlos" 28 "Barcelona"

# --- 5.4 Ámbito de variables ---
variable_global="Soy global"

funcion_ambito() {
    local variable_local="Soy local"
    echo "Dentro de la función:"
    echo "  $variable_global"  # Accesible
    echo "  $variable_local"   # Accesible
}

funcion_ambito
echo "Fuera de la función:"
echo "  $variable_global"      # Accesible
echo "  $variable_local"       # No accesible (vacía)

# ===================================================
# 6. ENTRADA Y SALIDA
# ===================================================

# --- 6.1 Entrada del usuario ---
# Python: nombre = input("Ingrese su nombre: ")
# JavaScript: let nombre = prompt("Ingrese su nombre:")
echo "Ingrese su nombre:"
read nombre_usuario
echo "Hola, $nombre_usuario"

# --- 6.2 Lectura con mensaje en la misma línea ---
read -p "Ingrese su edad: " edad_usuario
echo "Tienes $edad_usuario años"

# --- 6.3 Lectura con tiempo límite ---
read -t 5 -p "Escribe algo en 5 segundos: " respuesta
echo "Respondiste: $respuesta"

# --- 6.4 Lectura de archivos ---
echo "Ejemplo de lectura de archivo:"
while read linea; do
    echo "  $linea"
done < /etc/hostname  # Lee el archivo hostname

# ===================================================
# 7. OPERACIONES CON STRINGS
# ===================================================

# --- 7.1 Concatenación ---
# Python: nombre_completo = nombre + " " + apellido
# JavaScript: let nombreCompleto = nombre + " " + apellido
nombre="Juan"
apellido="Pérez"
nombre_completo="$nombre $apellido"
echo "Nombre completo: $nombre_completo"

# --- 7.2 Longitud de string ---
# Python: len(string)
# JavaScript: string.length
longitud=${#nombre_completo}
echo "Longitud: $longitud caracteres"

# --- 7.3 Extracción de subcadenas ---
# Python: subcadena = cadena[inicio:fin]
# JavaScript: subcadena = cadena.substring(inicio, fin)
texto="Programación en Bash"
subcadena=${texto:13:4}  # Extrae "Bash"
echo "Subcadena: $subcadena"

# --- 7.4 Reemplazo de texto ---
# Python: texto.replace("old", "new")
# JavaScript: texto.replace("old", "new")
texto_original="Hola Mundo"
texto_reemplazado=${texto_original/Mundo/Bash}
echo "Original: $texto_original"
echo "Reemplazado: $texto_reemplazado"

# --- 7.5 Conversión a mayúsculas/minúsculas ---
texto="Bash Scripting"
echo "Original: $texto"
echo "Mayúsculas: ${texto^^}"
echo "Minúsculas: ${texto,,}"

# ===================================================
# 8. OPERACIONES MATEMÁTICAS
# ===================================================

# --- 8.1 Operaciones básicas ---
# En bash se usan dobles paréntesis para operaciones
suma=$((5 + 3))
resta=$((10 - 2))
multiplicacion=$((4 * 3))
division=$((15 / 3))
modulo=$((10 % 3))

echo "Suma: $suma"
echo "Resta: $resta"
echo "Multiplicación: $multiplicacion"
echo "División: $division"
echo "Módulo: $modulo"

# --- 8.2 Incremento y decremento ---
numero=5
((numero++))
echo "Después de incremento: $numero"
((numero--))
echo "Después de decremento: $numero"

# --- 8.3 Operaciones complejas ---
resultado=$((2 + 3 * 4))
echo "2 + 3 * 4 = $resultado"

resultado=$(( (2 + 3) * 4 ))
echo "(2 + 3) * 4 = $resultado"

# --- 8.4 Operaciones con bc (calculadora avanzada) ---
# Para operaciones de punto flotante
resultado=$(echo "scale=2; 10 / 3" | bc)
echo "10 / 3 con decimales = $resultado"

# ===================================================
# 9. MANEJO DE ARCHIVOS Y DIRECTORIOS
# ===================================================

# --- 9.1 Comprobar si un archivo existe ---
archivo="/etc/passwd"
if [ -f "$archivo" ]; then
    echo "$archivo existe y es un archivo regular"
fi

# --- 9.2 Comprobar si un directorio existe ---
directorio="/tmp"
if [ -d "$directorio" ]; then
    echo "$directorio existe y es un directorio"
fi

# --- 9.3 Permisos de archivo ---
archivo="/bin/bash"
if [ -r "$archivo" ]; then
    echo "$archivo tiene permisos de lectura"
fi
if [ -w "$archivo" ]; then
    echo "$archivo tiene permisos de escritura"
fi
if [ -x "$archivo" ]; then
    echo "$archivo tiene permisos de ejecución"
fi

# --- 9.4 Operaciones con archivos ---
# Crear un archivo de ejemplo
echo "Creando archivo de ejemplo..."
echo "Esto es un archivo de prueba" > /tmp/ejemplo.txt
echo "Segunda línea" >> /tmp/ejemplo.txt  # Añadir línea

# Leer el archivo
echo "Contenido del archivo:"
cat /tmp/ejemplo.txt

# ===================================================
# 10. COMANDOS ÚTILES EN SCRIPTS
# ===================================================

# --- 10.1 Fecha y hora ---
fecha_actual=$(date +

