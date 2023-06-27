pipeline {
    agent any
    stages {
        stage ('Start'){
            steps {
                echo 'testeeeeeeeee'
            }
        }
        
         stage('Git pull'){
                    steps{
                        git url: 'https://github.com/Rodrigo453/php.git', branch: 'main'
                    }
        }

        stage('build and push dockerhub') {
            steps{
                script{
                    openshift.withCluster() {
                    openshift.selector("bc", "docker-build").startBuild()
                    }
                }
            }   
        }

         stage('teste tempo'){
            steps{
            sleep(time:5,unit:"MINUTES")
            }
        }
        
            stage('Start Rollout'){
                    steps{
                script{
                    openshift.withCluster() {
                    openshift.selector("dc", "teste").rollout().latest()
                    
                    }
                }
            }   
        }
        
        
        
        
                
      
    }//fim stages
}    
