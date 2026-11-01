pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Source code checkout completed.'
            }
        }

        stage('Build and Validation') {
            steps {
                echo 'Validating Restaurant Website files...'
                bat 'if exist index.html (echo index.html found) else (exit /b 1)'
            }
        }

        stage('Test') {
            steps {
                echo 'Running basic website tests...'
                bat 'if exist style.css (echo CSS file found) else (exit /b 1)'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying Restaurant Website...'
                bat 'if not exist deployed-site mkdir deployed-site'
                bat 'copy /Y *.html deployed-site\\'
                bat 'copy /Y *.css deployed-site\\'
                echo 'Deployment completed successfully.'
            }
        }
    }

    post {
        success {
            echo 'CI/CD Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the build logs.'
        }
    }
}