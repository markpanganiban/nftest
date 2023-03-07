#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {  
  input: 
    val x
  output:
    stdout
  script:
    """
    df -h
    echo "This is from EFS Mount"
    mount -v
    touch /mnt/efs/mark-efs-test.txt
    ls -lrt /mnt/efs/
    """
}

workflow {
  Channel.of('Hola') | sayHello | view
}
