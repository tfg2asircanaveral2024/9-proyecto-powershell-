pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'ubuntu-powershell:latest'
    }

    stages {
        stage('Pull Docker Image') {
            steps {
                script {
                    docker.image("${env.DOCKER_IMAGE}").pull()
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image("${env.DOCKER_IMAGE}").inside {
                        sh 'pwsh -Command "Get-Module -ListAvailable"'
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
