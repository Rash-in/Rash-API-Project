from cgitb import handler
from typing import Optional
from fastapi import FastAPI

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
async def read_root():
    return {
        "Hello": "World",
        "classes":{
            "api_handler": api_handler.foo(),
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
    }