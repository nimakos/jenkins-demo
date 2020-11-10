# jenkins-demo

init run : 
           ./gradlew docker
           ./gradlew dockerRun
           
after making some changes :                             
                            ./gradlew dockerStop
                            ./gradlew build docker dockerRun
