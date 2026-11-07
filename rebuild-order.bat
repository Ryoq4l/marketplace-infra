@echo off
echo Building and restarting Order Service...
docker compose build --no-cache order
docker compose up -d order
echo Order Service is up!
pause