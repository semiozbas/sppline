pipeline {
  agent { }
  stages {
    stage('build') {
      steps {
        sh '''
            python3 -m venv helloworld
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
