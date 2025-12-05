# M1 MacBook Air - Quick Reference Card

## 🚀 Fastest Way to Get Started

### Method 1: Automated Script (Easiest)
```bash
./install_m1.sh
```
This script will guide you through the installation process.

### Method 2: Manual Installation (Step-by-Step)

#### 1️⃣ Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add to PATH (if needed):
```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
source ~/.zshrc
```

#### 2️⃣ Install PHP
```bash
brew install php
```

#### 3️⃣ Install MySQL
```bash
brew install mysql
brew services start mysql
mysql_secure_installation  # Set root password
```

#### 4️⃣ Set Up Database
```bash
# Create database
mysql -u root -p -e "CREATE DATABASE travel_app;"

# Import data
mysql -u root -p travel_app < "travel_app (1).sql"
```

#### 5️⃣ Update Configuration
Edit `db_connect.php` and update the MySQL password:
```php
$password = 'YOUR_MYSQL_PASSWORD';  // Change from 'root'
```

#### 6️⃣ Run the App
```bash
./start_server.sh
```

Then open: **http://localhost:8000/index.php**

---

## ✅ Verification Commands

Check if everything is installed:
```bash
brew --version    # Should show version
php --version     # Should show PHP 8.x
mysql --version   # Should show MySQL version
```

Check if services are running:
```bash
brew services list  # MySQL should show "started"
```

---

## 🔧 Common Issues & Fixes

| Issue | Solution |
|-------|----------|
| `php: command not found` | `echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc` |
| MySQL won't start | `brew services start mysql` |
| Database connection error | Check password in `db_connect.php` matches MySQL root password |
| Port 8000 in use | Use different port: `php -S localhost:8080` |

---

## 📁 File Locations (M1 Mac)

- **Homebrew:** `/opt/homebrew/`
- **PHP:** `/opt/homebrew/bin/php`
- **MySQL:** `/opt/homebrew/bin/mysql`
- **Project:** `~/Documents/project/A-one-stop-solution-focusing-on-tourism/`

---

## 🎯 Complete Command Sequence

Copy and paste these commands one by one:

```bash
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
source ~/.zshrc

# 2. Install PHP and MySQL
brew install php mysql

# 3. Start MySQL
brew services start mysql

# 4. Set MySQL password (interactive)
mysql_secure_installation

# 5. Navigate to project
cd ~/Documents/project/A-one-stop-solution-focusing-on-tourism

# 6. Create and import database (enter password when prompted)
mysql -u root -p -e "CREATE DATABASE travel_app;"
mysql -u root -p travel_app < "travel_app (1).sql"

# 7. Edit db_connect.php with your MySQL password
# (Use your preferred text editor)

# 8. Start the server
./start_server.sh
```

---

## 📖 Need More Help?

- **Detailed Guide:** See [INSTALL_M1_MAC.md](INSTALL_M1_MAC.md)
- **General Setup:** See [README.md](README.md)
- **Quick Start:** See [QUICK_START.md](QUICK_START.md)

---

**Time Estimate:** 10-15 minutes for complete setup

