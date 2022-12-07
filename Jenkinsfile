pipeline {
agent any
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
			withCredentials([[
				$class: 'AmazonWebServicesCredentialsBinding',
				credentialsId: 'packer_aws_iam',
				accessKeyVariable: 'AWS_ACCESS_KEY_ID',
				secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
			]])
			
		}
	
	}
	stage('Packer : Build AWS AMI') {
		steps{
			sh "packer build packer-aws.pkr.hcl"
		}
	}

	}
}
