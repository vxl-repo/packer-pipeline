pipeline {

	agent any
	
	stages {
		stage('Packer : Validate Build'){
			steps{		
				sh "packer validate packer-aws.pkr.hcl" 
			}	

			}
	}
}
