# Goucourt

Goucourt is a Python project for evaluation..

## Installation

### Prerequisites
- Python 3.8+
- MySQL database

### Setup Virtual Environment
```bash
# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate
```

### Install Dependencies
```bash
pip install pymysql types-PyMysql
```

### Setup Database

### Create MySQL User

Create a MySQL user before your Python application can connect. Follow these steps:

1. Connect to MySQL as administrator
```bash
mysql -u root -p
```

2. Create the user with your credentials
```sql
CREATE USER 'Goncourt'@'localhost' IDENTIFIED BY '4MxB9?m,Ob5O';
```

3. Grant database permissions
```sql
GRANT ALL PRIVILEGES ON goncourt.* TO 'Goncourt'@'localhost';
FLUSH PRIVILEGES;
```

4. Verify the user creation
```sql
SELECT User FROM mysql.user WHERE User='Goncourt';
EXIT;
```

Import the database schema using the `goucourt.sql` file via phpMyAdmin or command line:
```bash
mysql -u your_username -p your_database_name < goucourt.sql
```

## Requirements
- Python 3.8+
- MySQL
- pymysql
- types-PyMysql


## Author
ytram973 :
Marty RABORD

