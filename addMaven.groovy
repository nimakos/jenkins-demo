import jenkins.model.*

def mavenVersion = "3.6.3"
println "Adding an auto installer for Maven " + mavenVersion

def mavenPluginExtension = Jenkins.instance.getExtensionList(hudson.tasks.Maven.DescriptorImpl.class)[0]

def asList = (mavenPluginExtension.installations as List)
asList.add(new hudson.tasks.Maven.MavenInstallation('Maven', null, [new hudson.tools.InstallSourceProperty([new hudson.tasks.Maven.MavenInstaller(mavenVersion)])]))

mavenPluginExtension.installations = asList

mavenPluginExtension.save()