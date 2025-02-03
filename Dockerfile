FROM wordpress:latest

RUN apt-get update && \
	apt install -y \
		bash-completion \
		less \
		sudo

RUN usermod -s /bin/bash www-data

RUN mkdir -p /usr/local/share/wp && \
	curl \
		-o /usr/local/share/wp/wp.bin \
		https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x /usr/local/share/wp/wp.bin

RUN mkdir -p /etc/bash_completion.d/ && \
	curl \
		-o /etc/bash_completion.d/wp-completion.bash \
		https://raw.githubusercontent.com/wp-cli/wp-cli/v2.11.0/utils/wp-completion.bash

RUN cat >>/root/.bashrc <<EOF

source /etc/profile.d/bash_completion.sh
EOF

COPY wp.sh /usr/local/bin/wp
COPY quickinstall.sh /usr/local/bin/quickinstall
