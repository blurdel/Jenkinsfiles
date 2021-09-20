def map = [
    Bob  : 42,
    Alice: 54,
    Max  : 33
]


pipeline {
    agent none
            
    stages {

        map.each { entry ->
            stage($entry.key) {
                steps {
                    timestamps {
                        echo "$entry.value"
                    }
                }
            }        
        }
        
    }

}
