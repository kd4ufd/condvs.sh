This files points to the   DVSwitch  "MMDVM_Bridge tune" command allowing updating of DMR Channel MMDVM_Bridge is tuned, pointed too.

First I make a directroy called /local on my system

    cd ~
Time to make the dir

    sudo mkdir /local
Move into the new dir

    cd /local
Make new condvs.sh file

    sudo nano condvs.sh
Add the following text

    #! /usr/bin/bash
    # the "$1" is a variable which will use the Talk Group nunber you want to connect to
    /opt/MMDVM_Bridge/dvswitch.sh tune "$1"
Once complete   cttl+x, ctrl+y, then enter. to save changes

Now make condvs.sh  executable, and you're ready to go.

    sudo chmod +x condvs.sh
Here is how you can us it.

to execute the command in the dir use:    sudo ./condvs.sh (talk group nuber goes here) 

example:    sudo ./condvs.sh 3206802
  
  crontab, This will make a DMR assignment at 10:00 every day.
  
  Use https://crontab.guru
  
  to help you make your timing for you event
   
    0 10 * * * /local/condvs.sh 3206802 
  Command line
  
    sudo /local/condvs.sh 320602
or from within the /local dir.

    sudo ./condivs.sh 3206802
  Added to  the rpt.conf file  under the [functions]
  You an use any valid number to assign to the function
  I  started with 387X  ("387" are the keys for DVS on a keypad)

    sudo nano /etc/asterisk/rpt.conf

      [functions]
      ; DVS Remote Tuning
      3871 = cmd,/local/condvs.sh 53715      ; TGIF TG 53715 KD4UFD Systems
      3872 = cmd,/local/condvs.sh 3206802    ; TGIF TG 3206802 KD4UFD Systems (DMR only)
      3873 = cmd,/local/condvs.sh 204        ; TGIF TG 204 TN Communications Network
      3874 = cmd,/local/condvs.sh 3143399    ; TGIF TG 3143399 HRC KD5FMU
      3865 = cmd,/local/condvs.sh xxxxx      ; Add you TG ID here
  Added to the  Allmon3  web.ini file as a bookmark under the [syscmds] header

    sudo nano /etc/allmon3/web.ini

      [syscmds]
      rpt fun @ *3871 = TGIF TG 53715
      rpt fun @ *3872 = TGIF TG 3206802
      rpt fun @ *3873 = TGIF TG 204
      rpt fun @ *3874 = TGIF TG 3143399 HRC KD5FMU
      rpt fun @ *3865 = TGIF TG 865

Reference Materials.
Thank you to KD5FMU /Freddie  HRC, for making his videoshttps://github.com/kd4ufd/condvs.sh

HRC Videos:

ASL3 Release: https://www.youtube.com/watch?v=aeuj-yI8qrU&t=910s

ASL3 Multi_App: https://www.youtube.com/watch?v=nPjrUngK1Wc&t=147s

ASL3 Connect / disconnect: https://www.youtube.com/watch?v=F3vl7bUIcsI

ASL3 DVS  Part 1: https://www.youtube.com/watch?v=Q73vW2tZVco

ASL3 DVS Part 2: https://www.youtube.com/watch?v=HlVs9rC5pgE&t=555s

ASL3 Allmon3 Favs: https://www.youtube.com/watch?v=0QXYMEWoa9U.

DVSwitch can be found at:  https://github.com/dvswitch
