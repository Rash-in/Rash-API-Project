# Rash-API
RESTful FastAPI api engine. Better instructions are WIP.

## Local Dev Install
1) Clone repo: `git clone https://github.com/Rash-in/Rash-API-Project.git`
2) CD into project folder: `cd Rash-API-Project`
- (Optional to your virtual env taste) Setup Virtual Environment: `python3 -m venv env`
- (Optional to your virtual env taste) Activate Virtual Environment: `source env/bin/activate`
3) Run initial script: `./bin/install_dev_local.sh`
4) From inside your virtual environment setup install the python packages: `pip install -r requirements.txt`

## Managing the Local Dev Install
- Starting server: `./bin/start_dev_local.sh`
- Stopping server: `./bin/stop_dev_local.sh`
- Restarting server: `./bin/restart_dev_local.sh`

Note: restart from Gunicorn does not work for coding changes. The entire process needs to be killed and restarted for the coding changes to work properly. Hence the restart script. The start, stop, and restart scripts check for a running pid first before doing anything so it is safe to run even if on accident.

- The Gunicorn server logs are stored in /var/log/rashapi/error.log && access.log

## Manual process handling
If for whaever reason you need to see running processes on the started server and do not wish to use the provided scripts:
- `cat /var/run/rashapi/rashapi.pid` Note down the PID.
- To kill: `kill <pidnumber>`

## Work in Progress
- An overall CLI that invokes the individual scripts. This will be installed eventually in /usr/local/bin so that it can be run without adding to PATH.
- Container based installation.
- All the content for the actual API