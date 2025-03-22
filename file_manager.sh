#!/bin/bash
# Se puede usar una alternativa a eval, a partir de arreglos, estos permiten guardar en un arreglo cada instrucción y desempaquetarla de manera individual al usar ${pattern[@]}

echo Por favor seleccione una opción para mover los archivos desde la carpeta actual
echo Para mover todas las fotos a ~/photos, pulse 1
echo Para mover todos los documentos a ~/documents, pulse 2
echo Para copiar todos los archivos a ~/all_files, pulse 3

read -p "Ingrese su opción: " opt

case $opt in
1)
	target_dir=~/photos
	pattern='\( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \)'
	# Alt arrays -> pattern=(-iname '*.png' -o -iname '*.jpg' -o -iname "*.jpeg")
	;;
2)
	target_dir=~/documents
	pattern='\( -iname "*.doc" -o -iname "*.odt" -o -iname "*.docx" -o -iname "*.pdf" -o -iname "*.html" -o -iname "*.txt" \)'
	;;
3)
	target_dir=~/all_files
	pattern='-iname "*.*"'
	;;
*)
	echo "Opción inválida. Por favor, seleccione 1, 2 o 3"
	exit 1
	;;
esac

if [ ! -d "$target_dir" ]; then
	mkdir -p "$target_dir"
	echo "Directorio $target_dir ha sido creado."
fi

case $opt in
1|2)
	eval "find . -type f $pattern -exec mv "{}" "$target_dir" \;"
	# Alt arrays -> find . -type f \( "${pattern[@]}" \)
	echo "Los archivos han sido movidos correctamente a $target_dir"
	;;
3)
	eval "find . -type f $pattern -exec cp "{}" "$target_dir" \;"
	echo "Los archivos han sido copiados correctamente a $target_dir"
	;;
esac
