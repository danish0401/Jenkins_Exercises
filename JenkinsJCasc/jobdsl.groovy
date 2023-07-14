job('demo'){
    steps {
        shell( 'echo Hello World!' )
    }
}

pipelineJob('test pipeline'){
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        github('https://github.com/danisheurus/PythonApp')
                    }
                }
            }
            scriptPath('test/Jenkinsfile')
        }
    }
}