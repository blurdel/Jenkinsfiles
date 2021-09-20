def map = [
    Bob  : 42,
    Alice: 54,
    Max  : 33
]


pipeline {
    agent any
            
    stages {

        stage('Init') {
            steps {
                script {
                    map.each { ->
                        stage(entry.key) {
                            timestamps {
                                echo "$entry.value"
                            }
                        }
                    }
                }
            }
        }
        
    }

}
