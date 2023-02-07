#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  label 'big_mem'
  
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    """
}

workflow {
  Channel.of('Hola') | sayHello | view
}
