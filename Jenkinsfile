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
                        'return["SAMT:selected", "SAMS", "SAMD"]'
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
