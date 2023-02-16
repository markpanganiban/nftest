#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  container 'mppan821/ubuntu-mark:latest'
  
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
