# SAS
SAS_BASE_Programming
SAS refresher via SASCrunch

Sample run code
Data Test;
a=1;
run;
 Log tab shows you whether or not there is any problem with your code.
 rule of thumb, your code is generally in good shape if the Log tab shows othe notes in blue.
 SAS will stop execution if there is error message in the log tab.
 
 Libraries
 Folder that contains SAS data sets
 
 
 Creating a dataset
 Data Step is used to create a dataset; starts with Dats and ends with run.. each line is sas ends with a semi colon.
 Data Test;
 a=1;
 run;
 Practice creating a data set with 3 variables.
 Data Number;
 var1=123;
 var2=356;
 var3=923;
 run;
 
 #reminders=sas is not case sensitive or indentation sensitive
 #two types of variables in sas are numeric and character
 #Character- single quotation ('John') or double quotation ("John") works
 
 #Practice with characters:
 Data Food;
 restuarant='burger king';
 numemploy=5;
 location='toronto';
 run;
  
  # to create a table with multiple obsevations; you need to use input and datelines statements
  Example

Data Test;
    Input a b c;
    Datalines;
    1 3 4
    2 7 9
    12 444 123
    ;
Run;

(1) Input Statement

The Input statement lists the variables to be created.

In our example, the Input statement tells SAS to create three variables: a, b and c

(2) Datalines

Datalines statement signals SAS to begin reading the data on the next line.

Together with these statements, you can create a data set with multiple observations. 

Practice:
Data Score; 
Input score1 score2 score3;
Datalines;
77 88 35
93 57 74
67 85 71;
run;

#Creating character variabels II
To create the character variables properly, you must add the dollar sign ($) in the Input statement after each character variables:

The dollar sign ($) tells SAS to create NAME and GENDER as character variables.

Data Profile;
Input Pat_ID $ Enrol $ Bscore;
datalines;
P001 yes 99
P002 yes 101
p003 no 125
;
run;

#DATA TRuncation
The data truncation problem can be easily solved by adding a Length statement.


Example

Data Test;
    Length Name $12;
    Input Name $ Gender $;
    Datalines;
    Christopher Male
    Elizabeth Female
    MacDonald Male
    ;
Run;

The Length statement changes the length of the NAME variable from 8 to 12. 

As a result, the complete name is now captured in the data set.
Data Profile;
Length Pat_ID $10;
Input Pat_ID $ Enrol $ Bscore;
datalines;
PAT3000001 yes 99
PAT3000002 yes 101
PAT3000003 no 125
;
run;
 
 
 Copying a data set
 Data Test2;
    Set Test;
Run;

Exercise

From our last exercise, we have created a data set called PROFILE. Create a new data set called NEW_PROFILE from PROFILE using the SET statement.

Data new_profile;
set profile;
run;

Subsetting
Subsetting Data Set

In some cases, you may want to filter the data set and keep only a subset of the original data. 

This can be done by using the IF statement. 
Example

Data TEST3;
    Set Test;
    IF Gender = "Male";
Run;

Exercise

Create a new data set called ENROL based on the PROFILE data set. ENROL should contains only the patients enrolled in the study (ENROL = YES)
 Data Enrol;
 Set Profile;
 if Enrol="yes";/* is case sensitive
 run;
 
 
 
 Unit 8-14
 Locate the HOLIDAY data set from SASHELP. 

Create a subset of the HOLIDAY data set that contains only the holidays that fall in January.

Name the new data set as JanHol and have it created in the WORK library.

/*How many observations are there in the subset? There are three observations.*/

Data JanHol;
Set SASHELP.Holiday;
if month=1;
run;


/*Creating a Library

Now we know the directory path to where the Car data set is located.

We must now create a library.*/ 
​
/*This can be done using a Libname statement.*/ 

LIBNAME Proj1 "/home/u45131587";

/*Exercise

In our last exercise, we have saved the INCOME data set in the DS1 shared folder. 

Write a SAS program to copy the INCOME data set into the WORK library. */

Libname PROJ2 '/home/u45131587/DS1';

Data Income;
Set PROJ2.Income;
Run;

/*Exercise

Locate the CP951 data set in the SASHELP library. 

Save the CP951 data set into the home directory of the SAS server. */
Libname PROJ1 '/home/u45131587/';

Data PROJ1.CP951;
Set SASHelp.cp951;
Run;
 
 /*Export to Excel*/
Proc Export data=SASHelp.Electric 
OutFile='/home/u45131587/Electric.xlsx'
Replace
Dbms=xlsx;
Run;
