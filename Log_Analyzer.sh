#!/bin/bash

logfile="/path/to/logile.log"

grep "Error" "$logfile" > error_log.txt
echo "Error log created"


