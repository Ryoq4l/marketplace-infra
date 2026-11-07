@echo off
echo Building and restarting Auth Service...
docker compose build --no-cache auth
docker compose up -d auth
echo Auth Service is up!
pause