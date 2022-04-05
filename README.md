# Rash-API
RESTful FastAPI api engine. Better instructions are WIP.

## Local Dev Install
1) Clone repo
2) `export RASH_API_INSTALL_PATH=$PWD`
3) `python3 -m venv env`
4) `source env/bin/activate`
5) `pip install gunicorn uvicorn fastapi setproctitle`
6) `pip freeze > requirements.txt`
7) `gunicorn -c $RASH_API_INSTALL_PATH/src/config/dev-local.py -k uvicorn.workers.UvicornWorker --chdir $RASH_API_INSTALL_PATH/src/app_code`