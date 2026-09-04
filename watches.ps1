function Write-Log([string] $Message) {
	$Now = Get-Date -Format "HH:mm:ss"
	Write-Output "$Now : $Message"
}

function Add-Tag([string] $Title) {
	$Body = @{'title' = $Title}
	$Response = Invoke-WebRequest `
		-Body ($Body | ConvertTo-Json -Compress) `
		-Headers @{'Content-Type' = 'application/json'; 'x-api-key' = "${env:ChangeDetectionApiKey}"} `
		-Method POST `
		-Uri 'https://changedetection.bob.house/api/v1/tag'
	$TagId = ($Response.Content | jq --raw-output .uuid)
	return $TagId
}

function Add-Watch([string] $ExtractText, [string] $IncludeFilters, [string] $Tag, [string] $Title, [string] $Uri) {
	$TagId = (Add-Tag -Title "$Tag")

	$Body = @{}
	if ($ExtractText) { $Body.extract_text = @($ExtractText) }
	if ($IncludeFilters) { $Body.include_filters = @($IncludeFilters) }
	if ($Tag) { $Body.tags = @($TagId) }
	if ($Title) { $Body.title = $Title }
	if ($Uri) { $Body.url = $Uri }

	$Response = Invoke-WebRequest `
		-Body ($Body | ConvertTo-Json -Compress) `
		-ContentType 'application/json' `
		-Headers @{'x-api-key' = "${env:ChangeDetectionApiKey}"} `
		-Method POST `
		-Uri 'https://changedetection.bob.house/api/v1/watch'

	Write-Log "Added: $Uri"
}

Add-Watch -Tag 'apps' -Title 'https://github.com/AdguardTeam/AdGuardHome/blob/master/internal/configmigrate/configmigrate.go' -Uri 'https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/refs/heads/master/internal/configmigrate/configmigrate.go'
Add-Watch -Tag 'apps' -Title 'https://github.com/AdguardTeam/AdGuardHome/blob/master/internal/filtering/servicelist.go' -Uri 'https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/refs/heads/master/internal/filtering/servicelist.go'
Add-Watch -Tag 'apps' -Uri 'https://docs.goauthentik.io/compose.yml'
Add-Watch -Tag 'apps' -Title 'https://docs.dagu.sh/server-admin/deployment/docker-compose#docker-compose' -Uri 'https://raw.githubusercontent.com/dagucloud/docs/refs/heads/main/server-admin/deployment/docker-compose.md'
Add-Watch -Tag 'apps' -Title 'https://docs.frigate.video/frigate/installation#docker' -Uri 'https://raw.githubusercontent.com/blakeblackshear/frigate/refs/heads/master/docs/docs/frigate/installation.md'
Add-Watch -Tag 'apps' -Title 'https://gethomepage.dev/widgets/' -Uri 'https://github.com/gethomepage/homepage/commits/dev/docs/widgets.atom'
Add-Watch -Tag 'apps' -Title 'https://github.com/alexta69/metube/blob/master/README.md' -Uri 'https://github.com/alexta69/metube/raw/refs/heads/master/README.md'
Add-Watch -Tag 'apps' -Title 'https://github.com/paperless-ngx/paperless-ngx/blob/dev/docker/compose/docker-compose.postgres.yml' -Uri 'https://raw.githubusercontent.com/paperless-ngx/paperless-ngx/refs/heads/dev/docker/compose/docker-compose.postgres.yml'
Add-Watch -Tag 'apps' -Title 'https://github.com/MohamedElashri/snipo/blob/main/docker-compose.yml' -Uri 'https://raw.githubusercontent.com/MohamedElashri/snipo/refs/heads/main/docker-compose.yml'
Add-Watch -Tag 'apps' -Title 'https://github.com/go-vikunja/website/blob/main/src/content/docs/setup/docker-start-to-finish.mdx' -Uri 'https://raw.githubusercontent.com/go-vikunja/website/refs/heads/main/src/content/docs/setup/docker-start-to-finish.mdx'
Add-Watch -Tag 'apps' -Title 'https://github.com/DialmasterOrg/Youtarr/blob/main/docker-compose.yml' -Uri 'https://raw.githubusercontent.com/DialmasterOrg/Youtarr/refs/heads/main/docker-compose.yml'

Add-Watch -Tag 'hardware' -IncludeFilters '//div[contains(@class, "cartridge-search-results")]' -Uri 'https://evercade.co.uk/cartridges/'
Add-Watch -Tag 'hardware' -IncludeFilters '//*[contains(@class, "devicename")]' -Uri 'https://wiki.lineageos.org/devices/'

Add-Watch -Tag 'internet' -IncludeFilters 'json:$.ip' -Uri 'https://api.ipapi.is'
Add-Watch -Tag 'internet' -Uri 'https://www.internic.net/domain/named.cache'

Add-Watch -Tag 'kiwix' -IncludeFilters 'jq:.[] | {date,flavor,name} | select(.name=="maps_en_united-kingdom")' -Title 'Map : United Kingdom' -Uri 'https://zimapi.bob.house/library'
Add-Watch -Tag 'kiwix' -IncludeFilters 'jq:.[] | {date,flavor,name} | select(.name=="gutenberg_en_all")' -Title 'Project Gutenberg Library' -Uri 'https://zimapi.bob.house/library'
Add-Watch -Tag 'kiwix' -IncludeFilters 'jq:.[] | {date,flavor,name} | select(.name=="wikibooks_en_all") | select(.flavor=="maxi")' -Title 'Wikibooks' -Uri 'https://zimapi.bob.house/library'
Add-Watch -Tag 'kiwix' -IncludeFilters 'jq:.[] | {date,flavor,name} | select(.name=="wikipedia_en_all") | select(.flavor=="maxi")' -Title 'Wikipedia' -Uri 'https://zimapi.bob.house/library'
Add-Watch -Tag 'kiwix' -IncludeFilters 'jq:.[] | {date,flavor,name} | select(.name=="wikiquote_en_all") | select(.flavor=="maxi")' -Title 'Wikiquote' -Uri 'https://zimapi.bob.house/library'
Add-Watch -Tag 'kiwix' -IncludeFilters 'jq:.[] | {date,flavor,name} | select(.name=="wiktionary_en_all")' -Title 'Wiktionary' -Uri 'https://zimapi.bob.house/library'

Add-Watch -Tag 'software' -title 'https://github.com/awesome-selfhosted/awesome-selfhosted' -Uri 'https://raw.githubusercontent.com/awesome-selfhosted/awesome-selfhosted/refs/heads/master/README.md'
Add-Watch -Tag 'software' -Uri 'https://docs.docker.com/desktop/release-notes/'
Add-Watch -Tag 'software' -Uri 'https://docs.docker.com/reference/api/engine/version-history/'
Add-Watch -Tag 'software' -IncludeFilters '#supported-versions-table' -Uri 'https://dotnet.microsoft.com/en-us/download/dotnet'
Add-Watch -Tag 'software' -IncludeFilters 'json:$.IDS[0].downloadInfo.DownloadURL' -Title 'Nvidia drivers' -Uri 'https://gfwsl.geforce.com/services_toolkit/services/com/nvidia/services/AjaxDriverService.php?func=DriverManualLookup&psid=120&pfid=942&osID=57&languageCode=1078&beta=0&isWHQL=1&dltype=-1&dch=1&upCRD=0&qnf=0&ctk=null&sort1=1&numberOfResults=1'
Add-Watch -Tag 'software' -Uri 'https://ubuntu.com/download/server'
