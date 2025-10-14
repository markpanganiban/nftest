#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process publishReport {
  publishDir "${params.outdir}", mode: 'copy'
  input: 
    path (x)
  output:
    stdout
    path '*'

  script:
    """
    echo 'File is $x'
    cat $x > published_$x
    sleep 10s
    exit 1
    """
}

workflow {
   Channel.of(params.file1)
    | publishReport
}
