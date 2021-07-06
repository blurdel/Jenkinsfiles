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
                sh 'java -version'
                sh 'mvn --version'
            }
        }
        stage("Build A nd B") {
            failFast true
            parallel (
                stage('Build A') {
                    steps {
                        echo "Stage: Build A"
                        // build(job: '/CICDemo/master', wait: true)
                    }
                }
                stage('Build B') {
                    steps {
                        echo "Stage: Build B"
                        //build(job: '/CppCICD', parameters: [booleanParam(name: 'RunTestManager', value: false)], wait: false)
						//build(job: '/CppCICD/master', wait: true)
                    }
                }
            )
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
