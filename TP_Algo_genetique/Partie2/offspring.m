function [Q] = offspring(P1,P2,i1,i2)
    
    Q=P1;
    for i=i1:i2
        x=Q(i); y=P2(i);
        j = (Q==y);
        Q(j)=x;
    end
    
    I=i1:i2;     % indices de la séquence de croisement
    Q(I)=P2(I);  % copie de la séquence de croisement de P2
    
end