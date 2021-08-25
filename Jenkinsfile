pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'make clean && make build'
            }
        }
		stage('Testing') {
            steps {
                sh 'make test'
            }
        }
		stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('My SonarQube Server') {
                    
                }
            }
        }
        stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
                    // true = set pipeline to UNSTABLE, false = don't
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}