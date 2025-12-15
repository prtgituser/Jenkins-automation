pipeline {
    agent any
    stages {
        stage('git checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/prtgituser/Jenkins-automation']])
                bat 'mvn clean install'
            }
        }

        stage('build dockerimage'){
            steps{
                sh 'docker build -t prtdockerhub/jenkins-automation:latest .'
            }
        }

          stage('push image to dockerhub'){
              steps{
                 //login to dockerhub first in order to push image
                 //added dockerhub-creds using 'pipeline syntax-addWithcredentials-secret text'
                 withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                 sh 'docker login -u prtdockerhub -p ${dockerhubpwd}'

                 sh 'docker push prtdockerhub/jenkins-automation:latest'
                 }
              }
          }
    }
}