#!/bin/sh

curr_date=`date +"%F %T -5000"`

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
INSTALL_PATH="$(dirname "${SCRIPTPATH}")"
CURR_USER=$USER

CONFIG_PATH=$INSTALL_PATH/config
APP_PATH=$INSTALL_PATH/src
LOG_PATH=/var/log/rashapi
COMMAND_LOGS=$LOG_PATH/command.log
PID_PATH=/var/run/rashapi/rashapi.pid

if [ -f $PID_PATH ]
then
    pid=$(cat $PID_PATH)
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [MSG]: Started - [[Server Restart Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [INFO]: Script: $0" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [INFO]: Installation Directory: $INSTALL_PATH" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [INFO]: Current user: $CURR_USER" | tee -a $COMMAND_LOGS &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [TASK]: Killing App: rash_api on pid: $pid and waiting 1s for restart." | tee -a $COMMAND_LOGS &&
    kill "$pid" && sleep 1s &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [TASK]: Starting App: gunicorn" | tee -a $COMMAND_LOGS &&
    gunicorn -c $CONFIG_PATH/dev-local.py -k uvicorn.workers.UvicornWorker --chdir $APP_PATH && sleep 1s | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [TASK]: Process Output: $(ps -ef | grep -m 1 'gunicorn: master')" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [TASK]: PID File Output: $(cat $PID_PATH/rashapi.pid)" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [TASK]: App Start Command Executed in Background. Waiting 2s for logs." | tee -a $COMMAND_LOGS &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "$(tail -n 13 $LOG_PATH/error.log | grep INFO)" | tee -a $COMMAND_LOGS && 
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [MSG]: Completed - [[Server Restart Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS
else
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [MSG]: Started - [[Server Restart Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [INFO]: Script: $0" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [INFO]: Installation Directory: $INSTALL_PATH" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [INFO]: Current user: $CURR_USER" | tee -a $COMMAND_LOGS &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [INFO]: RASH_API IS NOT RUNNING. Starting App." | tee -a $COMMAND_LOGS &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [TASK]: Starting App: gunicorn" | tee -a $COMMAND_LOGS &&
    gunicorn -c $CONFIG_PATH/dev-local.py -k uvicorn.workers.UvicornWorker --chdir $APP_PATH && sleep 1s | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [TASK]: Process Output: $(ps -ef | grep -m 1 'gunicorn: master')" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [TASK]: PID File Output: $(cat $PID_PATH/rashapi.pid)" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [TASK]: App Start Command Executed in Background." | tee -a $COMMAND_LOGS &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "$(tail -n 13 $LOG_PATH/error.log | grep INFO)" | tee -a $COMMAND_LOGS &&    
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [MSG]: Completed - [[Server Restart Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS
fi