FROM jenkins/jenkins:2.263.4-jdk11

#Installing Docker in Jenkins (Docker in Docker)
USER root
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -a -G docker jenkins
USER jenkins

# Get plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

# Skip setup wizard (Fill the enviromentall variable)
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Add groovy script to Jenkins hook (Add and select Maven Tool)
COPY addMaven.groovy/ /var/jenkins_home/init.groovy.d/

