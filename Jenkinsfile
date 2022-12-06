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
			sh """
			#!/bin/sh
			export AWS_ACCESS_KEY_ID=`echo $AWS_ACCESS_KEY_ID`
			export AWS_SECRET_ACCESS_KEY=`echo $AWS_SECRET_ACCESS_KEY`
			echo $AWS_ACCESS_KEY_ID
			echo $AWS_SECRET_ACCESS_KEY
			"""
		}
	}

	}
}
