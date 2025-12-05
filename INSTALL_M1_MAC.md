# Installation Guide for MacBook Air M1 Chip

This guide is specifically tailored for Apple Silicon (M1/M2) Macs.

## Step 1: Install Homebrew

Homebrew is the easiest way to install PHP and manage packages on macOS.

### Install Homebrew for M1 Mac:

1. **Open Terminal** (Applications > Utilities > Terminal)

2. **Install Homebrew** (this will install to `/opt/homebrew` on M1 Macs):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. **Follow the prompts** - you may be asked for your password

4. **Add Homebrew to your PATH** (if not already done):
   ```bash
   echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
   source ~/.zshrc
   ```

5. **Verify installation**:
   ```bash
   brew --version
   ```

## Step 2: Install PHP

1. **Install PHP** (Homebrew will install the ARM64 version for M1):
   ```bash
   brew install php
   ```

2. **Verify PHP installation**:
   ```bash
   php --version
   ```
   You should see PHP 8.x or higher

3. **Check PHP location** (should be in `/opt/homebrew/bin/php`):
   ```bash
   which php
   ```

## Step 3: Install and Set Up MySQL

### Option A: Install MySQL via Homebrew (Recommended)

1. **Install MySQL**:
   ```bash
   brew install mysql
   ```

2. **Start MySQL service**:
   ```bash
   brew services start mysql
   ```

3. **Secure MySQL installation** (set root password):
   ```bash
   mysql_secure_installation
   ```
   Follow the prompts to set a root password. **Remember this password!**

### Option B: Use Existing MySQL Installation

If you already have MySQL installed (like from MySQL.com installer):

1. **Start MySQL** (if not running):
   ```bash
   sudo /usr/local/mysql/support-files/mysql.server start
   ```
   Or if it's a service:
   ```bash
   sudo launchctl load -w /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist
   ```

## Step 4: Create and Import Database

1. **Navigate to your project directory**:
   ```bash
   cd ~/Documents/project/A-one-stop-solution-focusing-on-tourism
   ```

2. **Create the database** (you'll be prompted for MySQL root password):
   ```bash
   mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS travel_app;"
   ```

3. **Import the SQL file**:
   ```bash
   mysql -u root -p travel_app < "travel_app (1).sql"
   ```

   **Alternative method** (if the above doesn't work due to filename):
   ```bash
   mysql -u root -p travel_app < travel_app\ \(1\).sql
   ```

4. **Verify database was created**:
   ```bash
   mysql -u root -p -e "USE travel_app; SHOW TABLES;"
   ```

## Step 5: Update Database Configuration

1. **Open `db_connect.php`** in a text editor

2. **Update the credentials** if needed:
   ```php
   $host = 'localhost';
   $dbname = 'travel_app';
   $username = 'root';
   $password = 'YOUR_MYSQL_ROOT_PASSWORD';  // Change this!
   ```

   If you used the default during `mysql_secure_installation`, update the password here.

## Step 6: Run the Application

1. **Make sure you're in the project directory**:
   ```bash
   cd ~/Documents/project/A-one-stop-solution-focusing-on-tourism
   ```

2. **Run the startup script**:
   ```bash
   ./start_server.sh
   ```

   Or manually start the PHP server:
   ```bash
   php -S localhost:8000
   ```

3. **Open your browser** and navigate to:
   - **Login Page:** http://localhost:8000/index.php
   - **Main Dashboard:** http://localhost:8000/main.php

## Troubleshooting for M1 Macs

### Issue: "Command not found: php" after installation

**Solution:**
```bash
# Add to PATH
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### Issue: MySQL connection errors

**Check if MySQL is running:**
```bash
brew services list
# or
ps aux | grep mysql
```

**Start MySQL:**
```bash
brew services start mysql
# or if installed via MySQL installer:
sudo /usr/local/mysql/support-files/mysql.server start
```

### Issue: Permission denied errors

**For MySQL:**
- Make sure you're using the correct password
- Try: `mysql -u root -p` and enter password when prompted

**For PHP server:**
- Make sure port 8000 is not in use:
  ```bash
  lsof -i :8000
  ```
- If port is busy, use a different port:
  ```bash
  php -S localhost:8080
  ```

### Issue: "Architecture mismatch" errors

If you see architecture errors, make sure you're using ARM64 versions:
```bash
# Check architecture
uname -m  # Should show: arm64

# Check PHP architecture
file $(which php)  # Should show: arm64
```

## Quick Verification Checklist

After installation, verify everything works:

- [ ] `brew --version` shows Homebrew version
- [ ] `php --version` shows PHP 8.x or higher
- [ ] `mysql --version` shows MySQL version
- [ ] MySQL service is running (`brew services list`)
- [ ] Database `travel_app` exists (`mysql -u root -p -e "SHOW DATABASES;"`)
- [ ] `php -S localhost:8000` starts without errors
- [ ] http://localhost:8000/index.php loads in browser

## Alternative: Using MAMP for M1 Mac

If you prefer a GUI-based solution:

1. **Download MAMP** from https://www.mamp.info/
   - Make sure to download the M1/ARM64 version

2. **Install and start MAMP**

3. **Place project files** in: `/Applications/MAMP/htdocs/travel-app/`

4. **Access via:** http://localhost:8888/travel-app/index.php

5. **Use phpMyAdmin** (included with MAMP) to import the SQL file

---

## Summary

For M1 MacBook Air, the recommended approach is:
1. Install Homebrew (ARM64 version)
2. Install PHP via Homebrew
3. Install MySQL via Homebrew
4. Import database
5. Update `db_connect.php` with your MySQL password
6. Run `./start_server.sh` or `php -S localhost:8000`

The entire setup should take about 10-15 minutes!

