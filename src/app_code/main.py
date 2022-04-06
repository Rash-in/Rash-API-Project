from cgitb import handler
from typing import Optional
from fastapi import FastAPI
from starlette.requests import Request

from app_code.classes import api_handler
from app_code.classes import sanitize_base
from app_code.classes import sanitize_route
from app_code.classes import validate_input
from app_code.classes import api_process_request
from app_code.datasources import mysql_calls
from app_code.routes import apistore
from app_code.routes import datastore
from app_code.routes import reportstore
from app_code.routes import toolstore

app = FastAPI()

@app.get("/")
async def get_root():
    return {
        "Hello": "World",
        "classes":{
            "sanitize_base":sanitize_base.foo(),
            "sanitize_route":sanitize_route.foo(),
            "validate_input":validate_input.foo(),
            "api_process_request": api_process_request.foo(),
        },
        "datasources":{
            "mysql":mysql_calls.foo()
        },
        "routes":{
            "apistore": apistore.foo(),
            "datastore": datastore.foo(),
            "reportstore": reportstore.foo(),
            "toolstore": toolstore.foo(),
        }
    };
"""
nginx config:
server {
        server_name     rashchoice.mydesktop;
        listen          8080;
        location / {
                proxy_pass              http://localhost:8001;
                proxy_set_header        Host $host;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Real-IP      $remote_addr;
        }
}

sample request:
http://rashchoice.mydesktop:8080/sample?mykey=myvalue

Headers:
content-type: application/json
authorization: Bearer iamatokenherpderp

body:
{
    "lookie":"iamabodyvalue"
}


"""
@app.get("/{sample_param}")
async def get_sample(sample_param: str, request:Request):
    return await api_handler.foo(request)