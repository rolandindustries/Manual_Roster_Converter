---------------------------------------------------
-----------------Introduction----------------------
---------------------------------------------------
Welcome to Manual Roster Converter v1.0!!!!

This is a local tool made by Roland Estrada to convert files from the IXL Auto-Roster Data Standard to the 
IXL Manual Rostering data standard.

The IXL Auto-Roster Data Standard documentation can be found here:

https://www.ixl.com/help_docs/IXL-Auto-Rostering-Specifications.pdf

The IXL Manual Rostering documentation can be found here:

https://www.ixl.com/userguides/IXLQuickStart_UploadRoster.pdf

Roland can be reached at the following contact info below for feedback:
restrada@ixl.com
Search "Roland" in Slack

---------------------------------------------------
-------------------About---------------------------
---------------------------------------------------
Manual Roster Converter 1.0 is a SQL script that runs in SQLite.

SQLite was chosen because it allows for the creation of a lightweight, embedded database without
requiring the end user to install a database.

SQLite documentation can be found here:

https://www.sqlite.org/index.html

-------------------------------------------------
--------------Instructions-----------------------
-------------------------------------------------
1. Navigate to your "Manual Roster Converter" folder
2. Navigate to the "Input" folder
3. Save the 5 CSV files you would like to convert in the "Input" folder
3a. As of v1.0, these must be saved as "Schools.csv", "Students.csv", "Teachers.csv", "Sections.csv", and "Enrollments.csv" (without the quotes)
4. Go back to the "Manual Roster Converter" folder, click the batch file "Run Manual File Converter.bat"
5. After a brief pause, check the "Output" folder. Your manual roster file will be saved here as "manual_roster_data.csv"

---------------------------------------------
-------Known Issues and Limitations----------
---------------------------------------------
--The IXL Manual Roster standard allows for students to be added to a teacher's roster based on one of three values of a teacher: last name, username,
or e-mail address. IXL allows for last names and e-mail addresses to be shared between multiple users, but require usernames to be unique. As such, 
username was chosen to be the value selected for a student's teacher.

--You may have students that do not have a value in the "Teacher Username" column even though you may have an enrollment for that student. If that
is the case, then it points to an issue with either the section or the teacher related to that class' enrollment. If the 'Section ID' does not 
exist in the 'Sections.csv' file, then we will not be able to find that teacher's 'Teacher ID' to retrieve the username. Similarly, if a 'Teacher ID'
exists in the 'Sections.csv' file but not in the 'Teachers.csv' file, we will not be able to reference that teacher to retrieve their username.

The Local File Tester, also created by Roland Industries, will allow you to check the files for errors such as these.

The Local File Tester can be found here: https://github.com/rolandindustries/Local_File_Tester