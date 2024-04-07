#!/bin/bash


IFS=$'\n\'

for user in $(cat /etc/passwd |grep "/bin/bash" |cut -d: -f1); do
	password_expires=$(change -l "$user" | grep "Password expires" | awk '{print $4}')
	echo "User: $user, Password Expires:
	$password_expres"
done
unset IFS
