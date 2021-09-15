pipeline {
  agent {
    label 'master'
  }
  stages {
    stage('build') {
      steps {
        sh '''
            whoami
            pwd
            python -m venv helloworld
            . ./helloworld/bin/activate
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
