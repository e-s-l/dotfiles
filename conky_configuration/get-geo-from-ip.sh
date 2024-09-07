#!/usr/bin/env bash

###################################
# quick script to get geolocation
# from public ip address
# to display in conky or some such
###################################

main(){
  ip_address=${1}
  ip_info=$(curl https://ipinfo.io/${ip_address} 2>/dev/null)
  city=$(echo ${ip_info} | grep -o '"city": *"[^"]*' | grep -o '[^"]*$')
  country=$(echo ${ip_info} | grep -o '"country": *"[^"]*' | grep -o '[^"]*$')
  echo "${ip_address} (${city}, ${country})"
  # ought to return something else if curl fails...
}

ip_address=$(dig +short myip.opendns.com @resolver1.opendns.com)
main ${ip_address}
