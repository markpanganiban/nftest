#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    cp s3://fusionfs/result/timeline_aws_s3_cp.html ./
    cp s3://dovetailtroubleshooting/cstest/sample_60M.txt ./
    """
}

workflow {
  Channel.of('Bonjour') | sayHello | view
}
