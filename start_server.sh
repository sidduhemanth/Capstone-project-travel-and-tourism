#!/bin/bash

# Travel App Server Startup Script

echo "🚀 Starting Travel App Server..."
echo ""

# Check if PHP is installed
if ! command -v php &> /dev/null; then
    echo "❌ PHP is not installed or not in PATH"
    echo ""
    echo "Please install PHP first:"
    echo "  macOS: brew install php"
    echo "  Or download from: https://www.php.net/downloads.php"
    echo ""
    exit 1
fi

# Display PHP version
echo "✅ PHP found: $(php --version | head -n 1)"
echo ""

# Check if database file exists
if [ ! -f "travel_app (1).sql" ]; then
    echo "⚠️  Warning: Database SQL file not found"
    echo "   Make sure to import the database before using the app"
    echo ""
fi

# Check database connection (optional - requires MySQL)
if command -v mysql &> /dev/null; then
    echo "✅ MySQL found"
    echo "   Make sure the database 'travel_app' is created and imported"
    echo ""
fi

# Start PHP server
echo "🌐 Starting PHP development server..."
echo "   Server will be available at: http://localhost:8000"
echo "   Press Ctrl+C to stop the server"
echo ""
echo "📱 Access the app at:"
echo "   Login: http://localhost:8000/index.php"
echo "   Main:  http://localhost:8000/main.php"
echo ""

php -S localhost:8000

