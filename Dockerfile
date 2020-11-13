FROM jenkins/jenkins:2.249.3-jdk11

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml
#COPY hudson.tasks.Maven.xml /var/lib/jenkins/tools/one.xml

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false