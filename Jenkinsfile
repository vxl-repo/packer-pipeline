pipeline {
agent any

stages {
	stage('Packer : Initialize Build') {
		steps{		
			sh "packer init ." 
		}	
	}
	stage('Packer : Validate Build Configuration') {
		environment {
			AWS_ACCESS_KEY_ID = credentials('packer_aws_iam')
			AWS_SECRET_ACCESS_KEY = credentials('packer_aws_iam')
		}
		steps {
			sh "packer validate packer-aws.pkr.hcl"
		}
	}
	stage('Packer : Build AWS AMI') {
		steps{
			sh "packer build packer-aws.pkr.hcl"
		}
	}

	}
}
