pipeline {
    agent any

    tools {
        // Sử dụng .NET SDK 6
        dotnet '6.0'
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the repository
                git 'https://github.com/mtai0524/Computer-Science.git'
            }
        }
        stage('Restore') {
            steps {
                // Restore dependencies
                sh 'dotnet restore'
            }
        }
        stage('Build') {
            steps {
                // Build the project
                sh 'dotnet build --configuration Release'
            }
        }
        stage('Test') {
            steps {
                // Run tests
                sh 'dotnet test --configuration Release'
            }
        }
        stage('Publish') {
            steps {
                // Publish the application
                sh 'dotnet publish --configuration Release --output ./publish'
            }
        }
    }

    post {
        always {
            // Clean up after the build
            cleanWs()
        }
    }
}
