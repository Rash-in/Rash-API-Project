from fastapi import FastAPI
from src.routes import apistore, datastore, reportstore, admin, sample

app = FastAPI(
    title="RashAPI",
    description="A simple RESTful OpenAPI spec API server used for learning.",
    version="0.0.1",
    contact={
        "name": "Rashin",
        "url":"https://github.com/Rash-in/Rash-API-Project",
        "email":"jerry@bytesoffury.com"
    },
    license_info={
        "name":"MIT",
        "url":"https://github.com/Rash-in/Rash-API-Project/blob/main/LICENSE"
    },
    openapi_tags= [
        {
            "name":"Hello_World",
            "description":"First set of endpoints for testing."
        },
        {
            "name":"Sample",
            "description":"Playing with params."
        }
    ]
)
#app.include_router(apistore.router)
#app.include_router(datastore.router)
#app.include_router(reportstore.router)
#app.include_router(admin.router)

@app.get("/", tags=["Hello_World"])
async def get_root():
    return { "message": "Connected to: / !" };

app.include_router(sample.router)
