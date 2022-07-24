#!/bin/bash

user=`stat -c '%u' /project/`
group=`stat -c '%g' /project/`

if [ "${user}" != "0" ]; then
  echo "[www]" > /etc/php/8.1/fpm/user.conf
  echo "user = ${user}" >> /etc/php/8.1/fpm/user.conf
  echo "group = ${group}" >> /etc/php/8.1/fpm/user.conf
fi

/usr/sbin/php-fpm8.1 -F
