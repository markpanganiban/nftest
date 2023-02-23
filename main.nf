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
    df -h
    lsblk
    ls -ld /mnt/efs
    touch /mnt/efs/mark.txt
    echo '$x world!'
    """
}

workflow {
  Channel.of('Hola') | sayHello | view
}
