pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("-t myimagedocker -f Dockerfile .")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image("myimagedocker").inside {
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
