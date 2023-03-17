#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process testInstanceId {  
  input: 
    val x
  output:
    stdout
  script:
    """
    echo "This is the instance id of this task"
    yum install curl
    curl http://169.254.169.254/latest/meta-data/instance-id
    sleep 1h
    """
}

workflow {
  Channel.of('Hola') | testInstanceId | view
}
