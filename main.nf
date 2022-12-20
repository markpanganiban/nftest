#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process sleep {
    output:
      stdout

    script:  
    """
    echo "I'm sleeping!"
    echo "Container	: $workflow.container"
    echo "Pipeline	: $workflow.manifest.version"
    echo "Version		: $workflow.revision"
    """
}

workflow {
  sleep | view 
}
