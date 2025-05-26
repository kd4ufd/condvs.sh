#! /usr/bin/bash
# created by Tom Perry (KD4UFD) May 15, 2025
######
# example of use
# cmd line
#     sudo /local/condvs.sh 53715
#
# crontab -e
#     0 1 * * * /local/condvs.sh 53715
#
# ASL3  rpt.conf file edit for DVSwitch Remote, added uner the [function] header.
#  /etc/asterisk/rpt.conf
#    ;DVS Remote Tuning
#      3871 = cmd,/local/condvs.sh 53715      ; TGIF TG 53715 KD4UFD Systems
#      3872 = cmd,/local/condvs.sh 3206802    ; TGIF TG 3206802 KD4UFD Systems (DMR only)
#      3873 = cmd,/local/condvs.sh 204        ; TGIF TG 204 TN Communications Network
#      3874 = cmd,/local/condvs.sh 3143399    ; TGIF TG 3143399 HRC KD5FMU
#      3865 = cmd,/local/condvs.sh 865        ; TGIF TG 865 Knoxville Digital Group
#      
# Allmon3 Book Mark, listed under the [syscmds] header.
#  /etc/allmon3/web.ini
#      rpt fun @ *3871 = TGIF TG 53715
#      rpt fun @ *3874 = TGIF TG 3143399 HRC KD5FMU
######

/opt/MMDVM_Bridge/dvswitch.sh tune "$1"
