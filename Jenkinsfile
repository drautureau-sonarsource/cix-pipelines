pipeline {
  agent none
  stages {
    stage('Build') {
      parallel {
        stage('Gradle') {
          agent {
            node {
              label 'linux'
            }
          }
          tools {
            jdk 'Java 8'
          }
          steps {
            echo 'Building with Gradle...'
            sh './gradlew build'
          }
        }
        stage('Maven') {
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
            echo 'Building with Maven...'
            sh 'mvn package'
          }
        }
      }
    }
    stage('QA') {
      parallel {
        stage('Gradle') {
          agent {
            node {
              label 'linux'
            }
          }
          tools {
            jdk 'Java 8'
          }
          steps {
            echo 'Running IT with Gradle ...'
            sh './gradlew test'
          }
        }
        stage('Maven') {
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
            echo 'Running IT with Maven ...'
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