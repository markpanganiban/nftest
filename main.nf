#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process fusion1 {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world from fusion1!'
    cp s3://fusionfs/result/timeline_aws_s3_cp.html ./
    """
}

process fusion2 {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world from fusion2!'
    cp s3://dovetailtroubleshooting/cstest/sample_60M.txt ./
    """
}

workflow {
  Channel.of('Bonjour') | fusion1 | view
  Channel.of('Hola') | fusion2 | view
}
