function [PT,FT] = initpopulation(D,nT,N)
    % 
    % Détermination de la population initiale PT constituée de nT individus
    % (individu=tournée=une permutation de {1,...,N}).
    % FT contient la performance (fitness) de chaque individu
    %
    if nT > factorial(N-1)
        fprintf('Attention nombre de tournées initiales plus grand que le nb de possibilités !\n');
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
