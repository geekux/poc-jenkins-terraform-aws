pipeline {
	agent {
		docker {
			image 'pszatkowski/terraform:latest'
		}
	}
	
	environment {
       AWS = credentials('aws-terraform')
	   AWS_ACCESS_KEY_ID = "$AWS_USR"
	   AWS_SECRET_ACCESS_KEY = "$AWS_PSW"
	}

	stages {
		stage('Terraform Validate') {
			steps {
					sh 'terraform init'
					sh 'terraform validate'
			}
		}
		
		stage('Terraform Plan') {
			steps {
					sh 'terraform plan -out myplan'
			}
		}
 
		stage('Approval') {
			steps {
				script {
					def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
				}
			}
		}
		
		stage('Terraform Deployment AWS') {
			steps {
					sh 'terraform apply -auto-approve myplan'
			}
		}
	}
}

