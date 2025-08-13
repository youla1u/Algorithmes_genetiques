function [PT,FT] = initpopulation(D,nT,N)
    % 
    % D�termination de la population initiale PT constitu�e de nT individus
    % (individu=tourn�e=une permutation de {1,...,N}).
    % FT contient la performance (fitness) de chaque individu
    %
    if nT > factorial(N-1)
        fprintf('Attention nombre de tourn�es initiales plus grand que le nb de possibilit�s !\n');
        return
    end

    PT = zeros(nT,N);
    for k=1:nT
        Pnew = [0, randperm(N-1)]+1;
        exist=true;
        while exist
            Pnew = [0, randperm(N-1)]+1;
            A = zeros(k,N);
            for i=1:k
                A(i,:) = PT(i,:)~=Pnew;
            end
            test = any(A,2);
            if test
                exist=false;
            end
        end    
        PT(k,:)=Pnew; 
    end

    % Calcul des distances initiales(fitness) 
    FT = fitness(PT,D); 

return
