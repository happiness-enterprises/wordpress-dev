#!/usr/bin/env bash

set -ex

wp core install \
	--url=http://localhost:8080 \
	--title=Sandbox \
	--admin_user=admin \
	--admin_password=admin \
	--admin_email=root@localhost.local

plugins=($(echo $WORDPRESS_PLUGINS))
for plugin in "${plugins[@]}" ; do
	wp plugin install "${plugin}"
	#wp plugin auto-updates enable "${plugin}"
	#wp plugin activate "${plugin}"
done

wp plugin uninstall akismet
wp plugin auto-updates enable --all
wp plugin activate --all

echo "Visit http://localhost:8080 in your browser and use admin/admin as the user/password."
