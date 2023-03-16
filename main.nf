#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process testEFS {  
  input: 
    val x
  output:
    stdout
  script:
    """
    echo "This is from EFS Mount nf-launcher container"
    df -h
    mount -v
    """
}

workflow {
  Channel.of('Hola') | testEFS | view
}
