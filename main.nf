#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process testInstanceId {  
  input: 
    val x
  output:
    stdout
  script:
    """
    instanceId=$(wget -q -O - http://169.254.169.254/latest/meta-data/instance-id)
    hostNm=$(cat /etc/hostname)
    echo "This is the instance id of this task: $instanceId"
    echo "This is the hostname of this task: $hostNm"
    sleep 100000
    """
}

workflow {
  Channel.of('test') | testInstanceId | view
}
