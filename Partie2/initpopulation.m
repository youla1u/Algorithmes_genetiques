function [PT,FT] = initpopulation(D,nT,N)
    % 
    % Détermination de la population initiale PT constituée de nT individus
    % (individu=tournée=une permutation de {1,...,N}).
    % FT contient la performance (fitness) de chaque individu
    %
    if nT > factorial(N-1)
        fprintf('Attention nombre de tournées initiales plus grand que le nb de possibilité !\n');
        return
    end

    PT = zeros(nT,N);
    for k=1:nT
        Pnew = [0, randperm(N-1)]+1;
        exist=true;
        while exist
            Pnew = [0, randperm(N-1)]+1;
            test = any(PT(1:k,:)~=Pnew,2);
            if test
                exist=false;
            end
        end    
        PT(k,:)=Pnew; 
    end

    % Calcul des distances initiales(fitness) 
    FT = fitness(PT,D); 

return
