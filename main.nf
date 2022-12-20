#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process scriptTask {
    output:
      stdout

    script:  
    """
    echo " Version		: \${workflow.revision}"
    echo " CommitId         : \${workflow.commitId}"
    echo " Ver or Commit : \${workflow.revision:=$workflow.commitId}"
    """
}

workflow {
  scriptTask() | view
}
