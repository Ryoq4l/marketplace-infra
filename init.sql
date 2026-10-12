CREATE DATABASE IF NOT EXISTS auth_db;
CREATE DATABASE IF NOT EXISTS wallet_db;
CREATE USER IF NOT EXISTS 'market_user'@'%' IDENTIFIED BY 'market_pass';
ALTER USER 'market_user'@'%' IDENTIFIED BY 'market_pass';
GRANT ALL PRIVILEGES ON auth_db.* TO 'market_user'@'%';
GRANT ALL PRIVILEGES ON wallet_db.* TO 'market_user'@'%';
FLUSH PRIVILEGES;