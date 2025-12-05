# 🚀 Quick Run Guide - VS Code & Other IDEs

## VS Code (Recommended)

### Method 1: Using Tasks (Easiest)

1. **Open the project in VS Code:**
   ```bash
   code .
   ```

2. **Start the server:**
   - Press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows/Linux)
   - Type: `Tasks: Run Task`
   - Select: **"Start PHP Server"**

3. **Open in browser:**
   - The server will start on `http://localhost:8000`
   - Press `Cmd+Click` (Mac) or `Ctrl+Click` (Windows/Linux) on the link in the terminal
   - Or manually open: http://localhost:8000/index.php

4. **Stop the server:**
   - Press `Cmd+Shift+P` → `Tasks: Run Task` → **"Stop PHP Server"**

### Method 2: Using Integrated Terminal

1. **Open Terminal in VS Code:**
   - Press `` Ctrl+` `` (backtick) or `View → Terminal`

2. **Run the server:**
   ```bash
   export PATH="/opt/homebrew/bin:$PATH"
   php -S localhost:8000
   ```

3. **Open browser:** http://localhost:8000/index.php

### Method 3: Using Run & Debug

1. **Press `F5`** or go to `Run → Start Debugging`
2. **Select:** "Launch PHP Server"
3. Browser will open automatically

---

## Other IDEs

### PHPStorm / IntelliJ IDEA

1. **Right-click on `index.php`**
2. **Select:** `Run 'index.php'`
3. **Or create a Run Configuration:**
   - Go to `Run → Edit Configurations`
   - Click `+` → `PHP Built-in Web Server`
   - Set:
     - Host: `localhost`
     - Port: `8000`
     - Document root: Project root
   - Click `OK` and run

### Sublime Text

1. **Install Package Control** (if not installed)
2. **Install:** `Terminal` package
3. **Open Terminal:** `Tools → Terminal → Open Terminal`
4. **Run:**
   ```bash
   export PATH="/opt/homebrew/bin:$PATH"
   php -S localhost:8000
   ```

### Atom

1. **Install:** `platformio-ide-terminal` package
2. **Open Terminal:** `Packages → PlatformIO IDE Terminal → New Terminal`
3. **Run:**
   ```bash
   export PATH="/opt/homebrew/bin:$PATH"
   php -S localhost:8000
   ```

### Cursor (AI Code Editor)

Same as VS Code! Use the `.vscode` configurations provided.

---

## Quick Commands Reference

### Start Server
```bash
export PATH="/opt/homebrew/bin:$PATH"
php -S localhost:8000
```

### Stop Server
```bash
# Find and kill the process
lsof -ti:8000 | xargs kill -9

# Or use the script
./start_server.sh
```

### Start MySQL
```bash
brew services start mysql
```

### Stop MySQL
```bash
brew services stop mysql
```

---

## VS Code Extensions (Optional but Helpful)

Install these for better PHP development:

1. **PHP Intelephense** - PHP language support
2. **PHP Debug** - Debugging support
3. **Live Server** - Alternative server (for static files)
4. **MySQL** - Database management

---

## Keyboard Shortcuts (VS Code)

- `` Ctrl+` `` - Toggle Terminal
- `Cmd+Shift+P` - Command Palette
- `F5` - Start Debugging
- `Shift+F5` - Stop Debugging
- `Cmd+Click` - Open link in browser

---

## One-Click Run Script

You can also use the provided script:

```bash
./start_server.sh
```

This automatically:
- ✅ Checks PHP installation
- ✅ Verifies MySQL
- ✅ Starts the server
- ✅ Shows you the URL

---

## Troubleshooting

### "php: command not found" in VS Code Terminal

**Fix:** Add to your `~/.zshrc`:
```bash
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

Then restart VS Code.

### Port 8000 already in use

**Change port:**
```bash
php -S localhost:8080
```

Update the URL to: http://localhost:8080/index.php

### MySQL not running

**Start MySQL:**
```bash
brew services start mysql
```

Or use VS Code task: `Tasks: Run Task` → `Start MySQL`

---

## Pro Tips

1. **Bookmark these URLs:**
   - Login: http://localhost:8000/index.php
   - Main: http://localhost:8000/main.php

2. **Use VS Code Live Reload:**
   - Install "Live Server" extension
   - Right-click `index.php` → `Open with Live Server`

3. **Auto-open browser:**
   - VS Code will auto-open browser when using Debug (F5)

4. **Multiple terminals:**
   - Split terminal to run server + MySQL commands simultaneously

---

## Quick Start Checklist

- [ ] Open project in VS Code: `code .`
- [ ] Start MySQL: `brew services start mysql` (or use VS Code task)
- [ ] Start PHP server: `Cmd+Shift+P` → `Tasks: Run Task` → `Start PHP Server`
- [ ] Open browser: http://localhost:8000/index.php
- [ ] ✅ Project is running!

---

**That's it! Your project is ready to run with one click in VS Code! 🎉**

