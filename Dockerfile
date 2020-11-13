FROM jenkins/jenkins:2.249.3-jdk11

# Get plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

# Skip setup wizard (Fill the enviromentall variable)
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Add groovy script to Jenkins hook
#COPY --chown=jenkins:jenkins init.groovy.d/ /var/jenkins_home/init.groovy.d/
COPY init.groovy.d/ /var/jenkins_home/init.groovy.d/

