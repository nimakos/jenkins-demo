FROM jenkins/jenkins:2.249.3-jdk11

# Get plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

# Skip setup wizard (Fill the enviromentall variable)
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Add groovy script to Jenkins hook
COPY addMaven.groovy/ /var/jenkins_home/init.groovy.d/

