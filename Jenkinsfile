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
        sh 'ansible all -i hosts -a "sudo systemctl enable docker"'
      }
    }

    stage('Donwload Odoo') {
      steps {
        ansiblePlaybook(playbook: 'imagen.yml', colorized: true, becomeUser: 'all', inventory: 'hosts')
      }
    }

    stage('Enviar docker-compose') {
      steps {
        sh '''ansible all -i hosts -m copy -a "src=docker-compose.yml dest=/etc/docker/docker-compose.yml"
ansible all -i hosts -m copy -a "src=script.sh dest=/etc/docker/script.sh"
ansible all -i hosts -a "sudo chmod -x /etc/docker/script.sh"
ansible all -i hosts -a "sudo cp /etc/docker/script.sh /etc/init.d/"
ansible all -i hosts -a "sudo update-rc.d script.sh defaults"


'''
      }
    }

    stage('Iniciar Odoo') {
      steps {
        ansiblePlaybook(playbook: 'iniciar_docker.yml', colorized: true, becomeUser: 'all', inventory: 'hosts')
      }
    }

  }
}