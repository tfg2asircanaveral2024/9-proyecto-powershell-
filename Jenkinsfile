pipeline {
    agent any

    environment {
        DOCKERFILE_PATH = 'Dockerfile' 
        SCRIPT_PATH = 'instalacion.sh'
        DOCKER_IMAGE = 'ubuntu-powershell:latest'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("-t ${DOCKER_IMAGE} -f ${DOCKERFILE_PATH} .")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}").inside {
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
