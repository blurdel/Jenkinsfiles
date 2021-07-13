pipeline {
    agent none

    environment {
        color = "blue"
    }

    stages {

        stage("Shell") {
            agent { label 'master' }
            steps {
                echo "Stage: Shell"
                sh "printenv | sort"
            }
        }
        stage("Env Object") {
            agent { label 'master' }
            steps {
                echo "Stage: Env Object"
                script {
                    def fields = env.getEnvironment()
                    fields.each {
                        k, v -> println("${k} = ${v}");
                    }
                    println(env.PATH)
                }
            }
        }
        stage("Other") {
            agent { label 'master' }
            environment {
                JPATH = sh(script: 'pwd', , returnStdout: true).trim()
            }
            steps {
                echo "Stage: Other"
                echo 'Hello'
                echo "JPATH=${JPATH}"
                sh 'echo "JPATH=${JPATH}"'
            }
        }
/*
        stage("Test Manager") {
            steps {
                echo "Stage: Test Manager"
                sh './start_app.sh tm-config.json'
            }
        }
        stage("Cleanup") {
            steps {
                echo "Stage: Cleanup"
                deleteDir()
            }
        }
*/
    }

}
