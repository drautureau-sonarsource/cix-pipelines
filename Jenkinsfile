pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
        node {
          label 'linux'
        }
        
      }
      steps {
        echo 'Building ...'
      }
    }
    stage('QA') {
      parallel {
        stage('IT 1') {
          agent {
            node {
              label 'linux'
            }
            
          }
          steps {
            echo 'Running IT 1 ...'
          }
        }
        stage('IT 2') {
          agent {
            node {
              label 'linux'
            }
            
          }
          steps {
            echo 'Running IT 2 ...'
          }
        }
      }
    }
    stage('Promote') {
      steps {
        echo 'Promoting ...'
      }
    }
  }
}