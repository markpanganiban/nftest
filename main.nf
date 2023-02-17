#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  container '128997144437.dkr.ecr.us-east-1.amazonaws.com/cs-testing:latest'
  
  input: 
    val x
  output:
    stdout
  script:
    """
    uname -a
    cat /etc/os-release
    echo '$x world!'
    """
}

workflow {
  Channel.of('Hola') | sayHello | view
}
