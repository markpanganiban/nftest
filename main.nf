#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process scriptTask {
    output:
      stdout

    script:  
    """
    echo "SCRIPT Version		: $workflow.revision"
    echo "SCRIPT CommitId         : $workflow.commitId"
    """
}

workflow {
  scriptTask() | view
}
