#!/bin/zsh

IFS=$'\n'

# Create timestamped folder.
date=$(date +%Y-%m-%d_%H%M%S)
mkdir ${date}

# Apache
cp -r /usr/local/etc/httpd ${date}/apache2

# MySQL
# mysqldump -u root -p --all-databases > ${date}/mysql_databases.sql
cp -r /usr/local/var/mysql ${date}/mysql

# PHP
cp -r /usr/local/etc/php/7.4 ${date}/php

# SSH
cp -r ~/.ssh ${date}/ssh

# Sites
cp -r ~/Sites ${date}/Sites

# Tags

mkdir ${date}/Tags

tags=(
	"Favorites"
	"Folder Icon"
	"git"
	"Projects"
	"Sites"
	"Templates"
	"Watched"
	"WordPress"
)

for tag in $tags; do

	mdfind "kMDItemUserTags='${tag}'" > "${date}/Tags/${tag}.txt"

done

# Zip & clean up.
zip -er ${date} ${date}
rm -rf ${date}
