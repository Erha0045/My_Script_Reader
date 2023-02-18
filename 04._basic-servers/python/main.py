from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"message": "First FastAPI route"}

@app.get("/newroute")
def _():
    print(type({"this is the second route"}))
    return {"message": "this is the new route"}

