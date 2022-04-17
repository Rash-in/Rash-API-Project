#!/bin/sh

curr_date=`date +"%F %T -5000"`

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
INSTALL_PATH="$(dirname "${SCRIPTPATH}")"
CURR_USER=$USER

COMMAND_LOGS=/var/log/rashapi/command.log
LOG_PATH=/var/log/rashapi
PID_PATH=/var/run/rashapi/rashapi.pid

if [ -f $PID_PATH ]
then
    pid=$(cat $PID_PATH)
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [MSG]: Started - [[Server Stop Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [INFO]: Script: $0" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [INFO]: Installation Directory: $INSTALL_PATH" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [INFO]: Current user: $CURR_USER" | tee -a $COMMAND_LOGS &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [TASK]: Killing App: rash_api on pid: $pid and waiting 2s for logs." | tee -a $COMMAND_LOGS &&
    kill "$pid" && sleep 2s &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "$(tail -n 12 $LOG_PATH/error.log | grep INFO)" | tee -a $COMMAND_LOGS &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS
    echo "[$curr_date]      [MSG]: Completed - [[Server Stop Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS
else
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [MSG]: Started - [[Server Stop Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [INFO]: Script: $0" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [INFO]: Installation Directory: $INSTALL_PATH" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [INFO]: Current user: $CURR_USER" | tee -a $COMMAND_LOGS &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [INFO]: RASH_API IS NOT RUNNING. NO ACTION TAKEN." | tee -a $COMMAND_LOGS &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [MSG]: Completed - [[Server Stop Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS
fi