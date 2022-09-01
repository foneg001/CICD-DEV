pipeline {
    agent any 
    // Environment Variables
    environment {
	    	MAJOR = '1'
       		MINOR = '0'
	        //Orchestrator Services
	        UIPATH_ORCH_URL = "https://prpa002zatcwi.vodacom.corp/"
	        UIPATH_ORCH_LOGICAL_NAME = "foneg001"
	        UIPATH_ORCH_TENANT_NAME = "Mozambique"
	        UIPATH_ORCH_FOLDER_NAME = "Default"
		}
	
    parameters {
	        choice(name: 'VERSION', choices: ['1.1.1','1.2.1','1.2.3'], description: 'process to be deployed')
					
	       }
    
    stages {
        stage('Preparing Info') {
            steps {
                echo "Jenkins Home ${env.JENKINS_HOME}"
	        echo "Jenkins URL ${env.JENKINS_URL}"
	        echo "GitHub BranhName ${env.BRANCH_NAME}"
            }
        }
        stage('Build Package') {
            steps {
                echo "Building...with ${WORKSPACE}"
                UiPathPack (
                outputPath: "Output\\${env.BUILD_NUMBER}",
                projectJsonPath: "project.json",
                version: [$class: 'ManualVersionEntry', version: "${MAJOR}.${MINOR}.${env.BUILD_NUMBER}"],
                useOrchestrator: false,
                traceLevel: 'None'
    		) 
            }
        }
        stage('Deploy') {
            steps {
                echo 'Hello world!3' 
		    echo "guy esta a deployar ${params.VERSION}"
            }
        }
	    
	stage('Deploy to PreProd') {
            steps {
                echo "Deploying ${BRANCH_NAME} to PreProd "
                UiPathDeploy (
                packagePath: "Output\\${env.BUILD_NUMBER}",
                orchestratorAddress: "${UIPATH_ORCH_URL}",
                orchestratorTenant: "${UIPATH_ORCH_TENANT_NAME}",
                folderName: "${UIPATH_ORCH_FOLDER_NAME}",
                environments: 'Default',
                credentials: [$class: 'UserPassAuthenticationEntry', credentialsId: 'APIUserKey'],
                //credentials: Token(accountName: "${UIPATH_ORCH_LOGICAL_NAME}", credentialsId: 'APIUserKey'),
                traceLevel: 'None',
		entryPointPaths: 'Main.xaml'
       		)
            }
        }    
    }
	
	post {
        success {
            echo 'Deployment to Dev. Env. has been completed!'
        }
        failure {
          echo "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.JOB_DISPLAY_URL})"
        }
        always {
            /* Clean workspace if success */
            cleanWs()
        }
    }
}
