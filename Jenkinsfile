pipeline{
    agent any


    tools {
        maven 'M2_HOME'
    }


	stages {


 stage('Getting project from Git') {
            steps{
      			checkout([$class: 'GitSCM', branches: [[name: '*/aziz']],
			extensions: [],
			userRemoteConfigs: [[url: 'https://github.com/med-aziz-ben-haha/cicdfront.git']]])
            }
        }


        stage('Cleaning the project') {
            steps{
                sh "npm install"
            }
        }





        stage('Artifact Construction') {
            steps{
                sh "ng build  "
            }
        }



stage('Build Docker Image') {
                      steps {
                          script {
                            sh 'docker build -t azizbenhaha/angular-app:latest .'
                          }
                      }
                  }




                  stage('login dockerhub') {
                                        steps {
                                      sh 'echo dckr_pat_-SnwrdC_ELsL6it2JT6cgIcAlrs | docker login -u azizbenhaha --password-stdin'
                                            }
		  }





	                      stage('Push Docker Image') {
                                        steps {
                                   sh 'docker push azizbenhaha/angular-app:latest'
                                            }
		  }



        stage('Run Angular Container') {
                      steps {
                          script {
                            sh 'docker compose up -d'
                          }
                      }
                  }

}


}
