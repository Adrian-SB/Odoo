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

    stage('Donwload Odoo') {
      steps {
        ansiblePlaybook(playbook: 'imagen.yml', colorized: true, becomeUser: 'all', inventory: 'hosts')
      }
    }

    stage('Initial Odoo') {
      steps {
        ansiblePlaybook(playbook: 'iniciar_docker.yml', colorized: true, becomeUser: 'all', inventory: 'hosts')
      }
    }

  }
}