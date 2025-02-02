# Conky stuff

## Dependencies

- conky calls get-geo-from-ip.sh and displays what it echos.

## On Setting Conky to Start at Boot

-  add following line to $USER crontabs
´´´
@reboot $HOME/Auto/start_conky.sh
´´´
