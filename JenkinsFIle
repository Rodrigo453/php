pipeline {
    agent any
tools {
      oc 'oc'
  }
    stages {
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