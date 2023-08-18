#!/usr/bin/env nextflow

secret_name = "arn:aws:secretsmanager:us-east-1:1234567890:secret:secret-full-arn-here"
region_name = "region-here"

process getSecret {
    container 'python:3.9.17'
    output:
      path secret_file

    script:
    """
    pip3 install boto3
    aws-secrets.py "${secret_name}" "${region_name}" > secret_file
    """
}

process showSecret {
    input:
      path secret_file
    output:
      stdout

    script:
    """
    cat ${secret_file}
    """
}

workflow {
   getSecret | showSecret | view
}
