pipeline {
  agent any
  stages {
    stage('ping') {
      steps {
        ansibleVault(action: 'ping', content: 'hosts')
        ansiblePlaybook 'dependencies.yml'
      }
    }

  }
}