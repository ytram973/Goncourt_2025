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

