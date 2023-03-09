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
    ls -lrt /mnt/efs/
    mount -v
    touch /mnt/efs/mark-efs-test.txt
    """
}

workflow {
  Channel.of('Hola') | sayHello | view
}
