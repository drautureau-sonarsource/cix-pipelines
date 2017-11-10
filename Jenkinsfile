pipeline {
  agent none
  stages {
    stage('GitHub to BURGR') {
      agent {
        node {
          label 'linux'
        }
      }
      steps {
        echo 'Simulate a notification to BURGR from GitHub (push, PRs, ...)'
        dir(path: 'burgr-notifications-files') {
          sh './change-commit-burgr.sh'
          sh 'curl -X POST -d @commit-burgr.tmp --header "Content-Type:application/json" http://burgr:8090/api/commit/github'
        }
      }
    }
    stage('Build') {
      failFast true
      //steps {
        //dir(path: 'burgr-notifications-files') {
          //sh 'env'
          //sh './change-step-burgr.sh started'
          //sh 'curl -X POST -d @step-burgr.tmp --header "Content-Type:application/json" http://burgr:8090/api/stage'
        //}
      //}
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