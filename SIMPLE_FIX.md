# 🔧 Simple Fix for Database Connection Error

## Quick Solution (Choose One)

### ✅ Solution 1: Reset Password to 'root' (Recommended - 2 minutes)

**Step 1:** Open Terminal and run:
```bash
mysql -u root -p
```
When prompted, try:
- Press Enter (if no password)
- Or try: `root`, `password`, or your Mac login password

**Step 2:** Once connected, run these SQL commands:
```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
FLUSH PRIVILEGES;
EXIT;
```

**Step 3:** Test the connection:
```bash
mysql -u root -proot -e "SELECT 1;"
```

If you see no error, you're done! Refresh your browser.

---

### ✅ Solution 2: Update db_connect.php with Your Password

If you know your MySQL password:

1. **Open** `db_connect.php` in your editor
2. **Find line 5:** `$password = 'root';`
3. **Replace** with your actual MySQL password:
   ```php
   $password = 'your_actual_password_here';
   ```
4. **Save** the file
5. **Refresh** your browser

---

### ✅ Solution 3: Try Empty Password

If MySQL was installed without a password, update `db_connect.php`:

Change line 5 to:
```php
$password = '';
```

---

## Still Not Working?

### Check if Database Exists:
```bash
mysql -u root -proot -e "SHOW DATABASES;" | grep travel_app
```

If not found, create it:
```bash
mysql -u root -proot -e "CREATE DATABASE travel_app;"
mysql -u root -proot travel_app < "travel_app (1).sql"
```

### Check MySQL is Running:
```bash
brew services list | grep mysql
```

If stopped, start it:
```bash
brew services start mysql
```

---

## Need Help Finding Your Password?

Try these common defaults:
- (empty - no password)
- `root`
- `password`
- Your Mac user account password
- The password you set during `mysql_secure_installation`

