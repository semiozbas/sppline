pipeline {
  environment { 
      DOCKER_IMAGE = ''
  }
  agent {
    label 'master'
  }
  stages {
    stage("Checkout") {
      steps {
        checkout scm
      }
    }
    stage('Build') {
      steps {
        sh """
	/usr/bin/python3 -m venv helloworld-build
        . ./helloworld-build/bin/activate
        pip install -r requirements.txt
        """
      }
    }
    stage('Test') {
      steps {
        sh """
	. ./helloworld-build/bin/activate
	pytest test.py
	"""
      }   
    }
    stage('image-build') {
      steps{
        script {
          DOCKER_IMAGE = docker.build "10.34.11.198:5000/sppline:$BUILD_NUMBER"
        }
        sh "echo $DOCKER_IMAGE"
      }
    }
    stage('image-push') {
      steps{
        script {
          docker.push(DOCKER_IMAGE)
        }
      }
    }
  }
}
