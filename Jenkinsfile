pipeline {
    agent any

    tools {
        dotnetsdk '6.0'
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the repository with depth 1
                git(url: 'https://github.com/mtai0524/Computer-Science.git', branch: 'main', depth: 1)
            }
        }
        stage('Restore') {
            steps {
                dir('CodeFirst/CodeFirst') { // Điều chỉnh đường dẫn này
                    sh 'dotnet restore'
                }
            }
        }
        stage('Build') {
            steps {
                dir('CodeFirst/CodeFirst') { // Điều chỉnh đường dẫn này
                    sh 'dotnet build --configuration Release'
                }
            }
        }
        stage('Test') {
            steps {
                dir('CodeFirst/CodeFirst') { // Điều chỉnh đường dẫn này
                    sh 'dotnet test --configuration Release'
                }
            }
        }
        stage('Publish') {
            steps {
                dir('CodeFirst/CodeFirst') { // Điều chỉnh đường dẫn này
                    sh 'dotnet publish --configuration Release --output./publish'
                }
            }
        }
    }

    post {
        success {
            echo 'SUCCESSFUL'
        }
        failure {
            echo 'FAILED'
        }
    }
}
