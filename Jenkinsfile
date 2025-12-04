pipeline {
    agent any

    tools {
        maven '3.9.11'
    }

    stages {

        stage('Checkout') {
            steps {
                echo "Checking out source code..."
                git branch: 'main', url: 'https://github.com/ratelm1-art/spring-boot-final.git'
            }
        }

        stage('Build JAR') {
            steps {
                echo "Building project with Maven..."
                sh './mvnw clean install -DskipTests'
            }
        }

        stage('Publish to Nexus') {
            steps {
                echo "Simulating upload of JAR to Nexus..."

                sh '''
                    echo "Listing built JARs:"
                    ls -l target/*.jar || echo "No JAR produced."

                    # Real Nexus example (NOT required for the final):
                    # curl -v -u admin:admin123 --upload-file target/*.jar \
                    #   http://nexus-service:8081/repository/maven-releases/springboot-app.jar
                '''
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }

    post {
        success {
            echo "Final Project Pipeline Completed Successfully!"
        }
        failure {
            echo "Pipeline Failed."
        }
    }
}
