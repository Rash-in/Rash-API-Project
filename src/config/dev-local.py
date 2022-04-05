"""Gunicorn *development* config file"""

import os
path_to_logs = os.environ["RASH_API_INSTALL_PATH"] + "/src/logs/dev-local.log"
path_to_pids = os.environ["RASH_API_INSTALL_PATH"] + "/src/pids/dev-local.pid"
command = os.environ["RASH_API_INSTALL_PATH"] + "/env/bin/gunicorn"
pythonpath = os.environ["RASH_API_INSTALL_PATH"] + "/src/"

proc_name = "rash_api"
# Django WSGI application path in pattern MODULE_NAME:VARIABLE_NAME
wsgi_app = "app_code.main:app"
# The granularity of Error log outputs
loglevel = "debug"
# The number of worker processes for handling requests
workers = 2
# The socket to bind
bind = "0.0.0.0:8001"
# Restart workers when code changes (development only!)
reload = True
# Write access and error info to /var/log
accesslog = errorlog = path_to_logs

# Redirect stdout/stderr to log file
capture_output = True
# PID file so you can easily fetch process ID
pidfile = path_to_pids
# Daemonize the Gunicorn process (detach & enter background)
daemon = True
reload = True