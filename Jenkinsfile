pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/tfg2asircanaveral2024/9-proyecto-powershell-.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Construir la imagen Docker
                script {
                    docker.build("-t mi-proyecto-powershell -f Dockerfile .")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Ejecutar un contenedor basado en la imagen construida
                script {
                    docker.image("ubuntu_powershell:latest").inside {
                        sh 'pwsh -Command "Get-Module -ListAvailable"'
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Limpiar el espacio de trabajo al finalizar el pipeline
        }
    }
}
