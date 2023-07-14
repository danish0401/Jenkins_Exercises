Notes:
Creade Node from manage jenkins in Master
Connect that to slave Node ( same java version should be installed in both instances )
use scp to copy agent.jar file to slave instances

in Jenkinsfile add label of your Slave node


SSH-agent:
https://docs.cloudbees.com/docs/cloudbees-ci-kb/latest/client-and-managed-masters/host-key-verification-for-ssh-agents

>go to /var/lib/jenkins/.ssh
>ssh-keyscan -H <host ip> >> .ssh/known_hosts
change ownership of /var/lib/jenkins/.ssh
>chown -R jenkins:jenkins /var/lib/jenkins/.ssh 

> sudo su - gitlab-runner


>Key-less connection

ssh-keygen
id_rsa -> Server