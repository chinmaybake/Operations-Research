
data normald (drop=x); 
do x=1 to 10 by 1;
    y=x+1;
    randnorm = rand('Normal',10,2);
    demand = (2*(randnorm+y))/5;
*keep demand;
output; 
end;
run;

proc sgplot data=normald; 
scatter x=y y=demand; 
run;


data simulate;
array k[50]
do x=1 to 1001 by 1;
	val = rand('Normal',10,2)*k[x/5];
keep val; 
output;
end;
run;

proc sgplot data=simulate; 
histogram val; 
run; 
	


