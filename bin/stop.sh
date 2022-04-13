#!/bin/sh

COMMAND_LOGS=$PWD/runtime/logs/command.log
curr_date=`date +"%F %T -5000"`
INSTALL_PATH=$PWD
LOG_PATH=$INSTALL_PATH/runtime/logs/

if [ -f $PWD/runtime/pids/rash_api.pid ]
then
    pid=$(cat ./runtime/pids/rash_api.pid)
    echo "[$curr_date] --------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      Started - [[Server Stop Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      Current Directory: $PWD" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      Script: stop.sh" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date] --------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      Killing rash_api process running on pid: $pid" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date] --------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    kill "$pid" && sleep 2s &&
    echo "$(tail -n 12 $LOG_PATH/error.log)" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date] --------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      Completed - [[Server Stop Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date] --------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS
else
    echo "[$curr_date] --------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      Started - [[Server Stop Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      Current Directory: $PWD" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      Script: stop.sh" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      NOTICE: RASH_API IS NOT RUNNING. NO ACTION TAKEN." | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      Completed - [[Server Stop Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date] --------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS
fi