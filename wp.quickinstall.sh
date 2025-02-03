#!/usr/bin/env bash

set -ex

wp core install \
	--url=http://localhost:8080 \
	--title=Sandbox \
	--admin_user=admin \
	--admin_password=admin \
	--admin_email=root@${HOSTNAME}

echo "Visit http://localhost:8080 in your browser and use admin/admin as the user/password."
