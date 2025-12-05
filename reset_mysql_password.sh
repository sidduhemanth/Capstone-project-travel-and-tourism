#!/bin/bash

# Script to reset MySQL root password to 'root'

echo "🔐 MySQL Password Reset Script"
echo "=============================="
echo ""
echo "This script will reset MySQL root password to 'root'"
echo "to match the configuration in db_connect.php"
echo ""
echo "⚠️  Make sure MySQL is running first!"
echo ""
read -p "Continue? (y/n): " confirm

if [ "$confirm" != "y" ]; then
    echo "Cancelled."
    exit 1
fi

echo ""
echo "Step 1: Stopping MySQL..."
sudo pkill mysqld 2>/dev/null
sleep 2

echo "Step 2: Starting MySQL in safe mode..."
sudo mysqld_safe --skip-grant-tables --skip-networking &
sleep 3

echo "Step 3: Resetting password..."
mysql -u root <<EOF
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
FLUSH PRIVILEGES;
EOF

echo "Step 4: Stopping safe mode MySQL..."
sudo pkill mysqld_safe
sudo pkill mysqld
sleep 2

echo "Step 5: Starting MySQL normally..."
brew services start mysql 2>/dev/null || /opt/homebrew/bin/brew services start mysql 2>/dev/null
sleep 3

echo ""
echo "Testing connection..."
if mysql -u root -proot -e "SELECT 1;" &>/dev/null; then
    echo "✅ Password reset successful!"
    echo "✅ MySQL root password is now: root"
    echo ""
    echo "Your db_connect.php should now work!"
else
    echo "❌ Password reset may have failed. Try manual method below."
fi

