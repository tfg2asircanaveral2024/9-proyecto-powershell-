pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'ubuntu-powershell:latest'
    }

    stages {
        stage('Pull Docker Image') {
            steps {
                script {
                    docker.image('ubuntu-powershell:latest').pull()
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('ubuntu-powershell:latest').inside {
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
