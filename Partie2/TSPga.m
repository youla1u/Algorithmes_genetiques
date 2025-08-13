%--------------------------------------------------------------------------
% Algorithme genetique pour le TSP
%--------------------------------------------------------------------------
% Données : D matrice des distances
%           N nombre de villes

D=data1D(); N=size(D,1);

% Nombre max d'iterations
itermax=10;

% Population initiale aléatoire de m individus
m=5;        % attention doit etre plus petit que (N-1)!
[PT,FT] = initpopulation(D,m,N);

fprintf('Meilleur fitness initial: %g\n', min(FT));

%--------------------------------------------------------------------------
Tcross = 0.5;              % taux de croisement
Tmutation = 0.2;           % taux de mutation

nc = floor(Tcross*m/2);    % nombre de croisement (génération de 2*nc enfants)
if nc==0, nc=1; end        % au moins un croisement
p = 2*nc;                  % nombre d'individus à croiser = nb d'enfants
q = floor(Tmutation*p);    % nombre de mutation (parmi les p)
if q==0, q=1; end          % au moins une mutation

k=1;
while k<=itermax
    %----------------------------------------------------------------------
    % Croisement : Deux parents P1,P2 donnent deux enfants Q1,Q2 par
    %              croisement PMX (fonction offspring)
    %----------------------------------------------------------------------

    % Sélection d'une population des p individus (selon le meilleur
    % fitness)
    
    ...  (A COMPLETER)
    
    % Choix aléatoire des croisements (nc croisements) et individus P1,P2
    % à croiser
    [indp1,indp2]=randcross(p,nc); 
    P1 = Pselect(indp1,:); P2 = Pselect(indp2,:);
    
    % Croisements
    Q1=P1; Q2=P2;
    for i=1:nc
        % Détermination aléatoires des indices des séquences croisées
        I=randi([2,N-1],2,1);
        i1=min(I); i2=max(I); 
        % Descendance (croisement PMX)
        Q1(i,:) = offspring(P1(i,:),P2(i,:),i1,i2);
        Q2(i,:) = offspring(P2(i,:),P1(i,:),i1,i2);
    end
        
    %----------------------------------------------------------------------
    % Mutation : permutation de 2 caractères choisis au hasard dans les
    %            individus à muter
    %----------------------------------------------------------------------
    % Sélection aléatoire de q enfants parmi les p
    indselect=randperm(p,q);
    Poffspring=[Q1;Q2];
    Pmutation=Poffspring(indselect,:);
    
    % Mutations de la descendance
    for i=1:q
        % Mutation de l'individu Pmutation(i,:) = permutation aléatoire de
        % deux positions dans le tableau Pmutation(i,:)
        
        ...  (A COMPLETER)
            
    end
    
    %----------------------------------------------------------------------
    % Ajout des descendants (croisements, mutations) à la population 
    %----------------------------------------------------------------------
    PT=[PT;Pmutation;Q1;Q2]; 
    
    % Calcul du fitness de la descendance 
    FD = fitness([Pmutation;Q1;Q2],D);
    FT=[FT;FD];
    
    % Selection des m meilleurs individus
     
    ...  (A COMPLETER)
         
    fprintf('k=%d  meilleur fitness après croisements/mutations : %g\n', k,min(FT));
        
    k=k+1;
end
