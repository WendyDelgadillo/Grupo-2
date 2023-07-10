Repositorio Virtual para la Clase de Practicas de Especializacion III - Grupo#2
Configuración de Peering entre 2 Maquinas Virtuales ubicadas en regiones distintas

AUTORES
    -> Justo Gabriel Huete Martinez
    -> Kendall Roberto Aragon Ñurinda
    -> Wendy Madelin Delgadillo Luna
    -> Marcial de Jesus Delgado
    -> Patrick Alexander Wilson

Para la creacion del contenido en este repositorio, se tomaron en cuenta las siguientes instrucciones:
    -> Configuracion de dos VNETs en regiones de Azure distintas (eastus1  y westus1)
    -> Configuracion del VNET Peering
    -> Creacion de dos VMs una en cada VNET
    -> Comprobacion de conexión SSH entre ambos servidores utilizando comando ping
    -> Creacion del script en Azure CLI para desplegar estos recursos
    -> Creacion del Script para destruir y/o detener estos recursos

Tecnologias Utilizadas

Para la elaboracion del proyecto de utilizaron dos Herramientas importantes como son Microsoft Azure CLI y gitHub:

Azure CLI es un programa de línea de comandos multiplataforma que se conecta a Azure y ejecuta comandos administrativos en los recursos de Azure, como maquinas virtuales, cuentas de almacenamiento, aplicaciones web, base de datos, redes virtuales, etc...

Por otro lado, gitHub es un servicio basado en la nube que aloja un sistema de control. Este permite a los desarrolladores colaborar y realizar cambios en proyectos compartidos, a la vez que mantienen un seguimiento detallado de su progreso. El objetivo de gitHub, es permitir que los usuarios puedan realizar proyectos en grupo, donde cada uno puede aportar sus ideas sin importar la distancia de manera fácil, sencilla y ordenada.

Descripcion del Proyecto

El objetivo de este repositorio, es proporcionar un lugar centralizado para almacenar, organizar y compartir los comandos de Azure CLI asociados al despliegue de recursos, emparejamiento y pueba de conexion entre redes virtuales ubicadas en Regiones distintas

Flujo de Trabajo usando GIT

Proporcionarle a GIT nustro usuario y correo:
    -> "git config --global user.name" y "git config --global user.email"

Clonar el repositorio existente de github:
    -> git clone https://github.com/WendyDelgadillo/Grupo-2.git

Trabajar en una Rama
    -> git branch Rama_Grupo2
    -> git checkout Rama_Grupo2

Realizar cambios y confirmarlos
    -> git status
    -> git add .
    -> git commit -m "Commit-Ejemplo"

Actualizar el Repositorio Remoto
    -> git push origin Rama_Grupo2

Obtener Cambios del Repositorio Remoto
    -> git pull origin Rama_Grupo2

En la realizacion de este proyecto intervenimos 5 autores, por lo que, cada uno creo su rama individualmente, independiente de la rama "master"

    rama_Justo -> Pertenece a Justo Huete Martinez
    Rama-Wendy -> Pertenece a Wendy Madelin Delgadillo
    rama_kendall -> Pertenece a Kendall Roberto Aragon
    Rama_Marcial -> Pertenece a Marcial de Jesus Delgado
    Rama_Patrick -> Pertenece a Patrick Alexander Wilson
    master -> Rama por defecto

Merge entre las 5 Ramas a "master" para la creacion de los Scripts

    -> git checkout master 
    -> git merge Rama_Grupo2