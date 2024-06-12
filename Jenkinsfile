pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("-t ubuntu_powershell:latest -f Dockerfile .")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
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
