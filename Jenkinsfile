pipeline {
    agent any
tools {
      oc 'oc'
  }

    stages {
                stage('Git clone'){
                    steps{
                        git url: 'https://github.com/Rodrigo453/php.git', branch: 'main'
                    }
                }

                stage('Docker Build'){
                    steps{
                        script{
                            dockerapp = docker.build("rodrigo453/teste:${env.BUILD_ID}",
                                '-f ./Dockerfile .')
                        }
                    }
                }

                stage('Docker push image'){
                    steps{
                        script{
                            docker.withRegistry('https://registry.hub.docker.com/' , 'dockerhub'){
                            dockerapp.push('latest')
                            dockerapp.push("${env.BUILD_ID}")
                            }
                        }
                    }
                }

                 stage ('Deploy App') { 
                    steps {
                    script {
                        openshift.withCluster( CLUSTER_NAME ) {
                                openshift.withProject( PROJECT_NAME ) {
                                               def created = openshift.newApp( 'https://github.com/Rodrigo453/php.git' ) 
                                                }
                        }       
                    }
                    }
                }
    }
}