import sys
print(sys.path)
from fastapi import FastAPI, Form, File, UploadFile
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles

app = FastAPI()

# Mount a directory containing static files
app.mount("/static", StaticFiles(directory="static"), name="static")

@app.get("/", response_class=HTMLResponse)
def home():
    # Return the contents of the index.html file
    with open("static/index.html") as f:
        html_content = f.read()
    return html_content

@app.post("/form")
def form_handler(username: str = Form(...), password: str = Form(default=..., min_length=8)):
    print(username, password)
    return {"username": username}

# @app.post("/fileform")
# def file_as_bytes_form_handler(file: bytes = File(...)):
#     print(file)
#     with open ("file", "wb") as f:
#         f.write(file)
#         f.close()

#     return { "message": "file uploaded" }

@app.post("/fileform")
async def file_as_file_form_handler(file: UploadFile = File(...), description: str = Form(...)):
    contents = await file.read()
    print(contents)

    return { "filename": file.filename }