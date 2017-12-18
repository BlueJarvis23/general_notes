
# Setup MySQL Database

## Installation 

On Mac you can install MySQL with Homebrew by typing `brew install mysql`.

After the install is complete you will be given the following message:

```
dallin@DallinMBP ~$ brew install mysql
==> Downloading https://homebrew.bintray.com/bottles/mysql-5.7.20.sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring mysql-5.7.20.sierra.bottle.tar.gz
==> /usr/local/Cellar/mysql/5.7.20/bin/mysqld --initialize-insecure --user=dallin
--basedir=/usr/local/Cellar/mysql/5.7.20 --datadir=/usr/lo
==> Caveats
We've installed your MySQL database without a root password. To secure it run:
    mysql_secure_installation

MySQL is configured to only allow connections from localhost by default

To connect run:
    mysql -uroot

To have launchd start mysql now and restart at login:
  brew services start mysql
Or, if you don't want/need a background service you can just run:
  mysql.server start
==> Summary
🍺  /usr/local/Cellar/mysql/5.7.20: 324 files, 233.7MB
```

Next see the following prompts to complete and secure MySQL.

```
dallin@DallinMBP ~$ mysql.server start
Starting MySQL
. SUCCESS! 
dallin@DallinMBP ~$ mysql_secure_installation 

Securing the MySQL server deployment.

Connecting to MySQL using a blank password.

VALIDATE PASSWORD PLUGIN can be used to test passwords
and improve security. It checks the strength of password
and allows the users to set only those passwords which are
secure enough. Would you like to setup VALIDATE PASSWORD plugin?

Press y|Y for Yes, any other key for No: n
Please set the password for root here.

New password: 

Re-enter new password: 
By default, a MySQL installation has an anonymous user,
allowing anyone to log into MySQL without having to have
a user account created for them. This is intended only for
testing, and to make the installation go a bit smoother.
You should remove them before moving into a production
environment.

Remove anonymous users? (Press y|Y for Yes, any other key for No) : y
Success.


Normally, root should only be allowed to connect from
'localhost'. This ensures that someone cannot guess at
the root password from the network.

Disallow root login remotely? (Press y|Y for Yes, any other key for No) : y
Success.

By default, MySQL comes with a database named 'test' that
anyone can access. This is also intended only for testing,
and should be removed before moving into a production
environment.


Remove test database and access to it? (Press y|Y for Yes, any other key for No) : y
 - Dropping test database...
Success.

 - Removing privileges on test database...
Success.

Reloading the privilege tables will ensure that all changes
made so far will take effect immediately.

Reload privilege tables now? (Press y|Y for Yes, any other key for No) : y
Success.

All done! 

```


## Setup from Command Line

To create a MySQL database and user, follow these steps:

At the command line, log in to MySQL as the root user:
`mysql -u root -p`
Type the MySQL root password, and then press Enter.

To create a database user, type the following command. Replace username with the user you want to create, and replace
password with the user's password:

`GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost' IDENTIFIED BY 'password';`

This command grants the user all permissions. However, you can grant specific permissions to maintain precise control
over database access. For example, to explicitly grant the SELECT permission, you would use the following command:

`GRANT SELECT ON *.* TO 'username'@'localhost';`

Type `\q` to exit the mysql program.

To log in to MySQL as the user you just created, type the following command. Replace username with the name of the user
you created in step 3:

`mysql -u username -p`

Type the user's password, and then press Enter.

To create a database, type the following command. Replace dbname with the name of the database that you want to create:

`CREATE DATABASE dbname;`

To work with the new database, type the following command. Replace dbname with the name of the database you created in
step 7:

`USE dbname;`

You can now work with the database. For example, the following commands demonstrate how to create a basic table named
example, and how to insert some data into it:

`CREATE TABLE example ( id smallint unsigned not null auto_increment, name varchar(20) not null, constraint pk_example
primary key (id) ); INSERT INTO example ( id, name ) VALUES ( null, 'Sample data' );`


### SQL scripts 

You can stream-line the process by creating sql scripts to execute multiple sql commands in squence. For example we
could do all of the database operations above in one script: example.sql

```sql
CREATE DATABASE dbname;
USE dbname;
CREATE TABLE tablename ( id smallint unsigned not null auto_increment, name varchar(20) not null, constraint pk_example
primary key (id) );
INSERT INTO tablename ( id, name ) VALUES ( null, 'Sample data' );
```

Then execute it as so: `mysql -u username -p < example.sql`


### Deleting Tables and Databases

`DROP TABLE tablename;`

`DROP DATABASE dbname;`


### Deleting Users

To view a list of all users, type the following command from the mysql> prompt:

`SELECT user FROM mysql.user GROUP BY user;`

To delete a specific user, type the following command from the mysql> prompt. Replace username with the name of the user
that you want to delete:

`DELETE FROM mysql.user WHERE user = 'username';`













