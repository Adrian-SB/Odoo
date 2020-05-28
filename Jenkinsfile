pipeline {
  agent any
  stages {
    stage('ping') {
      steps {
        ansibleVault(action: 'ping', content: 'hosts', input: 'ping')
      }
    }

  }
}