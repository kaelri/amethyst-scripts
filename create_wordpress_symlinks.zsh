#!/bin/zsh

IFS=$'\n'

source="/Users/kaelri/Sites/WordPress"
destination="/Users/kaelri/Documents/Life/Kaelri.com"

# NODE MODULES

rm -f "${destination}/node_modules"
ln -s "${source}/node_modules" "${destination}/node_modules"

# PLUGINS

plugins=(
	"advanced-custom-fields-pro"
	"wp-sync-db"
	"wp-sync-db-media-files"
)

for plugin in $plugins; do

	rm -rf "${destination}/wp-content/plugins/${plugin}"
	ln -s "${source}/wp-content/plugins/${plugin}" "${destination}/wp-content/plugins/${plugin}"

done

# THEMES

themes=(
	"twentytwentyone"
)

for theme in $themes; do

	rm -rf "${destination}/wp-content/themes/${theme}"
	ln -s "${source}/wp-content/themes/${theme}" "${destination}/wp-content/themes/${theme}"

done
