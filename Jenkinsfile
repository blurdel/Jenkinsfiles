pipeline {
    agent any
    
    environment {
        SOME_STATIC_VERSION = "0.0.1"
        USER_CREDS = credentials('juser-creds')
    }
    parameters {
         string(name: 'param1', defaultValue: '', description: 'Enter any value for param1')
         choice(name: 'version', choices: ['1.1.0', '1.2.0', '1.3.0'], description: 'Select the version for this build')
         booleanParam(name: 'Run_Unit_Tests', defaultValue: true, description: 'Do you want to run Unit Tests?')
    }
    tools {
		maven 'mvn'
	}

    stages {

        stage("Init") {
            steps {
                echo "Running: Init"
                echo "${params.param1} ${params.version} ${params.Run_Unit_Tests}"
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
                echo "Using some static version ${SOME_STATIC_VERSION}"
                echo "Using param1 = ${params.param1}"
            }
        }
        stage("Test") {
            when {
                expression {
                    params.Run_Unit_Tests == true
                }
            }
            steps {
                echo "Running: Test"
                /* `make check` returns non-zero on test failures,
                * using `true` to allow the Pipeline to continue nonetheless
                */
                sh 'make check || true' 
                // junit '**/target/*.xml'
            }
        }
        stage("Deploy") {
            steps {
                echo "Running: Deploy"
                echo "Deploying version: ${params.version}"

                echo "creds: ${USER_CREDS}"
                withCredentials ([
                    usernamePassword(credentialsId: 'juser-creds', usernameVariable: 'USER', passwordVariable: 'PASS')
                ]) {
                    sh 'echo creds: ${USER} ${PASS}'
                    sh('curl -u $USER_CREDS_USR:$USER_CREDS_PSW http://localhost:8080/hello')
                }
                // sh 'make publish'
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
