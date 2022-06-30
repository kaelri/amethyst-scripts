#!/usr/bin/env zsh

IFS=$'\n'

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

source_dir="/Users/kaelri/Sites/WordPress"

# UPDATE PLUGINS & THEMES

wp plugin update --path=${source_dir} --all
wp theme  update --path=${source_dir} --all

# UPDATE CORE

for i in $(mdfind 'kMDItemUserTags=WordPress'); do
	echo "\n"
	echo "${i}"
	echo "\n"
	wp core update --path="${i}"
done

# CHECK FOR MISSING PLUGINS & THEMES

echo "\n"

plugin_names=(
	"add-to-any"
	"advanced-custom-fields-font-awesome"
	"advanced-custom-fields-pro"
	"advanced-forms"
	"akismet"
	"all-in-one-wp-migration"
	"async-javascript"
	"atlas-content-modeler"
	"attachment-taxonomies"
	"attributes-for-blocks"
	"autoptimize"
	"backupbuddy1"
	"bulk-delete"
	"check-email"
	"classic-editor"
	"conditional-tags-shortcode"
	"custom-bulkquick-edit"
	"custom-post-type-date-archives"
	"disqus-comment-system"
	"drift"
	"duplicate-menu"
	"duplicate-post"
	"easy-accordion-free"
	"enable-media-replace"
	"font-awesome"
	"generateblocks"
	"genesis-blocks"
	"give-annual-receipts"
	"give-authorize-net"
	"give-email-reports"
	"give-fee-recovery"
	"give-form-field-manager"
	"give-google-analytics"
	"give-manual-donations"
	"give-pdf-receipts"
	"give-recurring"
	"give-tributes"
	"give"
	"gravityforms"
	"gravityformscli"
	"gutenberg"
	"gw-gravity-forms-submit-to-access"
	"html-editor-syntax-highlighter"
	"instagram-feed"
	"jetpack"
	"jquery-manager"
	"jsm-show-post-meta"
	"mdganim"
	"miniorange-saml-20-single-sign-on"
	"pdf-embedder"
	"post-duplicator"
	"post-expirator"
	"post-type-switcher"
	"query-monitor"
	"quick-pagepost-redirect-plugin"
	"quick-remove-menu-item"
	"raw-html"
	"redirection"
	"regenerate-thumbnails"
	"s2member-files"
	"s2member-logs"
	"search-exclude"
	"show-modified-date-in-admin-lists"
	"sucuri-scanner"
	"theme-inspector"
	"timed-content"
	"user-role-editor"
	"widget-countdown"
	"widget-logic"
	"wordpress-importer"
	"wordpress-seo"
	"wp-all-import-pro"
	"wp-crontrol"
	"wp-file-manager"
	"wp-google-maps"
	"wp-graphql"
	"wp-mail-smtp"
	"wp-mautic"
	"wp-maximum-upload-file-size"
	"wp-nested-pages"
	"wp-sync-db-cli"
	"wp-sync-db-media-files"
	"wp-sync-db"
	"wpai-acf-add-on"
	"wpforms-lite"
	# "fake-plugin-for-testing"
)

has_errors=false

for plugin_name in $plugin_names; do

	plugin_path="${source_dir}/wp-content/plugins/${plugin_name}"

	if [ ! -d "${plugin_path}" ]; then
		has_errors=true
		>&2 echo "${RED}Warning:${NOCOLOR} Plugin does not exist: ${plugin_name}"
	fi

done

theme_names=(
	"twentytwentytwo"
	# "fake-theme-for-testing"
)

for theme_name in $theme_names; do

	theme_path="${source_dir}/wp-content/themes/${theme_name}"

	if [ ! -d "${theme_path}" ]; then
		has_errors=true
		>&2 echo "${RED}Warning:${NOCOLOR} Theme does not exist: ${theme_name}"
	fi

done

if [ $has_errors = false ]; then
	echo "${GREEN}Success:${NOCOLOR} No missing plugins or themes."
fi

echo "\n"
