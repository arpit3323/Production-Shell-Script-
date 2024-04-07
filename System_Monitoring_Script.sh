!#/bin/bash

# Email details
recipient="recipient@example.com"
subject="Alert Notification"
body="This is an alert notification email. Please take necessary action."




threshold=90

cpu_usage=$(top -bn1| grep "Cpu(s)"| awk '{print $2}' | cut -d -f1)
if [ "$cpu_usage" -gt "$threshold" ]; then 
	echo "High Cpu usage detected: $cpu_usage%"

#Sending email	
        echo "$body" | mail -s "$subject" "$recipient"

fi
