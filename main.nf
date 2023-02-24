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
    echo "This is from S3"
    /home/ec2-user/miniconda/bin/aws s3 ls s3://nf-nvirginia/mark
    echo "This is from EFS Mount"
    mount -v
    touch /mnt/efs/mark3.txt
    ls -lrt /mnt/efs/
    """
}

workflow {
  Channel.of('Hola') | sayHello | view
}
