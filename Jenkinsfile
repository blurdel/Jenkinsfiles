def map = [
    Bob  : 42,
    Alice: 54,
    Max  : 33
]


pipeline {
    agent any
            
    stages {

        stage ("Init") {
            steps {
                echo "Stage: Init"
                loopNames(map)                
            }
        }

    }
}

def loopNames(map) {
    map.each {
        k, v -> println k + " -> " + v
    }    
}
