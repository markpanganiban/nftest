#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo 'Username is: $workflow.userName'
    echo '$x world!'
    """
}

workflow {
  Channel.of('Bonjour') | sayHello | view
}
