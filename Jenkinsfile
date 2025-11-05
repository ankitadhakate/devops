pipeline {
  agent any

  environment {
    GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-terraform-key')
    PROJECT_ID = "my-gke-project"
    REGION = "us-central1"
    PATH = "/var/lib/jenkins/bin:${PATH}"
  }

  stages {
    stage('Checkout & Terraform Deploy') {
      steps {
        dir('terraform') {
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
          sh '''
            terraform plan \
              -var="project_id=$PROJECT_ID" \
              -var="region=$REGION" \
              -out=tfplan.out
          '''

          echo "✅ Applying Terraform plan..."
          sh 'terraform apply -auto-approve tfplan.out'
        }
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
    always {
      echo "🏁 Pipeline finished."
    }
  }
}
