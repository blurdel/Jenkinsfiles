pipeline {
    agent none

    // https://code-maven.com/jenkins-pipeline-environment-variables

    environment {
        color = "blue"
        first_path = getFirst()
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
        stage("Function") {
            agent { label 'master' }
            steps {
                echo "Stage: Function"
                print(env.first_path)                
            }
        }
        stage("Dir Size") {
            agent { label 'master' }
            steps {
                scripts {
                    DIR_SIZE = new File(".").directorySize()
                }
            }
        }

    }

}

def getFirst() {
    node('master') {
        return env.PATH.split(':')[0]
    }
}
