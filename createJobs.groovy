/*Init job from jenkins*/
pipelineJob('pipelineJob') {
    definition {
        cps {
            script(readFileFromWorkspace('pipelineJob.groovy'))
            sandbox()
        }
    }
}

/*Credentials for the repository we want to work, the job we want to do */
pipelineJob('spring-boot-job') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url 'https://github.com/nimakos/SpringBootMVC.git'
                    }
                    branch 'master'
                }
            }
        }
    }
}

pipelineJob('spring-boot-job_onthefly') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url 'https://github.com/nimakos/SpringBootMVC.git'
                    }
                    branch 'jenkins_onthefly_sql'
                }
            }
        }
    }
}