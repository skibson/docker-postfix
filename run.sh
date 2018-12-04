#!/bin/sh
 echo "******************************"
echo "**** POSTFIX STARTING UP *****"
echo "******************************"
 # Make and reown postfix folders
mkdir -p /var/spool/postfix/ && mkdir -p /var/spool/postfix/pid
chown root: /var/spool/postfix/
chown root: /var/spool/postfix/pid
echo "- Staring rsyslog and postfix"
exec supervisord -c /etc/supervisord.conf
