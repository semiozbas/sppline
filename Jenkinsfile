pipeline {
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
      docker.withRegistry('http://10.34.11.198:5000') {

        def customImage = docker.build("sppline:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
        customImage.push()
    }

    }
  }
}
