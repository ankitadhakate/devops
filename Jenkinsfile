pipeline {
  agent any

  environment {
    GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-terraform-key')
    PROJECT_ID = "my-gke-project"     // 🔹 replace with your actual GCP project id
    REGION = "us-central1"            // 🔹 replace with your desired region
  }

  stages {
    stage('Debug PATH') {
      steps {
        sh 'echo $PATH'
      }
    }
    stage('Checkout & Terraform Deploy') {
      steps {
        echo "Listing workspace files..."
        sh 'ls -al'
        sh 'pwd'

        echo "Initializing Terraform..."
        sh '''
          terraform init -input=false
        '''

        echo "Validating Terraform configuration..."
        sh 'terraform validate'

        echo "Planning Terraform changes..."
        

        echo "Applying Terraform plan..."
        sh '''
          terraform apply -auto-approve tfplan.out
        '''
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
      echo "Pipeline finished."
    }
  }
}
