pipeline {
    agent any
    stages {
		stage('Pull code') {
            steps {
				git branch: "main",
				url: 'https://github.com/up1/demo-go-sonarqube.git'
            }
        }
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