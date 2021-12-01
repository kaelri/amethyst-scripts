#!/bin/zsh

IFS=$'\n'

for i in $(mdfind 'kMDItemUserTags="Folder Icon"'); do

	if [[ $(fileicon test "${i}") =~ "Has NO custom icon" ]]
	then

		fileicon set "${i}" "${i}/.folder_icon/folder_icon.png"

	fi

done
