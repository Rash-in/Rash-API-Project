#!/bin/sh

curr_date=`date +"%F %T -5000"`
CURR_USER=$USER
TMP_LOGS=/tmp/rashapi_local.log

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
INSTALL_PATH="$(dirname "${SCRIPTPATH}")"

CONFIG_PATH=$INSTALL_PATH/config
APP_PATH=$INSTALL_PATH/src/
APP_ENVIRONMENT=DEV_LOCAL
LOG_PATH=/var/log/rashapi
PID_PATH=/var/run/rashapi/rashapi.pid
COMMAND_LOGS=$LOG_PATH/command.log

logs_folder(){
    if [ -d "/var/log/rashapi" ];
    then
        yes_result= echo "[$curr_date]      [TASK]: Directory /var/log/rashapi exists- Skipping folder creation." | tee -a $TMP_LOGS &&
            echo "[$curr_date]      [TASK]: Transfering temp logs to /var/log/rashapi/command.log" | tee -a $TMP_LOGS &&
            cat /tmp/rashapi_local.log >> /var/log/rashapi/command.log | tee -a $COMMAND_LOGS &&
            rm /tmp/rashapi_local.log | tee -a $COMMAND_LOGS
        return $yes_result
    else
        CURR_USER=$USER
        no_result= echo "[$curr_date]      [TASK]: Directory /var/log/rashapi does not exist- Creating" | tee -a $TMP_LOGS &&
            sudo mkdir /var/log/rashapi | tee -a $TMP_LOGS &&
            echo "[$curr_date]      [TASK]: Changing owner of /var/log/rashapi to $CURR_USER" | tee -a $TMP_LOGS &&
            sudo chown -R $CURR_USER:$CURR_USER /var/log/rashapi | tee -a $TMP_LOGS &&
            echo "[$curr_date]      [TASK]: Creating log files command.log | access.log | error.log in /var/log/rashapi" | tee -a $TMP_LOGS &&
            touch /var/log/rashapi/command.log /var/log/rashapi/access.log /var/log/rashapi/error.log | tee -a $TMP_LOGS &&
            echo "[$curr_date]      [TASK]: Transfering temp logs to /var/log/rashapi/command.log" | tee -a $TMP_LOGS &&
            cat /tmp/rashapi_local.log >> /var/log/rashapi/command.log | tee -a $COMMAND_LOGS &&
            rm /tmp/rashapi_local.log | tee -a $COMMAND_LOGS
        return $no_result
    fi
}

pids_folder(){
    if [ -d "/var/run/rashapi" ];
    then
        yes_result= echo "[$curr_date]      [TASK]: Directory /var/run/rashapi exists- Skipping folder creation." | tee -a $COMMAND_LOGS
        return $yes_result
    else
        CURR_USER=$USER
        no_result= echo "[$curr_date]      [TASK]: Directory /var/run/rashapi does not exist- Creating" | tee -a $COMMAND_LOGS
        sudo mkdir /var/run/rashapi | tee -a $COMMAND_LOGS &&
        echo "[$curr_date]      [TASK]: Changing owner of /var/run/rashapi to $CURR_USER" | tee -a $COMMAND_LOGS &&
        sudo chown -R $CURR_USER:$CURR_USER /var/run/rashapi | tee -a $COMMAND_LOGS
        return $no_result
    fi
}

env_file(){
    if [ -f "$INSTALL_PATH/.env" ];
    then
        yes_result= echo "[$curr_date]      [TASK]: File .env exists- Skipping file creation" | tee -a $COMMAND_LOGS &&
        echo "[$curr_date]      [TASK]: Clearning .env contents" | tee -a $COMMAND_LOGS &&
        > $INSTALL_PATH/.env | tee -a $COMMAND_LOGS
        return $yes_result
    else
        no_result= echo "[$curr_date]      [TASK]: File .env does not exist- Creating" | tee -a $COMMAND_LOGS &&
        touch $INSTALL_PATH/.env | tee -a $COMMAND_LOGS
        return $no_result
    fi
}

env_contents(){
    result= echo "[$curr_date]      [TASK]: Adding API_ENVIRONMENT to .env" | tee -a $COMMAND_LOGS &&
    echo "API_ENVIRONMENT=DEV_LOCAL" >> $INSTALL_PATH/.env | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [TASK]: Adding API_PROJECT_PATH to .env" | tee -a $COMMAND_LOGS &&
    echo "API_PROJECT_PATH=$INSTALL_PATH" >> $INSTALL_PATH/.env | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [TASK]: Adding APP_PATH to .env" | tee -a $COMMAND_LOGS &&
    echo "APP_PATH=$APP_PATH" >> $INSTALL_PATH/.env | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [TASK]: Adding PID_PATH to .env" | tee -a $COMMAND_LOGS &&
    echo "PID_PATH=$PID_PATH" >> $INSTALL_PATH/.env | tee -a $COMMAND_LOGS &&
    echo "[$curr_date]      [TASK]: Adding LOG_PATH to .env" | tee -a $COMMAND_LOGS &&
    echo "LOG_PATH=$LOG_PATH" >> $INSTALL_PATH/.env | tee -a $COMMAND_LOGS &&
    return $result
}

echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $TMP_LOGS &&
echo "[$curr_date]      [MSG]: Started - [[Server Install Script on $(hostname -f)]]" | tee -a $TMP_LOGS &&
echo "[$curr_date]      [INFO]: Script: $0" | tee -a $TMP_LOGS &&
echo "[$curr_date]      [INFO]: Installation Directory: $INSTALL_PATH" | tee -a $TMP_LOGS &&
echo "[$curr_date]      [INFO]: Current user: $CURR_USER" | tee -a $TMP_LOGS &&
echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $TMP_LOGS &&
echo "[$curr_date]      [MSG]: Checking runtime folders" | tee -a $TMP_LOGS &&
logs_folder
pids_folder
echo "[$curr_date]      [MSG]: Completed checking runtime folders" | tee -a $COMMAND_LOGS &&
echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS &&
echo "[$curr_date]      [MSG]: Checking environment file and contents" | tee -a $COMMAND_LOGS &&
env_file
env_contents
echo "[$curr_date]      [MSG]: Completed checking environment file and contents" | tee -a $COMMAND_LOGS &&
echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS
echo "[$curr_date]      [MSG]: Completed - [[Server Install Script on $(hostname -f)]]" | tee -a $COMMAND_LOGS &&
echo "---------------------------------------------------------------------------------------------------------------------------------------" | tee -a $COMMAND_LOGS