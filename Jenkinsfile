def strSAMS = "SAM-T,SAM-S,SAM-D"
def allSAMS = ['SAM-T', 'SAM-S', 'SAM-D']
def tcStart = []
def tcEnd = []

def Greet(name) {
    echo "Hello ${name}"
}

node {
/*
    echo "ALL SAMS:"
    allSAMS.each { String name ->
        echo "${name}"
    }
*/
    for (int i = 1; i < 10; i++) {
        tcStart << i
    }
    for (int i = 1; i < 10; i++) {
        tcEnd << i
    }
}

properties([
    parameters([
        [$class: 'ChoiceParameter',
            choiceType: 'PT_MULTI_SELECT',
            filterLength: 1,
            filterable: false,
            name: 'SAMS',
            script: [
                $class: 'GroovyScript',
                fallbackScript: [
                    classpath: [],
                    sandbox: false,
                    script:
                        'return["Check Jenkins ScriptApproval page"]'
                ],
                script: [
                    classpath: [],
                    sandbox: false,
                    script:
                        'return["SAM-T:selected", "SAM-S", "SAM-D"]'
                ]
            ]
        ]
    ])
])

pipeline {
    agent any

    options {
        timestamps()
        timeout(time: 1, unit: 'MINUTES')
        
        buildDiscarder(logRotator(numToKeepStr: '10'))
        disableConcurrentBuilds()    
    }

    stages {

        stage('Init') {
            steps {
                echo 'Stage: Init'
                echo "branch=${env.BRANCH_NAME}"
            }
        }
        stage('Misc') {
            steps {
                echo 'Stage: Misc'
                Greet('david')
                script {
                    try {
                        // Fails with non-zero exit if dir1 does not exist
                        def dir1 = sh(script: 'dir', returnStdout:true).trim()
                    } catch (Exception ex) {
                        println("Unable to read dir1: ${ex}")
                    }
                }
            }
        }
        stage('Active Choice') {
            steps {
                echo "SAMS=${params.SAMS}"
            }
        }
    }
    post {
        always {
            echo "post/always"
            deleteDir() //clean workspace
        }
        success {
            echo "post/success"            
        }
        failure {
            echo "post/failure"            
        }
    }
}
