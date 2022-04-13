#!/bin/sh

curr_date=`date +"%D %T"`

INSTALL_PATH=$PWD

CONFIG_PATH=$INSTALL_PATH/config
LOG_PATH=$INSTALL_PATH/runtime/logs/
PID_PATH=$INSTALL_PATH/runtime/pids/
APP_PATH=$INSTALL_PATH/src/
COMMAND_LOGS=$INSTALL_PATH/runtime/logs/command.log

echo "[$curr_date]: Started - [[Server Start Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]:     Current Directory: $PWD" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]:     Script: start.sh" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]:     Starting App: gunicorn" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]: --------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]: Command: gunicorn -c $CONFIG_PATH/dev-local.py -k uvicorn.workers.UvicornWorker --chdir $APP_PATH"  | tee -a $COMMAND_LOGS &&
gunicorn -c $CONFIG_PATH/dev-local.py -k uvicorn.workers.UvicornWorker --chdir $APP_PATH | tee -a $COMMAND_LOGS &&
echo "[$curr_date]: --------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]:     App Start Command Executed in Background."
echo "[$curr_date]: Completed - [[Server Start Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]: --------------------------------------------------------------------------" | tee -a $COMMAND_LOGS