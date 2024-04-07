#!/bin/bash


website="httpsL//example.com"

if curl --output /dev/null --silent --head --fail "$website"; then 
	echo "website is up"

else
	echo "website is down"

fi
