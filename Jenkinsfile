def D_IMAGE
pipeline {
  agent {
    label 'master'
  }
  stages {
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
          D_IMAGE = docker.build "registry.kartaca.com:5000/sppline:$BUILD_NUMBER"
        }
        sh "echo $D_IMAGE"
      }
    }
    stage('image-push') {
      steps{
        script {
          D_IMAGE.push()
        }
      }
    }
    stage('deploy-k8s') {
      steps{
        sh 'echo $D_IMAGE'
	kubernetesDeploy(kubeconfigId: 'anthos-k8s-kubeconfig',
         configs: 'k8s-resources.yaml',
	 enableConfigSubstitution: true        
	)
      }
    }
  }
}
