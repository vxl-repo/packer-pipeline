pipeline {
agent any
environment {
	AWS_ACCESS_KEY_ID = credentials()
	AWS_SECRET_ACCESS_KEY = credentials()
}
stages {
	stage('Packer : Initialize Build') {
		steps{		
			sh "packer init ." 
		}	
	}
	stage('Packer : Validate Build Configuration') {
		steps {
			sh "packer validate packer-aws.pkr.hcl"
		}
	}
	stage('Packer : Export AWS IAM Credentials') {
		steps {
			sh """
				export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
				export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
			"""
		}
	}
	stage('Packer : Build AWS AMI') {
		steps{
			sh "packer build packer-aws.pkr.hcl"
		}
	}

	}
}
