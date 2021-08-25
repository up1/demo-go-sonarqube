pipeline {
    agent any
	environment {
		SOURCE_PATH=/var/jenkins_home/workspace/demo-go
		SONAR_URL=http://134.209.106.104:9000
		SONAR_SECRET=4f2dcaf29fb346a115bf22586b31b67615e0f080
	}
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
                sh 'make start-sonar-scanner'
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