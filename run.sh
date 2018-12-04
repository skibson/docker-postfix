#!/bin/sh
echo "******************************"
echo "**** POSTFIX STARTING UP *****"
echo "******************************"
 # Make and reown postfix folders
mkdir -p /var/spool/postfix/ && mkdir -p /var/spool/postfix/pid
chown root: /var/spool/postfix/
chown root: /var/spool/postfix/pid
if [ ! -z "$HOSTNAME" ]; then
	postconf -e myhostname="$HOSTNAME"
else
	postconf -e myhostname= sender.from.net
fi
sed -i -r -e 's/^#submission/submission/' /etc/postfix/master.cf
echo "- Staring rsyslog and postfix"
exec supervisord -c /etc/supervisord.conf
