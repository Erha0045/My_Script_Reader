from fastapi import FastAPI
from datetime import datetime
import requests

app = FastAPI()

@app.get("/date")
def get_date():
    return datetime.now()

#For at kunne sende dato og tekst samtidig
@app.get("/dateAndMessage")
def get_date():
    now = datetime.now()
    response_data = {
        'date': now,
        'message': 'Hello from the python server'
    }
    return response_data
   
#This is the endpoint that t
@app.get("/datefromexpress")
def get_date_from_express():
    response = requests.get("http://127.0.0.1:8081/date")
    date = response.json()
    return date

@app.get("/datengrok")
def _():
    response = requests.get("https://9b45-87-72-36-165.eu.ngrok.io/date")
    date = response.json()
    return date
