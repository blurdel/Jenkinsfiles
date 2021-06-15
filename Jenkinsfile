pipeline {
    agent none
    
    environment {
        SOME_STATIC_VERSION = "0.0.1"
        USER_CREDS = credentials('juser-creds')
    }
    parameters {
         string(name: 'param1', defaultValue: '', description: 'Enter any value for param1')
         choice(name: 'version', choices: ['1.1.0', '1.2.0', '1.3.0'], description: 'Select the version for this build')
         booleanParam(name: 'unitTests', defaultValue: true, description: 'Do you want to run Unit Tests?')
    }
    tools {
		maven 'mvn'
	}

    stages {

        stage("Init") {
            agent any
            steps {
                echo "Stage: Init"
                echo "branch=${env.BRANCH_NAME}, param1=${params.param1}, version=${params.version}, unitTests=${params.unitTests}"
                sh 'java -version'
                sh 'mvn --version'
            }
        }
        stage("Build") {
            agent { label 'linux' }
            when {
                expression {
                    env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'main'
                }
            }
            options {
                timeout(time: 2, unit: 'MINUTES')
            }
            steps {
                echo "Stage: Build"
                echo "Using some static version ${SOME_STATIC_VERSION}"
                echo "Using param1 = ${params.param1}"
                // sh 'mvn clean verify -DskipTests'
            }
        }
        stage("Test") {
            agent { label 'Linux' }
            when {
                expression {
                    params.unitTests == true
                }
            }
            steps {
                echo "Stage: Test"
                /* `make check` returns non-zero on test failures,
                * using `true` to allow the Pipeline to continue nonetheless
                */
                sh 'mvn test || true' 
                junit(allowEmptyResults: false, testResults: '**/target/*.xml')
            }
        }
        stage("Test Manager") {
            agent any
            options {
                timeout(time: 2, unit: 'MINUTES')
            }
            steps {
                echo "Stage: Test Manager"
                sh './start_app.sh tm-config.json'
            }
        }
        stage("Deploy") {
            agent any
            steps {
                echo "Stage: Deploy"
                echo "Deploying version: ${params.version}"

                echo "creds: ${USER_CREDS}"
                withCredentials ([
                    usernamePassword(credentialsId: 'juser-creds', usernameVariable: 'USER', passwordVariable: 'PASS')
                ]) {
                    sh 'echo creds: ${USER} ${PASS}'
                    sh 'curl -u $USER_CREDS_USR:$USER_CREDS_PSW http://localhost:8080/hello'
                }
                // sh 'make publish'
            }
        }
        stage("Cleanup") {
            agent any
            steps {
                echo "Stage: Cleanup"
                deleteDir()
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
