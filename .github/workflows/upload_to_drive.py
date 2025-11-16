import os
from google.oauth2 import service_account
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload

SERVICE_ACCOUNT_FILE = "service-account.json"
FOLDER_ID = os.environ["GDRIVE_FOLDER_ID"]
APK_PATH = "build/app/outputs/flutter-apk/app-release.apk"

if not os.path.exists(APK_PATH):
    raise FileNotFoundError(f"APK not found at: {APK_PATH}")

creds = service_account.Credentials.from_service_account_file(
    SERVICE_ACCOUNT_FILE,
    scopes=["https://www.googleapis.com/auth/drive"]
)
service = build("drive", "v3", credentials=creds)

file_metadata = {"name": "app-release.apk", "parents": [FOLDER_ID]}
media = MediaFileUpload(APK_PATH, mimetype="application/vnd.android.package-archive")

uploaded = service.files().create(
    body=file_metadata,
    media_body=media,
    fields="id"
).execute()

file_id = uploaded.get("id")

service.permissions().create(
    fileId=file_id,
    body={"role": "reader", "type": "anyone"}
).execute()

download_url = f"https://drive.google.com/uc?id={file_id}&export=download"

with open("apk_url.txt", "w") as f:
    f.write(download_url)

print("Uploaded successfully:", download_url)
