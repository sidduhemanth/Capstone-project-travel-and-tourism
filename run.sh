#!/bin/bash

# Quick Run Script for Travel App
# This script starts everything you need

echo "🚀 Travel App - Quick Start"
echo "=========================="
echo ""

# Add Homebrew to PATH
export PATH="/opt/homebrew/bin:$PATH"

# Check PHP
if ! command -v php &> /dev/null; then
    echo "❌ PHP not found. Please install PHP first."
    exit 1
fi

echo "✅ PHP: $(php --version | head -n 1)"
echo ""

# Check MySQL
if command -v mysql &> /dev/null; then
    echo "✅ MySQL: $(mysql --version | head -n 1)"
    
    # Check if MySQL is running
    if brew services list 2>/dev/null | grep -q "mysql.*started"; then
        echo "✅ MySQL service is running"
    else
        echo "⚠️  MySQL service is not running"
        echo "   Starting MySQL..."
        brew services start mysql 2>/dev/null || /opt/homebrew/bin/brew services start mysql 2>/dev/null
        sleep 2
    fi
else
    echo "⚠️  MySQL not found (optional for viewing pages)"
fi
echo ""

# Start PHP server
echo "🌐 Starting PHP development server..."
echo "   Server: http://localhost:8000"
echo "   Login:  http://localhost:8000/index.php"
echo "   Main:   http://localhost:8000/main.php"
echo ""
echo "   Press Ctrl+C to stop the server"
echo ""

php -S localhost:8000

