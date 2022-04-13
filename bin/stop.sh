#!/bin/sh

COMMAND_LOGS=$PWD/runtime/logs/command.log
curr_date=`date +"%D %T"`

if [ -f $PWD/runtime/pids/rash_api.pid ]
then
    pid=$(cat ./runtime/pids/rash_api.pid)
    echo "[$curr_date]: Started - [[Server Stop Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]:     Current Directory: $PWD" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]:     Script: stop.sh" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]:     Killing rash_api process running on pid: $pid" | tee -a $COMMAND_LOGS &&
    kill "$pid" &&
    echo "[$curr_date]: Completed - [[Server Start Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]: --------------------------------------------------------------------------" | tee -a $COMMAND_LOGS
else
    echo "[$curr_date]: Started - [[Server Stop Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]:     Current Directory: $PWD" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]:     Script: stop.sh" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]:         NOTICE: RASH_API IS NOT RUNNING. NO ACTION TAKEN." | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]: Completed - [[Server Start Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]: --------------------------------------------------------------------------" | tee -a $COMMAND_LOGS
fi