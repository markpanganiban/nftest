#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {  
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
