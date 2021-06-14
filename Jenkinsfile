pipeline {
    agent any
    
    environment {
        SOME_VERSION = "1.1.0"
        USER_CREDS = credentials('juser-creds')
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
                    // env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'main'
                    env.BRANCH_NAME == 'nana-demo'
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

                echo "creds: ${USER_CREDS}"
                withCredentials ([
                    usernamePassword(credentials: 'juser-creds', usernameVariable: USER, passwordVariable: PWD)
                ]) {
                    // echo "creds: ${USER} ${PWD}"
                    sh('curl -u $USER_CREDS_USR:$USER_CREDS_PSW https://localhost:8080/test')
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
