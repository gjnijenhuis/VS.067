#!/bin/bash
uploadbool=false
today=`date +%Y-%m-%d.%H:%M:%S`
backupdir="backups/"

cd ~/klipper_config

git pull origin VS.067

for file in *[0-9].cfg; do
        if [ -f "$file" ] # does file exist?
        then
		   mv $file $backupdir$file
		   uploadbool=true
        fi
done

git add .
git commit -m "backup."$today
#git push -u origin VS.067 --force
git push
