pipeline {
    agent any 

    environment {
        TOOL_DIR = "${WORKSPACE}\\RTOS\\Mutex\\CICDTool"
    }

    stages {
        stage('Build') { 
            steps {
                bat "${TOOL_DIR}\\build.bat ${WORKSPACE}\\Debug Debug all"
            }
        }
        
        
//     stage('Flash-Debug') { 
//             steps {
//                 bat "${TOOL_DIR}\\flash.bat $params.DUT_STLINK_sn ${WORKSPACE}\\Debug\\LED.elf"
//             }
//         }  
        
    
       
    }
     post{
        always{
            emailext to: "hariprithi99@gmail.com",
            subject: "Test Email From Jenkins",
            body: "I Hope all of you getting Email's From Jenkins <br>  BUILD STATUS: ${currentBuild.currentResult}: Job ${env.JOB_NAME}\nMore Info can be found here: ${env.BUILD_URL}",
            attachLog: true
        }
    }
     
   
       
}
    
