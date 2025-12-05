# Quick Start Guide

## Current Status
❌ PHP is not installed on your system

## To Run This Project, You Need:

### Option 1: Install PHP via Homebrew (Recommended)

1. **Install Homebrew** (if not installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install PHP**:
   ```bash
   brew install php
   ```

3. **Set up MySQL Database**:
   ```bash
   # Start MySQL (if not running)
   sudo /usr/local/mysql/support-files/mysql.server start
   
   # Import database (you'll be prompted for MySQL root password)
   mysql -u root -p < "travel_app (1).sql"
   ```
   
   **Note:** If your MySQL root password is not "root", update `db_connect.php` with your actual credentials.

4. **Run the server**:
   ```bash
   ./start_server.sh
   ```
   
   Or manually:
   ```bash
   php -S localhost:8000
   ```

5. **Open in browser**:
   - Login: http://localhost:8000/index.php
   - Main: http://localhost:8000/main.php

### Option 2: Use MAMP/XAMPP

1. Download and install MAMP from https://www.mamp.info/ or XAMPP from https://www.apachefriends.org/
2. Place project files in the `htdocs` folder (XAMPP) or `htdocs` folder (MAMP)
3. Start MAMP/XAMPP servers
4. Import the SQL file via phpMyAdmin
5. Access via http://localhost:8888 (MAMP) or http://localhost (XAMPP)

### Option 3: Use Docker (Advanced)

If you have Docker installed, I can help you set up a Docker configuration.

---

## After PHP is Installed

Once PHP is installed, simply run:
```bash
./start_server.sh
```

The script will:
- ✅ Check if PHP is installed
- ✅ Verify MySQL is available
- ✅ Start the PHP development server on port 8000

---

## Database Configuration

The default database settings in `db_connect.php` are:
- Host: localhost
- Database: travel_app
- Username: root
- Password: root

**Update these if your MySQL credentials are different!**

