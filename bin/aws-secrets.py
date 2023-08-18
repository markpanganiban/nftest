#!/usr/bin/env python

import sys
import boto3
import json

def get_secret(secret_name, region_name):
    session = boto3.session.Session()
    client = session.client(
        service_name='secretsmanager',
        region_name=region_name
    )

    try:
        response = client.get_secret_value(SecretId=secret_name)
        if 'SecretString' in response:
            secret = response['SecretString']
            return secret
        else:
            print("SecretString not found in response.")
            return None
    except Exception as e:
        print(f"Error: {e}")
        return None

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script_name.py secret_name region_name")
        sys.exit(1)

    secret_name = sys.argv[1]
    region_name = sys.argv[2]

    secret = get_secret(secret_name, region_name)
    if secret:
        print(secret)
    else:
        print("Failed to retrieve secret details.")
