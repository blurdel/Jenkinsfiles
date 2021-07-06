pipeline {
    agent any
    
	options {
		timestamps() // Add timestamps to logging
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
        stage("Run Job") {
            steps {
                echo "Stage: Run Job"
                build(job: '/CppCICD/master', parameters: [booleanParam(name: 'RunTestManager', value: false)], wait: true)
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
