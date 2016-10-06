#!/bin/bash

#remove older backup files
find /data/backup/ -maxdepth 1 -type d -mtime +2 -exec rm -rf "{}" \;

#backup directory
BKP_DIR=/data/backup

#destination directory
BKP_SRC=/var/lib

#time zone
backup=${BKP_DIR}/$(date +%F:%H:%M:%S)

#backup file
mkdir -p ${backup}

#copy the backup files from source to destination
cp -r ${BKP_SRC}/* ${backup}

