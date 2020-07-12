#!/system/bin/sh

MODDIR=${0%/*}

PATH=/system/bin:/sbin:/sbin/.core/busybox:/system/xbin

until [[ $(getprop sys.boot_completed) = 1 ]] && [[ $(getprop dev.bootcomplete) = 1 ]] && [[ $(getprop service.bootanim.exit) = 1 ]] && [[ $(getprop init.svc.bootanim) = stopped ]]; do

    sleep 1

done

sleep 8

settings put global airplane_mode_on 0

sleep 0.5

am broadcast -a android.intent.action.AIRPLANE_MODE

sleep 0.5

svc data enable

sleep 0.5

svc wifi enable

sleep 0.5

settings put secure location_providers_allowed +gps;

settings put secure location_providers_allowed +network;

exit 0
