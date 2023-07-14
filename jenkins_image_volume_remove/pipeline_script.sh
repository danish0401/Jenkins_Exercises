pipeline {
    agent any
    parameters {
        string(name: 'DAYS', defaultValue: '7', description: 'Number of days to keep Resources')
    }
    stages {
        stage('Delete unused volumes') {
            steps {
                sh '''#!/bin/bash
days=$DAYS
hours=$((days * 24))
# it will remove all unused resources that are some Days older, including images, containers and networks 
docker system prune -af --filter "until=${hours}h"
# it will remove all unused volumes
docker volume prune -f

'''
            }
        }
    }
}
