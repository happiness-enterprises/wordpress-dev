#!/usr/bin/env bash
# Convenient wrapper script to the `wp` command.

sudo -u www-data -E /usr/local/share/wp/wp.bin --path=/var/www/html "$@"
