import json
import boto3
import datetime

def handler(event, context):
    try:
        client = boto3.client('ce', region_name='eu-central-1')
        response = client.get_usage_forecast(
            TimePeriod={
                'Start': str(datetime.date.today()),
                'End': '2020-11-30'
            },
            Metric='USAGE_QUANTITY',
            Granularity='MONTHLY',
            Filter={
                'Dimensions': {
                    'Key': 'USAGE_TYPE',
                    'Values': [
                        'hours',
                    ]
                }
            },
        )
    except client.exceptions.DataUnavailableException as e:
        # Send some context about this error to Lambda Logs
        print(e)
        raise e

    return {
        "statusCode": 200,
        "body": json.dumps({
            "response": response.text.replace("\n", "")
        }),
    }
