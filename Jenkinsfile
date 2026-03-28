pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDS = 'dockerhub-creds'   // Jenkins credentials ID for Docker Hub
        DOCKER_IMAGE = 'keneanyaragbu/java-ci-cd' // Docker Hub repo
        JAVA_TOOL = 'Java 17'                   // JDK 17 in Jenkins Global Tool Configuration
    }

    tools {
        jdk "${JAVA_TOOL}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/keneanyaragbu/java-ci-cd.git'
            }
        }

        stage('Build Java App') {
            steps {
                sh 'mvn clean package'
                sh 'ls -l target/'   // Verify JAR exists
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE}:latest ."
                }
            }
        }

        stage('Test Docker Image') {
            steps {
                script {
                    sh "docker run --rm ${DOCKER_IMAGE}:latest"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_HUB_CREDS}", passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                        sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                        sh "docker push ${DOCKER_IMAGE}:latest"
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Build, Docker, and push succeeded!'
        }
        failure {
            echo 'Something went wrong.'
        }
    }
}
