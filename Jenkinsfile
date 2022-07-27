pipeline {
    agent any
    tools {
        maven "Maven 3.8.5"
    }

    stages {
        stage('Compile and Clean') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Build Docker image'){
            steps {
                echo "Hello Spring boot App"
                sh 'docker build -t  nhathoang/jenkins_springboot_deploy:lastest .'
            }
        }
        stage('Docker Login'){
            steps {
                 withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                   sh 'echo Docker username: $USERNAME'
                   sh 'echo Docker password: $PASSWORD'
                   sh "docker login -u $USERNAME -p $PASSWORD"
                 }
            }
        }
        stage('Docker Push'){
            steps {
                sh 'docker push nhathoang/jenkins_springboot_deploy:lastest'
            }
        }
        stage('Docker deploy'){
            steps {
                sh 'docker run -itd -p  8081:8080 nhathoang/jenkins_springboot_deploy:lastest'
            }
        }
    }

    post {
        success {
          echo "SUCCESSFUL"
        }
        failure {
          echo "FAILED"
        }
      }
}
