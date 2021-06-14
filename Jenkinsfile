pipeline {
    agent any
    
    environment {
        SOME_VERSION = "1.1.0"
        SERVER_CREDENTIALS = credentials('juser-creds')
    }
    parameters {
         string(name: 'PARAM1', defaultValue: '', description: 'Description of param1 param')
         choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: 'Description of choice param')
         booleanParam(name: 'runTests', defaultValue: false, description: 'Description of boolean param')
    }
    tools {
		maven 'mvn'
	}

    stages {

        stage("Init") {
            steps {
                echo "Running: Init"
		sh 'java -version'
		sh 'mvn --version'
            }
        }
        stage("Build") {
            when {
                expression {
                    env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'main'
                }
            }
            steps {
                echo "Running: Build"
                echo "Building version ${SOME_VERSION}" 
            }
        }
        stage("Test") {
            when {
                expression {
                    params.runTests == true
                }
            }
            steps {
                echo "Running: Test"
            }
        }
        stage("Deploy") {
            steps {
                echo "Running: Deploy"
                echo "Deploying version: ${params.VERSION}"

                echo "creds: ${SERVER_CREDENTIALS}"
                withCredentials ([
                    usernamePassword(credentials: 'juser-creds', usernameVariable: USER, passwordVariable: PWD)
                ]) {
                    echo "creds: ${USER} ${PWD}"
                }
            }
        }

    }
    post {
        always {
            echo "Running post/always"
        }
        success {
            echo "Running post/success"
        }
        failure {
            echo "Running post/failure"
        }
    }
}
