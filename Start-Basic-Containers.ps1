function Start-Containers([string] $HostOrIp, [string] $DockerProfile) {
	if (Test-Connection -Quiet -TargetName $HostOrIp) { 
		ssh root@$HostOrIp `
			docker compose --file /opt/repos/stacks/docker-compose.yml --profile $DockerProfile up --detach
	}
}

Start-Containers -HostOrIp 192.168.1.60 -DockerProfile docker1a
Start-Containers -HostOrIp 192.168.1.65 -DockerProfile docker2a
