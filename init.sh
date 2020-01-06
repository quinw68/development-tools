#!/bin/bash

echo "Initializing dev environment..."
ls /tmp
[ ! -f /home/node/.bashrc ] && cp /tmp/.bashrc .