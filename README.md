Micro HTML Prettyprint
======================

## Instalación

La instalación es muy sencilla en cualquier version razonablemente actual de Ubuntu Linux o derivados:

- Instalar una version reciente de Ruby ejecutando:

    sudo apt-get install ruby1.9.1-full

- Luego instalar la gema 'racc', necesaria para generar el parser:

    sudo gem install racc

- En caso de que el parser no haya sido generado o esté desactualizado, desde el directorio raiz del proyecto ejecutar:

    rake compile


## Modo de uso

Para hacer uso del programa simplemente hay que ejecutar el binario en 'bin/html_pp' pasandole desde la entrada standar el texto con el HTML que se desea formatear
