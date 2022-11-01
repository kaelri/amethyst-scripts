#!/usr/bin/env zsh

IFS=$'\n'

# Create timestamped folder.
date=$(date +%Y-%m-%d_%H%M%S)
mkdir ${date}

# Apache
cp -r /usr/local/etc/httpd ${date}/httpd

# MySQL
# mysqldump -u root -p --all-databases > ${date}/mysql_databases.sql
cp -r /usr/local/var/mysql ${date}/mysql

# PHP
cp -r /usr/local/etc/php ${date}/php

# SSH
cp -r ~/.ssh ${date}/ssh

# ZSH
mkdir ${date}/zsh
cp -r ~/.oh-my-zsh ${date}/zsh/.oh-my-zsh
cp ~/.zsh_history ${date}/zsh/.zsh_history
cp ~/.zshrc ${date}/zsh/.zshrc

# Sites
cp -r ~/Sites ${date}/Sites

# Tags

mkdir ${date}/Tags

tags=(
	"Areas"
	"Code"
	"Favorites"
	"Folder Icon"
	"Obsidian"
	"Projects"
	"Shared"
	"Sites"
	"Today"
	"WordPress"
)

for tag in $tags; do

	mdfind "kMDItemUserTags='${tag}'" > "${date}/Tags/${tag}.txt"

done

# Zip & clean up.
zip -er ${date} ${date}
rm -rf ${date}
