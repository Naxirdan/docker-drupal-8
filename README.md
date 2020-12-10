# **PROYECTOS DRUPAL**

## Introducción:

Drupal es un CMS hecho en PHP y con núcleo que usa el framework Symfony. A diferencia
de otros CMS, Drupal está hecho por desarrolladores para desarrolladores, es totalmente 
customizable para que la experiencia del usuario final ( **Cliente** ), sea lo más próxima
a tener un producto totalmente adaptado a su lógica de negocio. 

Tenemos 2 modos de ver las plataformas **Usuario Cliente** o **Usuario Administrador**

* **Usuario cliente** es todo aquel usuario que sigue un flujo externo a la lógica de
negocio interna, es decir, no tiene acceso a las herramientas de administración de nuestra
plataforma.

* **Usuario Administrador** es todo usuario que tiene permisos para ver las opciones y menús
de gestión.

Estos tipos de usuarios estarán definidos por los roles configurables desde la gestión que nos
proporciona la barra de gestión de Drupal en la sección de Opciones/Permisos.

Drupal tiene una estuctura basada en módulos, los cuales se configuran como bloques o plugins.

Podemos gestionar desde los tipos de elementos que vamos a gestionar desde la web como
los menús de configuración que podremos ver en cada momento y crear nuestros propios 
 ***tipos de contenido***
 
 ##COMPOSER
 El gestor de instalación y de comandos por excelencia en Drupal y Symfony, nos ayuda
 a instalar vendors/paquetes o limpiar la caché. En drupal es muy común el uso constante 
 de herramientas que nos ayuden a borrar la caché ya que este CMS acostumbra a cachear las
 vistas y configuraciones.
 
 **IMPORTANTE**
 
 Siemepre que hagamos: 
 ```sh 
 git clone [repo]
```
Deberemos de ejectuar el siguiente comando en la raíz del proyecto donde está el 
*composer.json*
```sh
composer install
```
Ya que como sabremos los vendors deben de estar ignorados en el .gitignore

##DRUSH
####1. ¿Qué es Drush?

Drush es un comando de terminal que nos ayuda a gestionar Drupal, es uno de los más 
usados para este cometido ya que contiene una multitud de comandos adaptados para
Drupal, por ejemplo extrayendo la configuración generada en los cambios desde el
backoffice de gestión Drupal.

####2. ¿Por qué Drush?

Debemos de saber que toda configuración de Drupal generará archivos de configuración
en formato ***yaml***, ***configuración en base de datos*** o ***ambas***

Para ello Drush nos ofrece comandos para:
* Exportar desde terminal la posible configuración generada por los cambios:
```sh
drush cex
```

* Importar  desde terminal la posible configuración generada por los cambios en otro entorno:
```sh
drush cim
```

* Actualizar la base de datos en base a los archivos de configuración importados
```sh
drush updb
```

* Limpiar la caché
```sh
drush cr
```

## A tener en cuenta

La configuración yaml generada se guardará por defecto en:
```sh
cd core/config
```
Podemos configurar la carpeta en la que se guardarán estos yaml,
por ejemplo con el nombre del dominio al que pertenece 
ya que podemos tener un multisite que compartan el esqueleto.

Cuando tenemos un multisite nos referimos a que en el mismo
directorio de proyecto podemos tener por ejemplo:

[https://www.ejemplo.com](URL) 

[https://blog.ejemplo.com](URL)

[https://shop.ejempplo.com](URL)

Se mostrarían diferentes pero depende de la configuración
tendremos la ventaja de compartir los mismos vendors para
los 3 o para 2 de ellos e incluso la misma configuración
o templates.

##CACHE MULTISITES

Debemos saber que si ejecutamos 
```sh
dush cr
```

Limpiará la caché según el nivel desde donde lo ejecutemos, 
por ejemplo:

* Desde la raíz del projecto, elimpia caché del sitio definido
como **sitio por defecto**.

* Si estamos en el directorio del sitio en concreto limpiamos
la de ese sitio.

* Para ver los cambios en templates (Plantillas, JS,  
CSS/SCSS/LESS/STYLUS...) deberemos entrar en el directorio
theme del sitio a limpiar caché.