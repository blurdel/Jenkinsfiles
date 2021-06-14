pipeline {
    agent any
    
    stages {

        stage("Init") {
            steps {
                echo "Running: Init"
                sh 'mvn --version'
            }
        }
        stage("Build") {
            steps {
                echo "Running: Build"
            }
        }
        stage("Test") {
            steps {
                echo "Running: Test"
            }
        }
        stage("Deploy") {
            steps {
                echo "Running: Deploy"
            }
        }

    }
    
    
}
