pipeline {
    agent any

     tools {
        // Sử dụng dotnetsdk thay vì dotNetCore
        dotnetsdk 'dotnetcore-sdk'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // Chạy lệnh để xây dựng dự án.NET
                sh './dotnet build --configuration Release'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing...'
                // Thêm các lệnh kiểm tra nếu cần
            }
        }

        stage('Publish') {
            steps {
                echo 'Publishing...'
                // Lệnh để xuất bản ứng dụng
                sh './dotnet publish --configuration Release --output./publish'
            }
        }
    }
}
