from fastapi import APIRouter

router = APIRouter(
    tags=["Sample"],
    prefix="/sample"
)

from starlette.requests import Request
from src.classes import api_handler

@router.get("/{sample_param}")
async def get_sample(sample_param: str, request:Request):
    return await api_handler.foo(request)