#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process scriptTask {
    output:
      stdout

    script:  
    """
    echo " Version		: \${workflow.revision}"
    echo " CommitId         : \${workflow.commitId}"
    
    """
}

workflow {
  scriptTask() | view
}
