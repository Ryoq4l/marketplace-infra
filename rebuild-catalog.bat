@echo off
echo Building and restarting Catalog Service...
docker compose build --no-cache catalog
docker compose up -d catalog
echo Catalog Service is up!
pause