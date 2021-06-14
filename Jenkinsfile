pipeline {
    environment {
        // Set parameters for jobs
        test = "groovy"
    }
    agent {
        label $testbed
    }
    stages {
        stage ("Stage 1") {
            steps {
                echo "$test"
            }
        }
    }
}
