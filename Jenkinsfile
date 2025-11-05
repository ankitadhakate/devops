pipeline {
  agent any

  environment {
    GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-terraform-key')
  }

  stages {
    stage('Checkout') {
      steps {
        echo "Testing"
        sh 'ls -al'
        sh 'pwd'
      }
    }
  }
}
