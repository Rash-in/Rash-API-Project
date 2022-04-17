"""Gunicorn *development* config file"""

import os
from dotenv import load_dotenv
load_dotenv()
logging_path = os.getenv("LOG_PATH")
pid_path = os.getenv("PID_PATH")

command = os.getenv("API_PROJECT_PATH") + "/env/bin/gunicorn"
pythonpath = os.getenv("APP_PATH")

proc_name = "rash_api"
# Django WSGI application path in pattern MODULE_NAME:VARIABLE_NAME
wsgi_app = "app:app"
# The granularity of Error log outputs
loglevel = "debug"
# The number of worker processes for handling requests
workers = 2
# The socket to bind
bind = "0.0.0.0:8001"
# Restart workers when code changes (development only!)
reload = True
# Write access and error info to /var/log
accesslog = logging_path + "/access.log"
errorlog = logging_path + "/error.log"
# Redirect stdout/stderr to log file
capture_output = True
# PID file so you can easily fetch process ID
pidfile = pid_path
# Daemonize the Gunicorn process (detach & enter background)
daemon = True