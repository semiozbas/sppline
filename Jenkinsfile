pipeline {
  agent { docker { image 'python:3.7.2' } }
  stages {
    stage('build') {
      steps {
        sh '''
            python3 -m venv helloworld
            source helloworld/bin/activate
            pip install -r requirements.txt
            pytest -v
        '''
      }
    }
    stage('test') {
      steps {
        sh 'python test.py'
      }   
    }
  }
}
