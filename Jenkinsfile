pipeline {
  agent { docker { image 'python:3.7.2' } }
  stages {
    stage('build') {
      steps {
        sh '''
            python -m venv .venv
            . .venv/bin/activate
            pip intall -r requirements.txt
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
