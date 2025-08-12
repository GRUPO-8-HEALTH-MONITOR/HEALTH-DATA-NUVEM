from azure.iot.device import IoTHubDeviceClient, Message
from datetime import datetime

conn_str   = "HostName=iot-hub-health-data-G8.azure-devices.net;DeviceId=health-data-device-g8;SharedAccessKey=A36ai9/WyK/qiK0UkgpprlY2qpYHK3sjKiZ1Pc2YXvc="
device_client = IoTHubDeviceClient.create_from_connection_string(conn_str)

# Define message content
msg = {
    "deviceId": "device-001",
    "temperature": 24.5,
    "humidity": 45,
    "timestamp": "2025-06-01T14:00:00Z"
}

message = Message(str(msg))
device_client.connect()
device_client.send_message(message)
print("Message sent" + str(datetime.now()))
device_client.disconnect()