pipeline {
  agent none
  stages {
    stage('BURGR: GitHub (fake)') {
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
    stage('BURGR: build start') {
      agent {
        node {
          label 'linux'
        }
      }
      steps {
        dir(path: 'burgr-notifications-files') {
          sh './change-step-burgr.sh Build build started'
          sh 'curl -X POST -d @step-burgr.tmp --header "Content-Type:application/json" http://burgr:8090/api/stage'
        }
      }
    }
    stage('Build') {
      failFast true
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
      post {
        /* START */
        /* We definitivly need to avoid this verbose stuff and remove the requirement of a node */
        success {
          node('linux') {
            checkout scm // To be able to get access to SCM environment variables
            dir(path: 'burgr-notifications-files') {
              sh 'env'
              sh './change-step-burgr.sh Build build passed'
              sh 'cat step-burgr.tmp'
              sh 'curl -X POST -d @step-burgr.tmp --header "Content-Type:application/json" http://burgr:8090/api/stage'
            }
          }
        }
        failure {
          node('linux') {
            dir(path: 'burgr-notifications-files') {
              sh './change-step-burgr.sh Build build failed'
              sh 'curl -X POST -d @step-burgr.tmp --header "Content-Type:application/json" http://burgr:8090/api/stage'
            }
          }
        }
        unstable {
          node('linux') {
            dir(path: 'burgr-notifications-files') {
              sh './change-step-burgr.sh Build build failed'
              sh 'curl -X POST -d @step-burgr.tmp --header "Content-Type:application/json" http://burgr:8090/api/stage'
            }
          }
        }
        aborted {
          node('linux') {
            dir(path: 'burgr-notifications-files') {
              sh './change-step-burgr.sh Build build canceled'
              sh 'curl -X POST -d @step-burgr.tmp --header "Content-Type:application/json" http://burgr:8090/api/stage'
            }
          }
        }
      }
      /* END */
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