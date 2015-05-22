FREE TDS
--------

example of configuration files to connect a linux box with an sql server instance 
in the cloud or remotely somewhere else.

* /etc/odbc.ini

[xx.xx.xx.xx]
Description = Randomsoft
Driver = /usr/lib64/libtdsodbc.so
Server = xx.xx.xx.xx
Server Name = ch.americas.net.net
Port = 1433
Trace = Yes
ForceTrace = Yes
ClientCharset = ISO8859-2

* /etc/odbcinst.ini

[PostgreSQL]
Description=ODBC for PostgreSQL
Driver=/usr/lib/psqlodbcw.so
Setup=/usr/lib/libodbcpsqlS.so
Driver64=/usr/lib64/psqlodbcw.so
Setup64=/usr/lib64/libodbcpsqlS.so
FileUsage=1

[MySQL]
Description=ODBC for MySQL
Driver=/usr/lib/libmyodbc5.so
Setup=/usr/lib/libodbcmyS.so
Driver64=/usr/lib64/libmyodbc5.so
Setup64=/usr/lib64/libodbcmyS.so
FileUsage=1

[xx.xxx.xxx.xx]
host=xx.xx.163.146
port=1433
tds version=8.0

[FreeTDS]
Description=TDS driver
Driver=/usr/lib64/libtdsodbc.so
tds version=8.0
client charset=ISO-8859-2
text size=65512
UsageCount=5

* Settings

DATABASES = {
    'default': {
        'ENGINE': 'sql_server.pyodbc',
        'NAME': 'soft',
        'USER': 'test',
        'PASSWORD': 'test',
        'HOST': 'xx.xx.163.146',
        'PORT': '1433',
        'OPTIONS': {
            'driver': 'FreeTDS',
            'dsn': 'xx.xx.xx.146',
            'extra_params': 'TDS_VERSION=8.0',
            'collation': 'Latin1_General_CI_AS'
        }
    },
}

