#!/usr/bin/env bash

#
#
#

# wait for everything (desktop) to load 
sleep 20
# a little log
echo $(date +%j.%H.%M) "starting conky"
# start conky
conky
