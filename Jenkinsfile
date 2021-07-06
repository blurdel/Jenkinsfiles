pipeline {
    agent any
    
	options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }
	
    tools {
		maven 'mvn'
	}

    stages {
        stage("Init") {
            steps {
                echo "Stage: Init"
                echo "branch=${env.BRANCH_NAME}"
                //sh 'java -version'
                //sh 'mvn --version'
            }
        }
        stage("Sleep") {
            steps {
                echo "Stage: Sleep"
                sleep(time: 30, unit: 'SECONDS')
            }
        }
        stage("Cleanup") {
            steps {
                echo "Stage: Cleanup"
                deleteDir()
            }
        }
    }
    post {
        always {
            echo "Running post/always"
            deleteDir()
        }
        success {
            echo "Running post/success"
        }
        failure {
            echo "Running post/failure"
        }
    }
}
