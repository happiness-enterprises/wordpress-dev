#!/bin/bash
# Helper script to download `wp` and install it upon first invocation in the container.
# Afterwards, this just acts as a passthrough to the `wp` command.

if [ ! -f /usr/local/bin/wp.bin ] ; then
	echo "Installing system packages."
	sleep 1
	apt-get update
	apt install -y bash-completion less sudo

	echo "Providing a shell for www-data so we can shell commands."
	sleep 1
	usermod -s /bin/bash www-data

	echo "Installing the wp command."
	sleep 1
	pushd /usr/local/bin >/dev/null
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	mv wp-cli.phar wp.bin
	chmod +x wp.bin
	popd >/dev/null

	mkdir -p /etc/bash_completion.d/
	pushd /etc/bash_completion.d/ >/dev/null
	curl -O https://raw.githubusercontent.com/wp-cli/wp-cli/v2.11.0/utils/wp-completion.bash
	popd >/dev/null

	echo "Log out and in again to enable bash tab completions."
	echo "Alternatively, run the following command to enable them"
	echo "without logging out and in again."
	echo
	echo "    source /etc/profile.d/bash_completion.sh"

	cat >>${HOME}/.bashrc <<EOF

source /etc/profile.d/bash_completion.sh
EOF
fi

sudo -u www-data -i wp.bin "$@"
