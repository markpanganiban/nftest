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
    wget -q -O - http://169.254.169.254/latest/meta-data/instance-id
    echo "This is the IP of this task"
    wget -q -O - http://169.254.169.254/latest/meta-data/public-ipv4
    sleep 100000
    """
}

workflow {
  Channel.of('Hola') | testInstanceId | view
}
