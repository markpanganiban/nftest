#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process secretTesting {
  secret 'FOO'
  output: 
     stdout 
  script:
  '''
    echo "Secrets phrase: $FOO"
  '''
}

workflow {
  secretTesting | view
}
