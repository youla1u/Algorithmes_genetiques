alpha = 5e-7;
n1 = 256;
n2 = 156;
f = @(x) alpha*((x^4)/4 + (n2-n1)*x^3/3 - n1*n2*x^2/2); 
for i=1:6
    x0 = i;
    [x,fval] = fminunc(f,x0);
    disp('Le minima de la fonction f est :')
    x
end