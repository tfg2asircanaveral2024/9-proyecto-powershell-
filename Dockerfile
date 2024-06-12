FROM ubuntu:latest

USER root

# Actualizar el repositorio de paquetes e instalar dependencias

RUN apt-get update && apt-get install -y \
    wget \
    apt-transport-https \
    software-properties-common \
    sudo

# Instalar PowerShell

COPY instalacion.sh .
RUN chmod u+x instalacion.sh
RUN sudo ./instalacion.sh

RUN pwsh -Command "Install-Module -Name PSScriptAnalyzer -Force"
RUN pwsh -Command "Install-Module -Name PSDepend -Force"
RUN pwsh -Command "Install-Module -Name Pester -Force"
RUN pwsh -Command "Install-Module -Name PSDeploy -Force"

CMD ["/bin/bash"]
