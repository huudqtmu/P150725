
pipeline {
 agent any
 
 stages {
	stage('clone'){
		steps {
			echo 'Cloning source code'
			git branch:'main', url: 'https://github.com/huudqtmu/P150725.git'
		}
	} // end clone
	stage('restore package') {
		steps
		{
			echo 'Restore package'
			bat 'dotnet restore'
		}
	}
stage ('build') {
		steps {
			echo 'build project netcore'
			bat 'dotnet build  --configuration Release'
		}
	}
	stage ('public den t thu muc')
	{
		steps{
			echo 'Publishing...'
			bat 'dotnet publish -c Release -o ./publish'
		}
	}

	stage('docker image') {
            steps {
                 bat '''
					  docker build -t p150725:latest -f "%WORKSPACE%" .
					'''
                }
            }
			 
		// dua vao docker image
	 
			stage('docker run') {
            steps {
		bat '''
		@echo off
		for /f "delims=" %%i in ('docker ps -a --filter "name=p150725run" --format "{{.Names}}"') do (
				set container=%%i
		 )
		if defined container (
				docker stop p150725run >nul 2>&1 // stop
				docker rm p150725run //remove
		)  
                '''
	// re-run
                  bat 'docker run -d --name p150725run -p 95:3000 p150725:latest'
                }
            }


  } // end stages
}//end pipeline
