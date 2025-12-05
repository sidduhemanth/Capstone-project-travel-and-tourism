#!/bin/bash

# Installation Script for MacBook Air M1 Chip
# This script helps install PHP and MySQL via Homebrew

echo "🍎 MacBook Air M1 Installation Script"
echo "======================================"
echo ""

# Check if running on M1 Mac
ARCH=$(uname -m)
if [ "$ARCH" != "arm64" ]; then
    echo "⚠️  Warning: This script is optimized for M1/M2 Macs (ARM64)"
    echo "   Detected architecture: $ARCH"
    echo "   Continue anyway? (y/n)"
    read -r response
    if [ "$response" != "y" ]; then
        exit 1
    fi
fi

echo "✅ Detected architecture: $ARCH"
echo ""

# Step 1: Check/Install Homebrew
echo "📦 Step 1: Checking Homebrew installation..."
if ! command -v brew &> /dev/null; then
    echo "   Homebrew not found. Installing Homebrew..."
    echo "   This will ask for your password and may take a few minutes."
    echo ""
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add to PATH for M1 Macs
    if [ -f "/opt/homebrew/bin/brew" ]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "   ✅ Homebrew is already installed: $(brew --version | head -n 1)"
fi
echo ""

# Step 2: Install PHP
echo "🐘 Step 2: Checking PHP installation..."
if ! command -v php &> /dev/null; then
    echo "   PHP not found. Installing PHP via Homebrew..."
    brew install php
    echo "   ✅ PHP installed: $(php --version | head -n 1)"
else
    echo "   ✅ PHP is already installed: $(php --version | head -n 1)"
fi
echo ""

# Step 3: Check MySQL
echo "🗄️  Step 3: Checking MySQL installation..."
if ! command -v mysql &> /dev/null; then
    echo "   MySQL not found."
    echo "   Would you like to install MySQL via Homebrew? (y/n)"
    read -r install_mysql
    if [ "$install_mysql" = "y" ]; then
        brew install mysql
        brew services start mysql
        echo ""
        echo "   ⚠️  IMPORTANT: Run 'mysql_secure_installation' to set root password"
        echo "   This script will prompt you to set a MySQL root password."
        echo ""
    else
        echo "   Skipping MySQL installation."
        echo "   Make sure MySQL is installed and running before proceeding."
    fi
else
    echo "   ✅ MySQL is installed: $(mysql --version)"
    echo "   Checking if MySQL service is running..."
    if brew services list | grep -q "mysql.*started"; then
        echo "   ✅ MySQL service is running"
    else
        echo "   ⚠️  MySQL service is not running"
        echo "   Start it with: brew services start mysql"
        echo "   Or if installed via MySQL installer: sudo /usr/local/mysql/support-files/mysql.server start"
    fi
fi
echo ""

# Step 4: Database Setup
echo "📊 Step 4: Database Setup"
echo "   To set up the database, you need to:"
echo "   1. Create the database: mysql -u root -p -e 'CREATE DATABASE travel_app;'"
echo "   2. Import SQL file: mysql -u root -p travel_app < 'travel_app (1).sql'"
echo ""
echo "   Would you like to set up the database now? (y/n)"
read -r setup_db
if [ "$setup_db" = "y" ]; then
    echo "   Creating database..."
    mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS travel_app;" 2>/dev/null || {
        echo "   ⚠️  Could not create database automatically."
        echo "   Please run manually: mysql -u root -p -e 'CREATE DATABASE travel_app;'"
    }
    
    if [ -f "travel_app (1).sql" ]; then
        echo "   Importing SQL file..."
        mysql -u root -p travel_app < "travel_app (1).sql" 2>/dev/null || {
            echo "   ⚠️  Could not import SQL file automatically."
            echo "   Please run manually: mysql -u root -p travel_app < 'travel_app (1).sql'"
        }
        echo "   ✅ Database setup attempted"
    else
        echo "   ⚠️  SQL file 'travel_app (1).sql' not found in current directory"
    fi
fi
echo ""

# Step 5: Configuration
echo "⚙️  Step 5: Configuration"
echo "   Please update db_connect.php with your MySQL root password"
echo "   Current default: password = 'root'"
echo "   Edit the file and change the password if needed"
echo ""

# Step 6: Summary
echo "✨ Installation Summary"
echo "======================"
echo ""
echo "✅ Homebrew: $(command -v brew > /dev/null && echo 'Installed' || echo 'Not found')"
echo "✅ PHP: $(command -v php > /dev/null && php --version | head -n 1 || echo 'Not found')"
echo "✅ MySQL: $(command -v mysql > /dev/null && echo 'Installed' || echo 'Not found')"
echo ""
echo "📝 Next Steps:"
echo "   1. Update db_connect.php with your MySQL password"
echo "   2. Make sure MySQL service is running"
echo "   3. Run: ./start_server.sh"
echo "   4. Open: http://localhost:8000/index.php"
echo ""
echo "📖 For detailed instructions, see: INSTALL_M1_MAC.md"
echo ""

