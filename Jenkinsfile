pipeline {
  environment {
    registry = "10.34.11.198:5000/"
    dockerImage = ''
  }
  agent {
    label 'master'
  }
  stages {
    stage('build') {
      steps {
        sh """
	/usr/bin/python3 -m venv helloworld-build
        . ./helloworld-build/bin/activate
        pip install -r requirements.txt
        """
      }
    }
    stage('test') {
      steps {
        sh """
	. ./helloworld-build/bin/activate
	pytest test.py
	"""
      }   
    }
    stage('create-image') {
      steps{
        withEnv(["HOME=${env.WORKSPACE}"]) {
          script {
            dockerImage = docker.build registry + "sppline:$BUILD_NUMBER"
          }
        }
      }
    }
  }
}
