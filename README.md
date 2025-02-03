To use this repository, check it out and make a new branch. From there, make any changes you wish to the compose file.

You may need the `wp` command to make creating a new plugin or other scaffolding in your WordPress development work. Please follow the instructions [here](https://make.wordpress.org/cli/handbook/guides/installing/) to install it.
Then, if you are working on a new plugin, use `wp scaffolding` to generate whatever scaffolding you need and make it a repository of your own if that's your desire, and update `docker-compose.yml` to make it a volume in the correct location under `/var/www/html` in the container.
If you are working on a plugin or other piece of WordPress code already existing, check it out and update the `docker-compose.yml` similar to the other use-case.

A common location you might use is `/var/www/html/wp-content/plugins/my-fancy-plugin/` if you are developing a plugin.
