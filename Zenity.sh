#!/bin/bash
username=$(zenity --entry --title Login --text="Username");
password=$(zenity --password --title Login);

result=$(mysql -s -N LibraryManagementSystem -uroot -pmysql123<<<"select count(id) from users where username='$username' and password='$password'");
echo $result;
if [ $result = 1  ]; then 
	zenity --info \
	--text="Login Success";
	zenity --question --text="Do you want to proceed" --ok-label="Yes" --cancel-label="No"
COUNTER=$?
         while [  $COUNTER != 1 ]; do
	choice=$(zenity --list --text="Select from the box" --radiolist --column="Select" \
	--column="Option" --column="Operation" \
	TRUE "1" "Insert in Books Table" \
	FALSE "2" "Insert in Student Table" \
	FALSE "3" "Insert in Issue Table" \
	FALSE "4" "Insert in Return Table" \
	FALSE "5" "View Books" \
	FALSE "6" "View Student" \
	FALSE "7" "View Issue" \
	FALSE "8" "View Return" \
	FALSE "9" "Remove from Books Table" \
	FALSE "10" "Remove From Student Table" \
	--height=320 \
	--width=390)

case "$choice" in
	    1)
		a=$(zenity --entry --title="Author Name" --text="Enter name of Author:" --entry-text "Author" --height=50 --width=350);
		_Author="$a"
		t=$(zenity --entry --title="Title of the Book" --text="Enter Title of Book:" --entry-text "Title" --height=50 --width=350);
		_Title="$t"
		p=$(zenity --entry --title="Publication Name" --text="Enter name of Publication:" --entry-text "Publication" --height=50 --width=350);
		_Pulication="$p"
		e=$(zenity --entry --title="Edition of the Book" --text="Enter Edition of Book:" --entry-text "Edition" --height=50 --width=350);
		_Edition="$e"
		c=$(zenity --entry --title="Number of Copies" --text="Enter number of copies:" --entry-text "Copies" --height=50 --width=350);
		_Copies=$c
		dp=$(zenity --calendar --date-format=%Y-%m-%d --title="Date of purchase" --text="Enter Date of purchase:");
		_Date_pur="$dp"
		pr=$(zenity --entry --title="Price of the Book" --text="Enter Price of the Book:" --entry-text "Price" --height=50 --width=350);
		_price=$pr
		s=$(zenity --entry --title="Status of book" --text="Enter Status of book:" --entry-text "Status" --height=50 --width=350);
		_Status="$s"

		mysql -uroot -pmysql123 LibraryManagementSystem << EOF
		INSERT INTO bookdetails (Author, Title, Pulication, Edition, Copies, Date_pur, price,Status) 
		VALUES ('$_Author','$_Title','$_Pulication','$_Edition',$_Copies,'$_Date_pur',$_price,'$_Status');
EOF
		;;

            2)  
		a=$(zenity --entry --title="Name of the Student" --text="Enter name of Student:" --entry-text "Name" --height=50 --width=350);
		_Name="$a"
		t=$(zenity --entry --title="Regno of student" --text="Enter Regno of Student:" --entry-text "Regno" --height=50 --width=350);
		_Regno=$t
		p=$(zenity --entry --title="Date_of_issue of the Book" --text="Enter Date_of_issue of the Book:" --entry-text "YYYY/MM/DD HH:MM:SS" --height=50 --width=350);
		_Date_of_issue="$p"
		e=$(zenity --entry --title="Address of student" --text="Enter Address of Student:" --entry-text "Address" --height=50 --width=350);
		_Address="$e"
		c=$(zenity --entry --title="date_of_return" --text="Enter Date_of_return of the Book:" --entry-text "YYYY/MM/DD HH:MM:SS" --height=50 --width=350);
		_date_of_return="$c"
		dp=$(zenity --entry --title="Course of the Student" --text="Enter course of Student:" --entry-text "Course" --height=50 --width=350);
		_Course="$dp"
		pr=$(zenity --entry --title="bookId of the Book" --text="Enter bookID of Book:" --entry-text "bookId" --height=50 --width=350);
		_bookId=$pr
		s=$(zenity --entry --title="Gender of the Student" --text="Enter Gender of Student:" --entry-text "Gender" --height=50 --width=350);
		_Gender="$s"

		mysql -uroot -pmysql123 LibraryManagementSystem << EOF
		insert into student(Name, Regno, Date_of_issue, Address, date_of_return, Course, bookId, Gender) 
		VALUES ('$_Name',$_Regno,'$_Date_of_issue','$_Address','$_date_of_return','$_Course','$_bookId','$_Gender');
EOF
		;;		
	    3)
		t=$(zenity --entry --title="Regno of student" --text="Enter Regno of Student:" --entry-text "Regno" --height=50 --width=350);
		_Regno=$t
		p=$(zenity --entry --title="Date_of_issue of the Book" --text="Enter Date_of_issue of the Book:" --entry-text "YYYY/MM/DD HH:MM:SS" --height=50 --width=350);
		_Date_of_issue="$p"
		c=$(zenity --entry --title="date_of_return of the Book" --text="Enter Date_of_return of the Book:" --entry-text "YYYY/MM/DD HH:MM:SS" --height=50 --width=350);
		_date_of_return="$c"
		pr=$(zenity --entry --title="bookId of the Book" --text="Enter BookID of the Book:" --entry-text "bookId" --height=50 --width=350);
		_bookId=$pr
		a=$(zenity --entry --title="Name of the Student" --text="Enter Name of the Student:" --entry-text "Name" --height=50 --width=350);
		_Name="$a"
		dp=$(zenity --entry --title="Course of the Student" --text="Enter course of the student:" --entry-text "Course" --height=50 --width=350);
		_Course="$dp"
		e=$(zenity --entry --title="Author of the Book" --text="Enter Author of the Book:" --entry-text "Author" --height=50 --width=350);
		_Author="$e"
		s=$(zenity --entry --title="Edition of the Book" --text="Enter Edition of the Book:" --entry-text "Edition" --height=50 --width=350);
		_Edition="$s"

		mysql -uroot -pmysql123 LibraryManagementSystem << EOF
		insert into issue (Regno, Date_of_issue, date_of_return, bookId, Name, Course, Author, Edition) 
		VALUES ($_Regno,'$_Date_of_issue','$_date_of_return',$_bookId,'$_Name','$_Course','$_Author','$_Edition');
EOF
		;;
	    4)  
		t=$(zenity --entry --title="Regno of student" --text="Enter Regno of Student:" --entry-text "Regno" --height=50 --width=350);
		_Regno=$t
		p=$(zenity --entry --title="Date_of_issue of the Book" --text="Enter Date_of_issue of the Book:" --entry-text "YYYY/MM/DD HH:MM:SS" --height=50 --width=350);
		_Date_of_issue="$p"
		c=$(zenity --entry --title="date_of_return of the Book" --text="Enter Date_of_return of the Book:" --entry-text "YYYY/MM/DD HH:MM:SS" --height=50 --width=350);
		_date_of_return="$c"
		pr=$(zenity --entry --title="bookId of the Book" --text="Enter BookID of the Book:" --entry-text "bookId" --height=50 --width=350);
		_bookId=$pr
		a=$(zenity --entry --title="Name of the Student" --text="Enter Name of the Student:" --entry-text "Name" --height=50 --width=350);
		_Name="$a"
		dp=$(zenity --entry --title="Course of the Student" --text="Enter course of the student:" --entry-text "Course" --height=50 --width=350);
		_Course="$dp"
		e=$(zenity --entry --title="Author of the Book" --text="Enter Author of the Book:" --entry-text "Author" --height=50 --width=350);
		_Author="$e"
		s=$(zenity --entry --title="Edition of the Book" --text="Enter Edition of the Book:" --entry-text "Edition" --height=50 --width=350);
		_Edition="$s"

		mysql -uroot -pmysql123 LibraryManagementSystem << EOF
		insert into issue (Regno, Date_of_issue, date_of_return, bookId, Name, Course, Author, Edition) 
		VALUES ($_Regno,'$_Date_of_issue','$_date_of_return',$_bookId,'$_Name','$_Course','$_Author','$_Edition');
EOF
		;;
	    5)  
		
		echo "SELECT * FROM bookdetails" | mysql -N LibraryManagementSystem -u root -pmysql123 | tr '\t' '\n' | zenity --list --title="Book Record" --text="" --column="bookId" --column="Author" --column="Title" --column="Pulication" --column="Edition" --column="Copies" --column="Date of purchase" --column="price" --column="Status" --height=310 --width=790;
		;;
	    6)  	
		echo "SELECT * FROM student" | mysql -N LibraryManagementSystem -u root -pmysql123 | tr '\t' '\n' | zenity --list --title="Student Record" --text="" --column="Name" --column="Regno" --column="Date of issue" --column="Address" --column="date of return" --column="Course" --column="bookId" --column="Gender" --height=310 --width=790;
		;;
	    7)
		echo "SELECT * FROM issue" | mysql -N LibraryManagementSystem -u root -pmysql123 | tr '\t' '\n' | zenity --list --title="Issue Record" --text="" --column="Regno" --column="Date of issue" --column="Date of return" --column="BookId" --column="Name" --column="Course" --column="Author" --column="Edition" --height=310 --width=790;

		;;
	    8)
		echo "SELECT * FROM returnBook" | mysql -N LibraryManagementSystem -u root -pmysql123 | tr '\t' '\n' | zenity --list --title="Return Record" --text="" --column="Regno" --column="Date of issue" --column="Date of return" --column="BookId" --column="Name" --column="Course" --column="Author" --column="Edition" --height=310 --width=790;
		;;
	    9)  b=$(zenity --entry --title="Delete from Book table" --text="Enter BookId" --entry-text "BookId");
		mysql -uroot -pmysql123 LibraryManagementSystem << EOF
		DELETE FROM bookdetails WHERE bookId=$b;
EOF
		;;
	    10)  b=$(zenity --entry --title="Delete from Student table" --text="Enter Student Registration number" --entry-text "Regno");
		mysql -uroot -pmysql123 LibraryManagementSystem << EOF
		DELETE FROM student WHERE Regno=$b;
EOF
		;;
	    *)  
		echo "Please enter number ONLY ranging from 1-8!"
		;;
esac
zenity --question --text="Do you want to continue" --ok-label="Yes" --cancel-label="No"
COUNTER=$?
         done
else 
	zenity --info \
	--text="Incorrrect";
fi


