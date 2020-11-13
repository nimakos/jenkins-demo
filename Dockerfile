FROM jenkins/jenkins:2.249.3-jdk11

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Add groovy script to Jenkins hook
COPY --chown=jenkins:jenkins add_maven_auto_installer.groovy/ /var/jenkins_home/init.groovy.d/