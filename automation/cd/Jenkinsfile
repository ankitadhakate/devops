pipeline {
  agent any

  environment {
    GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-terraform-key')
    PROJECT_ID = "cicd-devops-ankita"
    REGION = "us-central1"
  }

  stages {
    stage('Terraform Deploy') {
      steps {
        echo "🔐 Authenticating to Google Cloud..."
        sh '''
          gcloud auth activate-service-account --key-file="$GOOGLE_APPLICATION_CREDENTIALS"
          gcloud config set project $PROJECT_ID
          gcloud config set compute/region $REGION
        '''

        echo "🚀 Initializing Terraform..."
        sh 'terraform init -input=false'

        echo "🔍 Validating Terraform configuration..."
        sh 'terraform validate'

        echo "🧮 Planning Terraform changes..."
        sh 'terraform plan -out=tfplan.out'

        echo "✅ Applying Terraform plan..."
        sh 'terraform apply -auto-approve tfplan.out'
      }
    }
  }

  post {
    success {
      echo "✅ Terraform deployment completed successfully."
    }
    failure {
      echo "❌ Terraform deployment failed. Check logs above."
    }
  }
}
