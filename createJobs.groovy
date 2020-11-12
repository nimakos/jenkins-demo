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
                        github('nimakos/SpringBootMVC.git', 'ssh')
                        credentials('my-credentials')  //not working
                    }
                    branch 'master'
                }
            }
        }
    }
}