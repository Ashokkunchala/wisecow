pipeline {
    agent any

    stages {
        stage('git-clone') {
            steps {
                git branch: 'main', url: 'https://github.com/Ashokkunchala/wisecow.git'
            }
        }
        stage('docker-actions') {
            steps {
                withDockerRegistry(credentialsId: 'docker-cred', url: 'https://index.docker.io/v1/') {
                    sh "docker build -t outlookdock/wisecow:latest ."
                    sh "docker push outlookdock/wisecow:latest"
                }
            }
        }
        stage('Deploy App on k8s') {
      steps {
        withCredentials([
            string(credentialsId: 'my_kubernetes', variable: 'api_token')
            ]) {
             sh 'kubectl --token $api_token --server https://192.168.49.2:8443  --insecure-skip-tls-verify=true apply -f wisecow-deployment.yaml '
               }
            }
            
        }
    }
}
