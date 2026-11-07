@echo off
echo Building and restarting Wallet Service...
docker compose build --no-cache wallet
docker compose up -d wallet
echo Wallet Service is up!
pause