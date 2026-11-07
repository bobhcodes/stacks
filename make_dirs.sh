#! /bin/bash

make_user_directory() {
	local dir="${1:?Usage: make_user_directory <directory_path>}"

	if [[ ! -d "$dir" ]]; then
		mkdir --parents "$dir"
	fi

	own_user_directory "$dir"
}

own_user_directory() {
	local dir="${1:?Usage: own_user_directory <directory_path>}"
	chown --changes --from root:root --preserve-root --recursive 1000:1000 "$dir"
}

if [[ $(hostname --long) =~ ^freeman ]]; then
	echo freeman
	make_user_directory "/opt/appdata/dockhand/"
	make_user_directory "/opt/appdata/squid/"
	make_user_directory "/opt/appdata/squid/data/"
	make_user_directory "/opt/appdata/squid/log/"
fi

if [[ $(hostname --long) =~ ^docker2 ]]; then
	echo docker2
	make_user_directory "/opt/appdata/apprise/"
	make_user_directory "/opt/appdata/bagetter/"
	make_user_directory "/opt/appdata/grafana/"
	make_user_directory "/opt/appdata/jotty/config/"
	make_user_directory "/opt/appdata/jotty/data/"
	make_user_directory "/opt/appdata/rabbitmq/"
	make_user_directory "/opt/appdata/snipo/"
fi

if [[ $(hostname --long) =~ ^media1 ]]; then
	echo media1
	make_user_directory "/mnt/md1/ganymede/"
	make_user_directory "/mnt/md1/MediaThumbnails/navidrome/"
	make_user_directory "/mnt/md1/retro/"
	make_user_directory "/opt/appdata/jellyfin/"
	make_user_directory "/opt/appdata/jellyseerr/"
	make_user_directory "/opt/appdata/ganymede/"
	make_user_directory "/opt/appdata/lidarr/"
	make_user_directory "/opt/appdata/metube/"
	make_user_directory "/opt/appdata/navidrome/"
	make_user_directory "/opt/appdata/qbittorrent/"
	make_user_directory "/opt/appdata/radarr/"
	make_user_directory "/opt/appdata/romm/app/"
	make_user_directory "/opt/appdata/romm/db/"
	make_user_directory "/opt/appdata/romm/redis/"
	make_user_directory "/opt/appdata/sonarr/"
	make_user_directory "/opt/appdata/youtarr/config/"
	make_user_directory "/opt/appdata/youtarr/db/"
	make_user_directory "/opt/appdata/youtarr/images/"
fi

if [[ $(hostname --long) =~ ^wan1 ]]; then
	echo wan1
	make_user_directory "/opt/appdata/leafwiki/"
fi
