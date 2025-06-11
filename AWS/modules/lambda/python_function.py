import json
import boto3
import uuid
import os
import base64
from datetime import datetime

s3 = boto3.client('s3')
BUCKET_NAME = os.environ.get("RAW_BUCKET_NAME")  # Pass this via Terraform

def handler(event, context):
    try:
        # Handle both raw payload and base64 encoding from API Gateway
        if 'body' in event:
            # If body is a JSON string (as it usually is from Logic Apps)
            event_body = json.loads(event['body'])
        else:
            event_body = event

        blob_name = event_body.get("blobName")
        blob_url = event_body.get("blobUrl")
        blob_content_encoded = event_body.get("blobContent")

        if not blob_content_encoded:
            return {
                "statusCode": 400,
                "body": json.dumps({"error": "blobContent missing"})
            }

        # Decode the base64 content
        decoded_blob = base64.b64decode(blob_content_encoded.get("$content"))

        # (Optional) if your blob is JSON and you want to parse it
        decoded_json = json.loads(decoded_blob)

        # Save the original decoded JSON to S3
        file_name = f"{datetime.utcnow().isoformat()}_{uuid.uuid4()}.json"
        s3.put_object(
            Bucket=BUCKET_NAME,
            Key=file_name,
            Body=json.dumps(decoded_json)
        )

        return {
            "statusCode": 200,
            "body": json.dumps({
                "message": "Data stored in S3",
                "file": file_name,
                "blobName": blob_name,
                "blobUrl": blob_url
            })
        }

    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)})
        }
