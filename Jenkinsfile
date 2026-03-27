pipeline {
    agent any
    tools { jdk 'Java 17' }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/keneanyaragbu/java-ci-cd.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
    }
}
