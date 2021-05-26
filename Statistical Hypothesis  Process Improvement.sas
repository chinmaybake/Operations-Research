/* An assembly operation in manufacturing plant requires a month
long training perdiod for a new employee to reach maximum efficiency. 
Two groups of nine employees are trained, one group with the new process 
and the other with the older one. The question we would like to answer is 
that does the data present sufficient evidence that mean time to assemble is
less with the new process? */


%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/folders/myfolders/sasuser.v94/Process.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

/* Null Hypothesis -> Average time to finish the assemble is same for both the processes
Alternative Hypothesis -> Average time for assembly with old process is greater than average 
time for assembly with the new process    Alpha (level of significance = 0.05)*/ 


PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);

PROC MEANS DATA=WORK.IMPORT;
   VAR Time;
   CLASS Procedure;
RUN;

/* Test Statistic - Two Sample t-test */ 

PROC TTEST DATA=WORK.IMPORT ALPHA=.05;
   VAR Time;
   CLASS Procedure;
RUN;

/* We were not able to reject the Null hypothesis as there is not enough evidence supporting the use of new 
procedure */ 