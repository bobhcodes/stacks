#! /bin/bash

make_user_directory() {
	local dir="${1:?Usage: make_user_directory <directory_path>}"

	if [[ ! -d "$dir" ]]; then
		mkdir --parents "$dir" \
			&& chown --changes --from root:root --preserve-root --recursive 1000:1000 "$dir"
	fi
}

if [[ $(hostname --long) =~ ^freeman ]]; then
	echo freeman
	make_user_directory "/opt/appdata/squid/"
	make_user_directory "/opt/appdata/squid/data/"
	make_user_directory "/opt/appdata/squid/log/"
fi

if [[ $(hostname --long) =~ ^docker2 ]]; then
	echo docker2
	make_user_directory "/opt/appdata/apprise/"
	make_user_directory "/opt/appdata/bagetter/"
	make_user_directory "/opt/appdata/grafana/"
	make_user_directory "/opt/appdata/rabbitmq/"
	make_user_directory "/opt/appdata/snipo/"
fi
