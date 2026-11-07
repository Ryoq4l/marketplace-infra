@echo off
echo Building and restarting Gateway...
docker compose build --no-cache gateway
docker compose up -d gateway
echo Gateway is up!
pause