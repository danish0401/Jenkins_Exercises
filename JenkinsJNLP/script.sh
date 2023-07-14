#!/bin/bash

JENKINS_URL=http://35.167.155.37:8080/
NODE_NAME=testSlaveNode
NODE_SLAVE_HOME='/home/build/slave'
EXECUTORS=1
SSH_PORT=22
LABELS=jnlpSlaveNode

cat <<EOF | java -jar ~/jenkins-cli.jar -s ${JENKINS_URL} -auth Danish:11bcb6717e1bab85af4f4b723655b83e5b create-node ${NODE_NAME}
<slave>
  <name>${NODE_NAME}</name>
  <description></description>
  <remoteFS>${NODE_SLAVE_HOME}</remoteFS>
  <numExecutors>${EXECUTORS}</numExecutors>
  <mode>NORMAL</mode>
  <retentionStrategy class="hudson.slaves.RetentionStrategy$Always"/>
  <launcher class="hudson.slaves.JNLPLauncher">
    <workDirSettings>
      <disabled>false</disabled>
      <internalDir>remoting</internalDir>
      <failIfWorkDirIsMissing>false</failIfWorkDirIsMissing>
    </workDirSettings>
    <webSocket>true</webSocket>
  </launcher>
  <label>${LABELS}</label>
  <nodeProperties>
    <hudson.tools.ToolLocationNodeProperty>
      <locations>
        <hudson.tools.ToolLocationNodeProperty_-ToolLocation>
          <type>hudson.plugins.git.GitTool$DescriptorImpl</type>
          <name>Default</name>
          <home>/home/jenkins</home>
        </hudson.tools.ToolLocationNodeProperty_-ToolLocation>
      </locations>
    </hudson.tools.ToolLocationNodeProperty>
  </nodeProperties>
</slave>
EOF
