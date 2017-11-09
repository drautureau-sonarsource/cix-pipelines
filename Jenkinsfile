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
        sh '''ls
           env'''
/*for file in POST.commit.github/*.json
do
	curl -X POST  -d @$file --header Content-Type:application/agent --user-agent post.test.data.commit.payload/1.0.0 http://localhost:8080/api/commit/github;
  HTTP_CODE=`curl --silent --output out.txt --write-out %{http_code} -X POST -d @$BURGR_FILE --header "Content-Type:application/json" $BURGR_URL/api/stage`
done;
{
  "ref": "refs/heads/myBranch",
  "compare": "http://github.com/SonarSource/project2/commit/2F1FB1/compare",
  "head_commit": {
    "id": "2F1B1",
    "message": "Commit message 2F1B1",
    "timestamp": "2016-01-05T11:40:15-04:00",
    "url": "https://github.com/SonarSource/project2/commit/2F1B1"
  },
  "repository": {
    "owner": {
      "name": "SonarSource"
    },
    "name" : "project2"
    ,"url" : "http://github.com/SonarSource/project2"
  },
  "sender" : {
    "login" : "harrypotter"
    ,"avatar_url" :"https://avatars.githubusercontent.com/u/666?v=3&s=48"
  }
}

*/
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