pipeline {
    agent any
    
    stages {
        stage('Build Docker Image') {
            steps {
                git 'https://github.com/tfg2asircanaveral2024/9-proyecto-powershell-.git'
                sh 'docker build -t ubuntu-powershell:latest -f Dockerfile .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run --rm ubuntu-powershell:latest pwsh -Command "Get-Module -ListAvailable"'
            }
        }
    }

    post {
        always {
            cleanWs() // Limpiar el espacio de trabajo al finalizar el pipeline
        }
    }
}
