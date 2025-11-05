pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/<your-username>/<repo>.git',
                    credentialsId: 'github-token'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'pytest --maxfail=1 --disable-warnings -q'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t gcr.io/<your-project>/<app-name>:$BUILD_NUMBER .'
            }
        }

        stage('Deploy to GKE') {
            steps {
                sh '''
                gcloud container clusters get-credentials <cluster-name> --zone <zone> --project <project>
                kubectl apply -f k8s/deployment.yaml
                '''
            }
        }
    }

    post {
        always {
            junit 'tests/reports/*.xml'
            echo 'Cleaning up...'
        }
    }
}
