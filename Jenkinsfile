pipeline {
    agent any

    environment {
        EC2_HOST = '13.233.146.99'
        EC2_USER = 'ubuntu'
    }

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

        stage('Deploy to EC2') {
            steps {
                sshagent(credentials: ['restaurant-ec2-key']) {
                    bat '''
                    scp -o StrictHostKeyChecking=no *.html *.css *.jpg *.jpeg *.png *.ico *.webmanifest %EC2_USER%@%EC2_HOST%:/home/ubuntu/restaurant-website/
                    ssh -o StrictHostKeyChecking=no %EC2_USER%@%EC2_HOST% "sudo cp /home/ubuntu/restaurant-website/* /var/www/html/ && sudo systemctl restart nginx"
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'CI/CD Pipeline completed successfully and website deployed to EC2!'
        }
        failure {
            echo 'Pipeline failed. Please check the build logs.'
        }
    }
}