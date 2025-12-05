# Fix Database Connection Error

## Quick Fix Options

### Option 1: Reset MySQL Password to 'root' (Easiest)

**Method A: Using the script**
```bash
chmod +x reset_mysql_password.sh
./reset_mysql_password.sh
```

**Method B: Manual reset**
1. Stop MySQL:
   ```bash
   brew services stop mysql
   ```

2. Start MySQL in safe mode:
   ```bash
   sudo mysqld_safe --skip-grant-tables --skip-networking &
   ```

3. Reset password (in new terminal):
   ```bash
   mysql -u root
   ```
   Then run:
   ```sql
   FLUSH PRIVILEGES;
   ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
   FLUSH PRIVILEGES;
   EXIT;
   ```

4. Stop safe mode and restart MySQL:
   ```bash
   sudo pkill mysqld_safe
   brew services start mysql
   ```

### Option 2: Update db_connect.php with Your MySQL Password

If you know your MySQL root password:

1. Open `db_connect.php`
2. Change line 5 from:
   ```php
   $password = 'root';
   ```
   to:
   ```php
   $password = 'your_actual_mysql_password';
   ```

### Option 3: Create New MySQL User (Alternative)

If you can't reset root password, create a new user:

1. Connect to MySQL (you'll need your current root password):
   ```bash
   mysql -u root -p
   ```

2. Create new user and grant privileges:
   ```sql
   CREATE USER 'travelapp'@'localhost' IDENTIFIED BY 'root';
   GRANT ALL PRIVILEGES ON travel_app.* TO 'travelapp'@'localhost';
   FLUSH PRIVILEGES;
   EXIT;
   ```

3. Update `db_connect.php`:
   ```php
   $username = 'travelapp';
   $password = 'root';
   ```

## Verify Database Connection

After fixing, test the connection:
```bash
mysql -u root -proot -e "USE travel_app; SHOW TABLES;"
```

If this works, your app should connect successfully!

## Check if Database Exists

Make sure the database is created:
```bash
mysql -u root -proot -e "SHOW DATABASES;" | grep travel_app
```

If not found, create it:
```bash
mysql -u root -proot -e "CREATE DATABASE travel_app;"
mysql -u root -proot travel_app < "travel_app (1).sql"
```

