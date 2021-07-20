pipeline {
    agent none

    stages {

        stage('Example Maven Build') {
            agent { docker 'maven:3.8.1-openjdk-11' }
            steps {
                echo "Stage: Maven"
                sh 'mvn --version'
            }
        }
        stage('Example Test') {
            agent { docker 'openjdk:8-jre' }
            steps {
                echo "Stage: Test"
                sh 'java -version'
            }
        }
    }
}
