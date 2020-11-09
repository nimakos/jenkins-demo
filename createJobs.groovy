pipelineJob('theme-park-job') {
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