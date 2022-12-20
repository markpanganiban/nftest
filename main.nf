#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process scriptTask {
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

process execTask {
    output:
      stdout
    exec:
    println "Project : $workflow.projectDir"
    println "Git info: $workflow.repository - $workflow.revision [$workflow.commitId]"
    println "Cmd line: $workflow.commandLine"
    println "Manifest's pipeline version: $workflow.manifest.version"
}

workflow {
  scriptTask | execTask | view 
}
