pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'ubuntu-powershell'
        PATH = "$PATH:/usr/bin/docker"
    }

    stages {
        stage('Pull Docker Image') {
            steps {
                script {
                    docker.image('ubuntu-powershell').pull()
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('ubuntu-powershell').inside {
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
