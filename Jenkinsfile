def choiceArray = []
def tcNameArray = []

node {
    checkout scm
    def folders = sh(returnStdout: true, script: "ls $WORKSPACE")

    folders.split().each {
        // condition to skip files, if any
        choiceArray << it
    }

    // Can read a file to get names
    testcases = readFile("testcases.txt").split("\\r?\\n");
    testcases.each { String tcname ->
        echo "tcname: ${tcname}"
        tcNameArray << tcname
    }
}

pipeline {
    agent any

    parameters {
        choice(name: 'CHOICES', choices: choiceArray, description: "Please Select CHOICE")
        choice(name: 'TCNAME', choices: tcNameArray, description: "Please Select Testcase")
    }
            
    stages {
        stage('debug') {
            steps {
                echo "Selected choices: ${params.CHOICES}, ${params.TCNAME}"
            }
        }
    }

}
