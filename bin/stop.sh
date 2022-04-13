#!/bin/sh

pid=$(cat ./runtime/pids/rash_api.pid)
echo "----------------------------------------------" &&
echo "Killing rash_api process running on pid: $pid" &&
kill "$pid" &&
echo "Service has been stopped" &&
echo "----------------------------------------------"