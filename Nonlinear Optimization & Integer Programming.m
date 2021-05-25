function ChinmayBake_Homework4 

A=[-0.21 -0.3 -0.08]; b=[-0.18]; Aeq=[1 1 1]; beq=[1]; lb=[0;0;0];ub=[inf;inf;inf];

x0=[0;0;0];

objfun= @(x)(0.25*x(1))^2+(0.45*x(2))^2+(0.05*x(3))^2+2*(0.04)*x(1)*x(2)+2*(-0.005)*x(1)*x(3)+2*(-0.01)*x(2)*x(3);

[x, Risk]=fmincon(objfun,x0,A,b,Aeq,beq,lb,ub)

end 