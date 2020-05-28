pipeline {
  agent any
  stages {
    stage('Ping') {
      steps {
        sh 'ansible all -i hosts -m ping -f 5'
      }
    }

    stage('Install Docker') {
      steps {
        ansiblePlaybook(playbook: 'dependencies.yml', inventory: 'hosts', colorized: true, becomeUser: 'all')
      }
    }

    stage('Download Odoo') {
      steps {
        sh 'docker pull odoo'
      }
    }

  }
}