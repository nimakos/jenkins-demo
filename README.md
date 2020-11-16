# jenkins-demo

--Supports Gradle and Maven build Tool

Init run : 

           ./gradlew docker ->create docker image 
           ./gradlew dockerRun ->create docker container
           
After making some changes : 
                            
                            ./gradlew dockerStop
                            ./gradlew build docker dockerRun
 
 Make Container run automatically after Reboot
 
 1. Check running container ID
 docker container ls
 
 2. If container is already running : 
 docker update --restart unless-stopped container_id 
 
 3. If container has not been started yet
 docker run -dit --restart unless-stopped httpd                           

