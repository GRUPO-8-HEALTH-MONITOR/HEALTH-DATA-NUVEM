import json
import boto3
import uuid
import os
from datetime import datetime

s3 = boto3.client('s3')
BUCKET_NAME = os.environ.get("RAW_BUCKET_NAME")  # Pass this via Terraform


def handler(event, context):
    try:
        # Parse input JSON from API Gateway
        body = json.dumps(event)
        if not body:
            return {
                "statusCode": 400,
                "body": json.dumps({"error": "No data provided"})
            }

        # Create a unique filename
        file_name = f"{datetime.utcnow().isoformat()}_{uuid.uuid4()}.json"

        # Upload to S3
        s3.put_object(
            Bucket=BUCKET_NAME,
            Key=file_name,
            Body=body
        )

        return {
            "statusCode": 200,
            "body": json.dumps({"message": "Data stored in S3", "file": file_name})
        }

    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)})
        }
