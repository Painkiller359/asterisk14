#!/bin/bash

if ! find /etc/asterisk -mindepth 1 -print -quit | grep -q .; then
    echo "Default config not found, creating now..."
    cp -R /etc/defaults/asterisk/* /etc/asterisk/
    echo "Assigning permissions..."
    chown -R asterisk:asterisk /etc/asterisk
fi

/usr/sbin/asterisk -f -U asterisk -G asterisk -v -d
