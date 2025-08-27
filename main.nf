#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process publishReport {
  publishDir "${params.outdir}", mode: 'copy'
  publishDir "${params.outdir2}", mode: 'copy'
  input: 
    path (x)
  output:
    stdout
    path '*'

  script:
    """
    echo 'File is $x'
    echo 'Content inside: '
    df -h
    env
    cat $x > published_$x
    """
}

workflow {
   Channel.of(params.file2, params.file3, params.multi, params.file4)
    | publishReport
}
