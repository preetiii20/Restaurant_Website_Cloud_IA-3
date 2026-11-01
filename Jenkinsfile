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
                bat 'if exist order.html (echo order.html found) else (exit /b 1)'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent(credentials: ['restaurant-ec2-key']) {
                    bat '''
                        scp -o StrictHostKeyChecking=no *.html *.css *.jpg *.jpeg *.png *.ico *.webmanifest ubuntu@13.233.146.99:/home/ubuntu/restaurant-website/

                        ssh -o StrictHostKeyChecking=no ubuntu@13.233.146.99 "sudo cp /home/ubuntu/restaurant-website/*.html /var/www/html/ && sudo cp /home/ubuntu/restaurant-website/*.css /var/www/html/ && sudo cp /home/ubuntu/restaurant-website/*.jpg /var/www/html/ && sudo cp /home/ubuntu/restaurant-website/*.jpeg /var/www/html/ && sudo cp /home/ubuntu/restaurant-website/*.png /var/www/html/ && sudo cp /home/ubuntu/restaurant-website/*.ico /var/www/html/ && sudo cp /home/ubuntu/restaurant-website/*.webmanifest /var/www/html/ && sudo systemctl restart nginx"
                    '''
                }
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