/*
Manual Roster Converter by Roland Estrada
Create Manual Roster files from IXL Auto-Roster Data
https://www.ixl.com/help_docs/IXL-Auto-Rostering-Specifications.pdf 
https://www.ixl.com/userguides/IXLQuickStart_UploadRoster.pdf
http://www.ixl.com/help_docs/Setup_templates_district.xlsx
restrada@ixl.com
*/
----------------------------------------------
---------sqlite configuration-----------------
----------------------------------------------
.open test.db
.mode csv
.headers on

----------------------------------------------
--------Load Tables from CSV------------------
----------------------------------------------

.import ./Input/schools.csv test_schools
.import ./Input/teachers.csv test_teachers
.import ./Input/students.csv test_students
.import ./Input/sections.csv test_sections
.import ./Input/enrollments.csv test_enrollments


-------------------------------------------------
-------------Getting Students--------------------
-------------------------------------------------

create temp table manual_roster_data
as
	select schl."school name", std."first name", std."last name", std."student number", std."grade", std."username", std."e-mail", std."password", std_tch."teacher id"
	from test_students std
	left join test_schools schl
	on std."School ID"=schl."school id"
	left join (
		select enroll."student ID", group_concat(tch."teacher id", ';') as "teacher id"
		from test_enrollments enroll
		left join test_sections sct
		on enroll."section id"=sct."section id"
		left join test_teachers tch
		on sct."teacher id"=tch."teacher id"
		group by enroll."student id"
		) as std_tch
	on std."student id"=std_tch."student id"
;


-------------------------------------------------
---------Saving results as CSV-------------------
-------------------------------------------------

.once ./output/manual_roster_data.csv
select * from manual_roster_data;

------------------------------------------------
--------Clean Up tables-------------------------
------------------------------------------------

drop table test_schools;
drop table test_teachers;
drop table test_students;
drop table test_sections;
drop table test_enrollments;
