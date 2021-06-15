pipeline {
    agent any
    
    tools {
		maven 'mvn'
	}

    stages {

        stage("Init") {
            steps {
                echo "Stage: Init"
                echo "branch=${env.BRANCH_NAME}, param1=${params.param1}, version=${params.version}, unitTests=${params.unitTests}"
                sh 'java -version'
                sh 'mvn --version'
            }
        }
        stage("Build") {
            steps {
                echo "Stage: Build"
                // sh 'mvn clean verify -DskipTests'
            }
        }
        stage("Test") {
            steps {
                echo "Stage: Test"
            }
        }
        
        stage("Cleanup") {
            steps {
                echo "Stage: Cleanup"
                deleteDir()
            }
        }

    }
}
