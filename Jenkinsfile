pipeline {
    agent none

    environment {
        color = "blue"
    }

    stages {

        stage("First") {
            agent { label 'master' }
            steps {
                sh "printenv | sort"
            }
        }
/*
        stage("Build") {
            steps {
                echo "Stage: Build"
            }
        }
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
