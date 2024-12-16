// Jenkinsfile (Declaritive Pipeline)
pipeline {
	agent any
	environment {
		DOCKERHUB_CREDS = credentials("docker")
	}
	stages {

		stages('Docker Image Build') {
			steps {
				echo 'Building Docker Image...'
				sh 'docker build --tag mboyce03/cw2-server:0.1 .'
				echo 'Docker Image built successfully'
			}
		}

		stage('Test Docker Image') {
			steps {
				echo 'Testing Docker Image...'
				sh '''
					docker image inspect mboyce03/cw2-server:0.1
					docker run --name test-container -p 8081:8080 -d mboyce02/cw2-server:0.1
					docker ps
					docker stop test-container
					docker rm test-container
				'''
			}
		}

		stage('DockerHub Login') {
			steps {
				sh 'echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin'
			}
		}

		stage('DockerHub Image Push') {
			steps {
				sh 'docker push mboyce03/cw2-server:0.1'
			}
		}
	//	stage('Deploy') {
	//		steps{
	//			sshagent(['jenkins-k8s-ssh-key']) {
	//				sh ' '
	//			}
	//		}
	//	}
	}
}	
