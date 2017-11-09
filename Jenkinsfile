pipeline {
  agent none
  stages {
    stage('Build') {
      agent {
        node {
          label 'linux'
        }
      }
      tools {
        jdk 'Java 8'
        maven 'Maven 3.3.9'
      }
      steps {
        echo 'Building ...'
        sh 'mvn package'
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
          tools {
            jdk 'Java 8'
            maven 'Maven 3.3.9'
          }
          steps {
            echo 'Running IT 1 ...'
            sh 'mvn test'
          }
        }
        stage('IT 2') {
          agent {
            node {
              label 'linux'
            }
          }
          tools {
            jdk 'Java 8'
            maven 'Maven 3.3.9'
          }
          steps {
            echo 'Running IT 2 ...'
            sh 'mvn test'
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