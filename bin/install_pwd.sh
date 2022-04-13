#!/bin/sh

curr_date=`date +"%D %T"`

INSTALL_PATH=$PWD

CONFIG_PATH=$INSTALL_PATH/config
LOG_PATH=$INSTALL_PATH/runtime/logs/
PID_PATH=$INSTALL_PATH/runtime/pids/
APP_PATH=$INSTALL_PATH/src/
COMMAND_LOGS=$INSTALL_PATH/runtime/logs/command.log

echo "[$curr_date]: Started - [[Server Install Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]:     Current Directory: $PWD" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]:     Script: install.sh" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]:     API_INSTALL_PATH -> exported -> .env" | tee -a $COMMAND_LOGS &&
echo "API_INSTALL_PATH=$INSTALL_PATH/" > $INSTALL_PATH/.env | tee -a $COMMAND_LOGS &&
echo "[$curr_date]:     LOG_PATH         -> exported -> .env" | tee -a $COMMAND_LOGS &&
echo "LOG_PATH=$LOG_PATH" >> $INSTALL_PATH/.env | tee -a $COMMAND_LOGS &&
echo "[$curr_date]:     PID_PATH         -> exported -> .env" | tee -a $COMMAND_LOGS &&
echo "PID_PATH=$PID_PATH" >> $INSTALL_PATH/.env | tee -a $COMMAND_LOGS &&
echo "[$curr_date]:     APP_PATH         -> exported -> .env" | tee -a $COMMAND_LOGS &&
echo "APP_PATH=$APP_PATH" >> $INSTALL_PATH/.env | tee -a $COMMAND_LOGS &&
echo "[$curr_date]: Completed - [[Server Install Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]: --------------------------------------------------------------------------" | tee -a $COMMAND_LOGS