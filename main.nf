#!/usr/bin/env nextflow

process CountReads {

  input:
  tuple val(sample_id), path(reads)

  output:
  path("*.txt")

  script:
  """
  zcat ${reads[0]} | wc -l > readcount1.txt
  zcat ${reads[1]} | wc -l > readcount2.txt
  """
}

workflow {
read_pairs_ch = Channel.fromFilePairs(params.read1.replace("_R1", "{_R1,_R2}"))
counts_ch = CountReads(read_pairs_ch)
counts_ch.view()
}
