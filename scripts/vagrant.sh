#!/bin/sh -eux

mkdir -p $HOME_DIR/.ssh;

AUTH_KEYS=$HOME_DIR/.ssh/authorized_keys;

echo -n "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp" >> $AUTH_KEYS  
echo -n "22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHz" >> $AUTH_KEYS
echo -n "D8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6Iedp" >> $AUTH_KEYS
echo -n "lqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8Hfd" >> $AUTH_KEYS
echo -n "OV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHi" >> $AUTH_KEYS
echo -n "lFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbU" >> $AUTH_KEYS
echo -n "vxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hruc" >> $AUTH_KEYS
echo -n "XzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vag" >> $AUTH_KEYS  
echo -n "rant insecure public key" >> $AUTH_KEYS
echo >> $AUTH_KEYS

chown -R vagrant $HOME_DIR/.ssh;
chmod -R go-rwsx $HOME_DIR/.ssh;
