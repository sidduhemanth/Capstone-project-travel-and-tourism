# Travel App - One Stop Solution for Tourism

A PHP-based travel booking application that provides services for buses, cabs, trains, hotels, homestays, and restaurants.

## 🍎 For MacBook Air M1/M2 Users

**👉 See [INSTALL_M1_MAC.md](INSTALL_M1_MAC.md) for detailed M1-specific installation instructions!**

Or run the automated installer:
```bash
./install_m1.sh
```

## Prerequisites

1. **PHP 7.4 or higher** - Required to run the application
2. **MySQL 5.7 or higher** - Required for the database
3. **Web Server** (PHP built-in server or Apache/Nginx)

## Installation Steps

### 1. Install PHP (if not already installed)

**On macOS:**
```bash
# Install Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install PHP
brew install php
```

**Alternative:** Download and install from https://www.php.net/downloads.php

### 2. Set Up MySQL Database

1. Start MySQL server (if not running):
   ```bash
   # On macOS with MySQL installed
   sudo /usr/local/mysql/support-files/mysql.server start
   ```

2. Create the database and import the SQL file:
   ```bash
   mysql -u root -p < travel_app\ \(1\).sql
   ```
   
   Or manually:
   ```bash
   mysql -u root -p
   CREATE DATABASE travel_app;
   USE travel_app;
   SOURCE travel_app\ \(1\).sql;
   ```

3. Update database credentials in `db_connect.php` if needed:
   - Default: host='localhost', dbname='travel_app', username='root', password='root'

### 3. Run the Application

**Using PHP Built-in Server:**
```bash
php -S localhost:8000
```

Then open your browser and navigate to:
- **Login Page:** http://localhost:8000/index.php
- **Main Page:** http://localhost:8000/main.php

**Using Apache/Nginx:**
- Place the project in your web server's document root
- Configure virtual host to point to this directory
- Access via your configured domain/port

## Project Structure

- `index.php` - Login page
- `main.php` - Main dashboard with service cards
- `db_connect.php` - Database connection configuration
- `bus.php`, `cab.php`, `train.php` - Transportation booking pages
- `hotel.php`, `homestay.php` - Accommodation booking pages
- `restaurants.php` - Restaurant booking page
- `*-payment.php` - Payment processing pages
- `travel_app (1).sql` - Database schema and initial data

## Default Login

The login form has pre-filled demo credentials (no actual authentication is implemented).

## Features

- Bus booking
- Cab booking
- Train booking
- Hotel booking
- Homestay booking
- Restaurant reservations
- Payment processing

## Troubleshooting

1. **PHP not found:** Make sure PHP is installed and in your PATH
2. **Database connection error:** Verify MySQL is running and credentials in `db_connect.php` are correct
3. **Port already in use:** Change the port in the PHP server command (e.g., `php -S localhost:8080`)

