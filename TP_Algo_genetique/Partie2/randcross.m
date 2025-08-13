function [ind1,ind2]=randcross(n,nc)
    ind1=randperm(n,nc);
    ind2=zeros(1,nc);
    for k=1:nc
        itmp=randi(n);
        while itmp==ind1(k)
            itmp=randi(n);
        end
        ind2(k)=itmp;
    end
end