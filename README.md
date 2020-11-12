# jenkins-demo

init run : 

           ./gradlew docker ->create docker image 
           ./gradlew dockerRun ->create docker container
           
after making some changes : 
                            
                            ./gradlew dockerStop
                            ./gradlew build docker dockerRun
