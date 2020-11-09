pipelineJob('pipelineJob') {
    definition {
        cps {
            script(readFileFromWorkspace('pipelineJob.groovy'))
            sandbox()
        }
    }
}
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