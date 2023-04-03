#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process df {
  output:
    path "df.txt"

  script:
    """
    df -h > df.txt
    """
}

workflow {
  df | view
}
