#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world from main.nf!'
    """
}

workflow {
  Channel.of('Bonjour') | sayHello | view
}
