#!/bin/sh

target_dir="<Path_to_target_directory>"
source_dir="<Path_to_source_directory>"
date=$(date +"%Y-%m-%d_%H-%M-%S")

echo $target_dir
echo $source_dir
echo $date

echo "tar -czvf $target_dir/backup_$date.tar.gz $source_dir"
tar -czvf $target_dir/backup_$date.tar.gz $source_dir

echo "Listing the Backup"
ls -lrth $target_dir | grep -i *$date.tar.gz