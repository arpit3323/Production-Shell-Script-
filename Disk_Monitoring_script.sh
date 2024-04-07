#!/bin/bash

threshold=90

disk_usage=$(df -h |grep "dev/sda1" |awk '{print $5}' |cut -d % -f1)

if [ "$disk_usage" -gt "threshold" ]; then 
	echo "High Disk usage detected:$disk_usage%"


# Email details
recipient="recipient@example.com"
subject="Alert Notification"
body="This is an alert notification email. Please take necessary action."


#Sending email
        echo "$body" | mail -s "$subject" "$recipient"

