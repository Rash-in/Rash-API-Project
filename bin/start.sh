#!/bin/sh

curr_date=`date +"%F %T -5000"`

INSTALL_PATH=$PWD

CONFIG_PATH=$INSTALL_PATH/config
LOG_PATH=$INSTALL_PATH/runtime/logs/
PID_PATH=$INSTALL_PATH/runtime/pids/
APP_PATH=$INSTALL_PATH/src/
COMMAND_LOGS=$INSTALL_PATH/runtime/logs/command.log

echo "[$curr_date] --------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]      Started - [[Server Start Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
echo "[$curr_date] --------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]      Current Directory: $PWD" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]      Script: start.sh" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]      Starting App: gunicorn" | tee -a $COMMAND_LOGS &&
echo "[$curr_date] --------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
gunicorn -c $CONFIG_PATH/dev-local.py -k uvicorn.workers.UvicornWorker --chdir $APP_PATH && sleep 2s | tee -a $COMMAND_LOGS &&
echo "[$curr_date]      App Start Command Executed in Background. Waiting 2s for logs." | tee -a $COMMAND_LOGS &&
echo "[$curr_date] --------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
echo "[$curr_date] $(ps -ef | grep -m 1 'gunicorn: master')" | tee -a $COMMAND_LOGS &&
echo "[$curr_date] --------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
echo "$(tail -n 13 $LOG_PATH/error.log)" | tee -a $COMMAND_LOGS &&
echo "[$curr_date] --------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]      Completed - [[Server Start Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
echo "[$curr_date] --------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS