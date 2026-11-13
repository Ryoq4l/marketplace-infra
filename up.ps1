$secretsRepo = "C:\temp\marketplace-secrets"
$pat = $env:GITHUB_PAT
#[Environment]::SetEnvironmentVariable("GITHUB_PAT", "токен", "User")
$infraPath = Get-Location

if (-not (Test-Path $secretsRepo)) {
    Write-Host "Клонируем репозиторий с секретами..."
    git clone https://$pat@github.com/Ryoq4l/marketplace-secrets.git $secretsRepo
} else {
    Write-Host "Репозиторий уже существует. Обновляем..."
    cd $secretsRepo
    git pull
    Set-Location $infraPath
}

$secretsFile = "$secretsRepo\secrets.env"
if (Test-Path $secretsFile) {
    Get-Content $secretsFile | ForEach-Object {
        if ($_ -match '^([^#][^=]+)=(.*)$') {
            $key = $matches[1].Trim()
            $value = $matches[2].Trim()
            [Environment]::SetEnvironmentVariable($key, $value, "Process")
        }
    }
    Write-Host "Секреты загружены в память."
} else {
    Write-Error "Файл секретов не найден!"
    exit 1
}

Set-Location $infraPath
Write-Host "Запускаем Docker Compose..."
docker compose up -d --build
