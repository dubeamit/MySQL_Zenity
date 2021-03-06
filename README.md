# MySQL_Zenity
A basic GUI application using Zenity to perform insert/view/delete on MySQL 

This was a mini-project on creating a GUI for Library management system in linux.

I used *Zenity* tool to create the GUI.

## Working 
A database is created in MySQL named LibraryManagementSystem containing few tables :
```
mysql> show tables;
+-----------------------------------+
| Tables_in_LibraryManagementSystem |
+-----------------------------------+
| bookdetails                       |
| issue                             |
| returnBook                        |
| student                           |
| users                             |
+-----------------------------------+
5 rows in set (0.00 sec)
```

**These tables need to be created beforehand since our GUI is used to only insert, view and delete data.**
After tables are created it can be populated through the GUI provided by the zenity.sh script

You can create above database just by importing LibraryManagementSystem.sql into your MySQL.
To import first login into MySQL and do the following in your terminal
```
CREATE DATABASE LibraryManagementSystem;
```
Then log out of the MySQL shell and type the following :
```
mysql -u username -p LibraryManagementSystem < [LibraryManagementSystem].sql
```
_replace username with your username_

## Creating the tables and Installing the Zenity script on your Debian system 
###### Creating the LibraryManagementSystem database and its tables

**Login to mysql in the terminal using**

`mysql -uroot -p` a promt will ask for password enter the password to login.

_Database_
`CREATE DATABASE LibraryManagementSystem;`

_Tables_
```
CREATE TABLE users (
   id int(11) NOT NULL AUTO_INCREMENT,
   username varchar(30) NOT NULL,
   email varchar(50) NOT NULL,
   password varchar(128) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY username (username)
  ```
  
  Remember to create users in the users_table so that you can login through the Zenity.sh script

  Similarly create other database/tables if you need other database such as educationSystem, bankingSystem, etc.
  
  A good tutorial on basics of mysql can be found [here](https://www.digitalocean.com/community/tutorials/a-basic-mysql-tutorial).
  
  **_Since database is created now to make the zenity script work_**
  
  1. open the terminal and navigate to directory where you downloaded the Zenity.sh file. 
  For example if your downloaded files are in downloads directory then type this in your terminal
  `cd Downloads`
  2. type `chmod 775 Zenity.sh` to change the permission on the file for different users on the system.
  3. type `./Zenity.sh` to execute the script
  Enter the login credentials and populate the tables. Done!!!!
  
## Will try to help if it's not working properly. :smile: 
  
