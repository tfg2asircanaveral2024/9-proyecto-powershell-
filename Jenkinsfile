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
                script {
                    def app = docker.build("mi_proyecto_powershell")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image("mi_proyecto_powershell").inside {
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
