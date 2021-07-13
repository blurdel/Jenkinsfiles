pipeline {
    agent any

    stages {

        stage("Curl Test") {
            steps {
                echo "Stage: Curl Test"
                script {
                    //final String url = "http://localhost:8080/job/tm/job/master/job/sdkman/2/api/json"
                    final String url = "https://api.github.com/repos/blurdel/Jenkinsfiles/commits?per_page=5"
                    final String resp = sh(script: "curl -s $url", returnStdout: true).trim()
                    echo resp
                }
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
            echo "post/always"
        }
        success {
            echo "post/success"
        }
        failure {
            echo "post/failure"
        }
    }
}
