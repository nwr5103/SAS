/*Credit Risk Case Study
A bank sought to use performance on an in-house subprime credit product to create an updated risk model. The risk model was to be combined with other factors to make future credit decisions.
A sample of applicants for the original credit product was selected. Credit bureau data describing these individuals (at the time of application) was recorded. The ultimate disposition of the loan was determined (paid off or bad debt). For loans rejected at the time of application, a disposition was inferred from credit bureau records on loans obtained in a similar time frame.
The credit scoring models pursued in this case study were required to conform to the standard industry practice of transparency and interpretability. This eliminated certain modeling tools from consideration (for example, neural networks) except for comparison purposes. If a neural network significantly outperformed a regression, for example, it could be interpreted as a sign of lack of fit for the regression. Measures could then be taken to improve the regression model.
*/


LIBNAME PROJECTS "/home/u45131587/PROJECT";
/*FIRST STEP IS TO IMPORT AND REMOVE THE ID VARIABLE*/
/*importing demo data*/
proc import datafile="/home/u45131587/PROJECT/credit.csv"
       OUT=PROJECTS.CREDIT
        dbms=csv
        replace;


/*REMOVING ID VARIABLE*/
DATA target.credit(DROP = ID); 
SET PROJECTS.CREDIT;
RUN;

/*STEP 2;You to do a quality check. Please print out 
the histogram for each variable (C)(O).*/
libname  target '/home/u45131587/PROJECT'; /*you need to create your own library */
/*HISTOGRAM FOR CollectCnt*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram CollectCnt; /*Please replace the variable name here*/
   title 'histogram for CollectCnt';
run;
/*HISTOGRAM FOR TLOpenPct*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram TLOpenPct; /*Please replace the variable name here*/
   title 'histogram for TLOpenPct';
run;
/*HISTOGRAM FOR DerogCnt*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram DerogCnt; /*Please replace the variable name here*/
   title 'histogram for DerogCnt';
run;
/*HISTOGRAM FOR InqCnt06*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram InqCnt06; /*Please replace the variable name here*/
   title 'histogram for InqCnt06';
run;
/*HISTOGRAM FOR InqFinanceCnt24*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram InqFinanceCnt24; /*Please replace the variable name here*/
   title 'histogram for InqFinanceCnt24';
run;
/*HISTOGRAM FOR InqTimeLast*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram InqTimeLast; /*Please replace the variable name here*/
   title 'histogram for InqTimeLast';
run;
/*HISTOGRAM FOR TL50UtilCnt*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram TL50UtilCnt; /*Please replace the variable name here*/
   title 'histogram for TL50UtilCnt';
run;
/*HISTOGRAM FOR TL75UtilCnt*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram TL75UtilCnt; /*Please replace the variable name here*/
   title 'histogram for TL75UtilCnt';
run;
/*HISTOGRAM FOR TLBadCnt24*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram TLBadCnt24; /*Please replace the variable name here*/
   title 'histogram for TLBadCnt24';
run;
/*HISTOGRAM FOR TLBadDerogCnt*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram TLBadDerogCnt; /*Please replace the variable name here*/
   title 'histogram for TLBadDerogCnt';
run;
/*HISTOGRAM FOR TLBalHCPct*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram TLBalHCPct; /*Please replace the variable name here*/
   title 'histogram for TLBalHCPct';
run;
/*HISTOGRAM FOR TLCnt*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram TLCnt; /*Please replace the variable name here*/
   title 'histogram for TLCnt';
run;
/*HISTOGRAM FOR TLCnt03*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram TLCnt03; /*Please replace the variable name here*/
   title 'histogram for TLCnt03';
run;

/*HISTOGRAM FOR TLCnt12*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram TLCnt12; /*Please replace the variable name here*/
   title 'histogram for TLCnt12';
run;
/*HISTOGRAM FOR TLCnt24*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram TLCnt24; /*Please replace the variable name here*/
   title 'histogram for TLCnt24';
run;
/*HISTOGRAM FOR TLDel3060Cnt24*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram TLDel3060Cnt24; /*Please replace the variable name here*/
   title 'histogram for TLDel3060Cnt24';
run;
/*HISTOGRAM FOR TLDel60Cnt*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram TLDel60Cnt; /*Please replace the variable name here*/
   title 'histogram for TLDel60Cnt';
run;
/*HISTOGRAM FOR TLDel60Cnt24*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram TLDel60Cnt24; /*Please replace the variable name here*/
   title 'histogram for TLDel60Cnt24';
run;
/*HISTOGRAM FOR TLDel60CntAll*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram 	TLDel60CntAll; /*Please replace the variable name here*/
   title 'histogram for TLDel60CntAll';
run;
/*HISTOGRAM FOR TLDel90Cnt24*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram 	TLDel90Cnt24; /*Please replace the variable name here*/
   title 'histogram for TLDel90Cnt24';
run;
/*HISTOGRAM FOR TLMaxSum*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram 	TLMaxSum; /*Please replace the variable name here*/
   title 'histogram for TLMaxSum';
run;
/*HISTOGRAM FOR TLOpenPct*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram 	TLOpenPct; /*Please replace the variable name here*/
   title 'histogram for TLOpenPct';
run;
/*HISTOGRAM FOR TLSatCnt*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram  TLSatCnt; /*Please replace the variable name here*/
   title 'histogram for TLSatCnt';
run;
/*HISTOGRAM FOR TLSatPct*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram  TLSatPct; /*Please replace the variable name here*/
   title 'histogram for TLSatPct';
run;
/*HISTOGRAM FOR TLSum*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram  TLSum; /*Please replace the variable name here*/
   title 'histogram for TLSum';
run;
/*HISTOGRAM FOR TLTimeFirst*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram  TLTimeFirst; /*Please replace the variable name here*/
   title 'histogram for TLTimeFirst';
run;
/*HISTOGRAM FOR TLTimeLast*/
goptions reset=global
         gunit=pct
         hsize= 10.625 in
         vsize= 8.5 in
         htitle=4
         htext=3
         vorigin=0 in
         horigin= 0 in
         cback=white border
         ctext=black 
         colors=(black blue green red yellow)
         ftext=swiss
         lfactor=3;
proc univariate data=target.credit noprint;
   histogram  	TLTimeLast; /*Please replace the variable name here*/
   title 'histogram for 	TLTimeLast';
run;




/*The sas code for checking the extreme and missing values is below. */
ODS SELECT EXTREMEVALUES; 

PROC UNIVARIATE Data=target.credit NEXTRVAL=10; 
VAR TLTimeFirst; /*Please replace the variable name here*/
RUN; 

proc means data=target.credit mean; run;



/*ADD MISSING VAR COLUMN TO FIND MISSING Values*/
PROC MEANS DATA=target.credit MEAN NMISS;
VAR InqTimeLast TLCnt TLSum
 TLSatCnt TL75UtilCnt TL50UtilCnt 
 TLBalHCPct TLSatPct TLMaxSum TLOpenPct  TLOpen24Pct;
RUN;


DATA target.credit;
	SET target.credit;
	IF InqTimeLast = '' THEN InqTimeLast_MISSING=1;
	ELSE InqTimeLast_MISSING=0;
	IF TLCnt = '' THEN TLCnt_MISSING=1;
	ELSE TLCnt_MISSING=0;
	IF TLSum = '' THEN TLSum_MISSING=1;
	ELSE TLSum_MISSING=0;
	IF TLSatCnt = '' THEN TLSatCnt_MISSING=1;
	ELSE TLSatCnt_MISSING=0;
	IF TL75UtilCnt = '' THEN TL75UtilCnt_MISSING=1;
	ELSE L75UtilCnt_MISSING=0;
	IF TL50UtilCnt = '' THEN TL50UtilCnt_MISSING=1;
	ELSE TL50UtilCnt_MISSING=0;
	IF  TLBalHCPct = '' THEN  TLBalHCPct_MISSING=1;
	ELSE TLBalHCPct_MISSING=0;
		IF  TLSatPct = '' THEN  TLSatPct_MISSING=1;
		ELSE TLSatPct_MISSING=0;
		IF  TLMaxSum = '' THEN  TLMaxSum_MISSING=1;
		ELSE TLMaxSum_MISSING=0;
		IF  TLOpenPct = '' THEN  TLOpenPct_MISSING=1;
		ELSE TLOpenPct_MISSING=0;
		IF  TLOpen24Pct = '' THEN  TLOpen24Pct_MISSING=1;
		ELSE TLOpen24Pct_MISSING=0;
RUN; 

DATA target.credit;
	SET target.credit;
	IF InqTimeLast_MISSING=1 THEN InqTimeLast = 3.1081081;
	IF TLCnt_MISSING = 1 THEN TLCnt=7.8795462;
	IF TLSum_MISSING = 1 THEN TLSum=20151.1;
	IF TLSatCnt_MISSING = 1 THEN TLSatCnt=13.5116822;
	
	IF TL75UtilCnt_MISSING = 1 THEN TL75UtilCnt=3.1216822;
	IF TL50UtilCnt_MISSING = 1 THEN TL50UtilCnt=4.0779042;
	IF  TLBalHCPct_MISSING = 1 THEN  TLBalHCPct=0.6482224;
	IF  TLSatPct_MISSING = 1 THEN  TLSatPct=0.5185648;
	IF  TLMaxSum_MISSING = 1 THEN  TLMaxSum=31205.9;
	IF  TLOpenPct_MISSING = 1 THEN  TLOpenPct=0.4962863;
	IF  TLOpen24Pct_MISSING = 1 THEN  TLOpen24Pct_MISSING=0.5643277;
	
RUN;
/*REMOVING missing  VARIABLE column*/
DATA target.credit(DROP = InqTimeLast_MISSING TLCnt_MISSING TLSum_MISSING 
TLSatCnt_MISSING TL75UtilCnt_MISSING
TL50UtilCnt_MISSING TLBalHCPct_MISSING 
TLSatPct_MISSING TLMaxSum_MISSING  TLOpenPct_MISSING 
TLOpen24Pct_MISSING); 
SET target.credit;
RUN;



/* randomly select 60% of the data for training and 40% for validation*/
data target.training target.validation;
set target.credit;RND = ranuni(20041206);if (RND <= .60) then output target.training;
else ouput target.validation;
run;

/*stepwise method for variable selection based on logistic regression*/
title 'Stepwise method for variable selection based on logistic regression ';
proc logistic data=target.training outest=betas covout;
   model target (event='1')= 	BanruptcyInd CollectCnt DerogCnt InqCnt06 InqFinanceCnt24 InqTimeLast
   TL50UtilCnt TL75UtilCnt TLBadCnt24 TLBadDerogCnt TLBalHCPct TLCnt TLCnt03 
   TLCnt12 TLCnt24 TLDel3060Cnt24 TLDel60Cnt TLDel60Cnt24 TLDel60CntAll 
   TLDel90Cnt24 TLMaxSum TLOpen24Pct TLOpenPct TLSatCnt TLSatPct TLSum  TLTimeFirst TLTimeLast
                / selection=stepwise
                  slentry=0.3
                  slstay=0.35
                  details
                  lackfit;
   output out=pred p=phat lower=lcl upper=ucl
          predprob=(individual crossvalidate);
   ods output Association=Association;
run;

proc print data=target.training;
run;
proc print data=target.validation;
run;
/* exexport your sas dataset using the following code*/
proc export data=target.training
   outfile='/home/u45131587/PROJECT/training.csv'/*you need to specify the output file name here*/
   dbms=csv replace; 
run;

proc export data=target.validation
   outfile='/home/u45131587/PROJECT/validation.csv'/*you need to specify the output file name here*/
   dbms=csv replace; 
run;

/* using log1px -log(x+1) function to transform skewed variables*/
data target.logcredit;
   set target.credit ;
   logCollectCnt=log1px(CollectCnt);
   logDerogCnt=log1px(DerogCnt);
   logInqCnt06=log1px(InqCnt06);
   logInqFinanceCnt24=log1px(InqFinanceCnt24);
   logInqTimeLast=log1px(InqTimeLast);
   logTL50UtilCnt=log1px(TL50UtilCnt);
   logTL75UtilCnt=log1px(TL75UtilCnt);
   logTLBadCnt24=log1px(TLBadCnt24);
   logTLBadDerogCnt=log1px(TLBadDerogCnt);
   logTLBalHCPct=log1px(TLBalHCPct);
   logTLCnt=log1px(TLCnt);
    logTLCnt03=log1px(TLCnt03);
     logTLCnt12=log1px(TLCnt12);
      logTLCnt24=log1px(TLCnt24);
       logTLDel3060Cnt24=log1px(TLDel3060Cnt24);
  logTLDel60Cnt = log1px(TLDel60Cnt);
 logTLDel60Cnt24 = log1px(TLDel60Cnt24);
 logTLDel60CntAll = log1px(TLDel60CntAll);
 logTLDel90Cnt24 = log1px(TLDel90Cnt24);
 logTLMaxSum = log1px(TLMaxSum);
 logTLOpen24Pct = log1px(TLOpen24Pct);
 logTLSatCnt = log1px(TLSatCnt);
  logTLSum = log1px(TLSum);
  logTLTimeLast = log1px(TLTimeLast);
   run;
   
/*REMOVING missing  VARIABLE column*/
DATA target.logcredit(DROP = CollectCnt DerogCnt InqCnt06 InqFinanceCnt24 InqTimeLast 
TL50UtilCnt TL75UtilCnt TLBadCnt24 TLBadDerogCnt TLBalHCPct TLCnt TLCnt03 TLCnt12 
TLCnt24 TLDel3060Cnt24 TLDel60Cnt TLDel60Cnt24 TLDel60CntAll TLDel90Cnt24 TLMaxSum
TLOpen24Pct TLSatCnt TLTimeLast); 
SET target.logcredit;
RUN;   
   
 /* randomly select 60% of the data for training and 40% for validation*/
data target.training_a target.validation_a;
set target.logcredit;RND = ranuni(20041206);if (RND <= .60) then output target.training_a;
else ouput target.validation_a;
run;   
proc logistic data=target.training_a outest=betas covout;
   model target (event='1')= 	BanruptcyInd logCollectCnt logDerogCnt logInqCnt06 
   logInqFinanceCnt24 logInqTimeLast logTL50UtilCnt logTL75UtilCnt logTLBadCnt24 
   logTLBadDerogCnt logTLBalHCPct logTLCnt logTLCnt03 logTLCnt12 logTLCnt24
   logTLDel3060Cnt24 logTLDel60Cnt logTLDel60Cnt24 logTLDel60CntAll logTLDel90Cnt24
   logTLMaxSum logTLOpen24Pct TLOpenPct logTLSatCnt  logTLSum 
   TLTimeFirst logTLTimeLast
                / selection=stepwise
                  slentry=0.3
                  slstay=0.35;
       run;
/* export your sas dataset using the following code*/
proc export data=target.training_a
   outfile='/home/u45131587/PROJECT/training_a.csv'/*you need to specify the output file name here*/
   dbms=csv replace; 
run;

proc export data=target.validation_a
   outfile='/home/u45131587/PROJECT/validation_a.csv'/*you need to specify the output file name here*/
   dbms=csv replace; 
run;