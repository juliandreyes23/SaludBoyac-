SaludBoyaca

Sistema web de gestión de salud desarrollado en Java Web con JSP, Servlets, MySQL y Docker.  
El proyecto permite la administración de pacientes, autenticación de usuarios y gestión de información médica.


Tecnologías utilizadas

- Java 17
- JSP / Servlets
- Apache Tomcat 9
- MySQL
- Maven
- Docker
- Docker Hub
- Render
- Back4App Containers


Docker Hub

Imagen Docker:
docker.io/julxreyes/saludboyaca-app:latest

Docker Hub:
https://hub.docker.com/r/julxreyes/saludboyaca-app

Hosting desplegado

Render

https://saludboyaca-app-latest-1.onrender.com/

Back4App Containers

https://saludboyaca6-pdz7vu5p.b4a.run/

Ejecución local

1. Clonar repositorio

git clone https://github.com/juliandreyes23/SaludBoyacá.git


2. Compilar proyecto

mvn clean package


3. Ejecutar con Docker

Construir imagen

docker build -t saludboyaca-app .

Ejecutar contenedor

docker run -p 8080:8080 saludboyaca-app


Acceso local

http://localhost:8080


Base de datos

Motor utilizado:

MySQL

Conexión configurada en:

ConexionDB.java


# Credenciales de prueba

Usuario Médico

Usuario: cpedraza
Contraseña: admin123

Usuario Enfermero

Usuario: msuarez
Contraseña: enfermero1

Usuario Recepcionista

Usuario: jbaez
Contraseña: recep123

Variables de entorno utilizadas

JAVA_TOOL_OPTIONS=-Xms64m -Xmx256m


Capturas de pantalla

Carpeta llamada ScreenShots

Autor

Julian Reyes

