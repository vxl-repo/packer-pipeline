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

	}
}
