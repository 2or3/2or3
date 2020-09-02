from google.oauth2 import service_account
from googleapiclient.errors import HttpError
import googleapiclient.discovery
import sys
import os
from os.path import join, dirname
from dotenv import load_dotenv

load_dotenv(verbose=True)
argvs = sys.argv

if (len(argvs) < 2):
    print('Please input token as parameter.')
    quit()

token = argvs[1]
SCOPES = ['https://www.googleapis.com/auth/androidpublisher']
SERVICE_ACCOUNT_FILE = './service_account.json'

credentials = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)

androidPub = googleapiclient.discovery.build('androidpublisher', 'v3', credentials=credentials)

try:
    res = androidPub.purchases().subscriptions().get(packageName=os.environ.get("PACKAGE_NAME"), subscriptionId=os.environ.get("SUBSCRIPTION_ID"), token=token).execute()
    print(res)
except HttpError as err:
    print(err)
    if err.resp.status == 400:
        print('Invalid token.')

