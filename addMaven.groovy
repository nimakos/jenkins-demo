import jenkins.model.*

println "Adding an auto installer for Maven 3.6.3"

def mavenPluginExtension = Jenkins.instance.getExtensionList(hudson.tasks.Maven.DescriptorImpl.class)[0]

def asList = (mavenPluginExtension.installations as List)
asList.add(new hudson.tasks.Maven.MavenInstallation('Maven', null, [new hudson.tools.InstallSourceProperty([new hudson.tasks.Maven.MavenInstaller("3.6.3")])]))

mavenPluginExtension.installations = asList

mavenPluginExtension.save()