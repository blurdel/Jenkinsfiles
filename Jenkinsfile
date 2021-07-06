pipeline {
    agent any
    
    environment {
        // Set parameters for jobs
        test = "groovy"
        testbed = "my testbed"
    }
    //agent {
    //    label $testbed
    //}
    stages {
        stage ("Stage 1") {
            steps {
                echo "$test"
                echo "$testbed"
            }
        }
    }
}
