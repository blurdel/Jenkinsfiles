def map = [
    Bob: 42,
    Stage2: B,
    Stage3: C
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
