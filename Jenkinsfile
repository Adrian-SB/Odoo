pipeline {
  agent any
  stages {
    stage('Install') {
      steps {
        echo 'Ansible instalado'
      }
    }

    stage('Ping') {
      steps {
        sh 'ansible all hosts -m ping'
      }
    }

  }
}