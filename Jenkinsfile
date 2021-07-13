pipeline {
    agent none

    environment {
        color = "blue"
    }

    stages {

        stage("Shell") {
            agent { label 'master' }
            steps {
                sh "printenv | sort"
            }
        }

        stage("Env Object") {
            agent { label 'master' }
            steps {
                script {
                    def fields = env.getEnvironment()
                    fields.each {
                        k, v -> println("${k} = ${v}");
                    }
                    println(env.PATH)
                }
            }
        }
/*
        stage("Test") {
            steps {
                echo "Stage: Test"
            }
        }
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
