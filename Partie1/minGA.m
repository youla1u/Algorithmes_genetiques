close all
%--------------------------------------------------------------------------
% Recherche de minimum (global) d'une fonction d'une variable réelle par AG
%--------------------------------------------------------------------------
% Fonction à minimiser
a1=5e-7;
n1=256; n2=156;
fGA = @(x) a1 *(x.^4 /4 + (n2-n1)* x.^3 /3 - n1*n2 * x.^2/ 2 );

xmin=-280; xmax=390;
x= linspace(xmin,xmax,200);
y=fGA(x);
plot(x,y)
grid on

% Recherche de minimum local : prendre x0=-100, x0=0 puis x0=10;
x0 = 0;
[xm,fval] = fminunc(fGA,x0);
fprintf('Recherche locale de minimum avec MATLAB/fminunc (Newton)\n');
fprintf('x0=%g  xmin=%d  fmin=%g\n',x0,xm,fval);

%--------------------------------------------------------------------------
% Algorithme génétique
%--------------------------------------------------------------------------
% Nombre max d'iterations
itermax=30;

% Population initiale de m individus tirés aléatoirement dans l'intervalle [xmin,xmax]
m=20;     
PT=(xmax-xmin)*rand(1,m)+xmin;

% Evaluation initiale (fitness) 
FT = fGA(PT); 

hold on
plot(PT,FT,'or');
grid on
pause

bestPT=zeros(1,itermax); bestFT=zeros(1,itermax);
bestFT(1)=min(FT);
fprintf('Meilleur fitness initial: %g\n', bestFT(1));

%--------------------------------------------------------------------------
Tcross = 0.5;              % taux de croisement
Tmutation = 0.2;           % taux de mutation

nc = floor(Tcross*m/2);    % nombre de croisement (génération de 2*nc enfants)
p = 2*nc;                  % nombre d'individus à croiser = nb d'enfants
q = floor(Tmutation*p);    % nombre de mutation (parmi les p)
 
k=1; S=1;
while k<=itermax && S>1e-8
    
    fprintf('------------------------------------------------\n');
    fprintf('k=%d\n',k);    
    [bestFT(k),imin]=min(FT);
    bestPT(k)=PT(imin);
    fprintf('Meilleur fitness : x=%g  f=%g\n',bestPT(k),bestFT(k));
    
    clf();
    plot(x,y,'-b',PT,FT,'or');
    grid on
    title(sprintf('k=%d',k))
    pause(0.2)
    
    %----------------------------------------------------------------------
    % Croisement :
    %     Deux parents P1 et P2 donnent deux enfants Q1, Q2 obtenus par
    %     tirage au hasard dans l'intervalle entre P1 et P2.
    %----------------------------------------------------------------------
    % 1/ Sélection des p meilleurs individus (utiliser la fonction sort)
    Pselect=
    Fselect=

    % 2/ Choix aléatoire des croisements (nc croisements). La fonction
    % randperm de MATLAB permet de choisir aléatoirement des entiers tous
    % différents.
   
    ...  (A COMPLETER)

    % 3/ Population à croiser
    P1 =
    P2 = 
    
    % 4/ Croisements
    Q1=
    Q2=
    
    %----------------------------------------------------------------------
    % Mutation = un nombre choisi au hasard dans l'intervalle [xmin, xmax]
    %---------------------------------------------------------------------- 
    % 5/ Sélection aléatoire de q enfants parmi les p
   
    
    % 6/ Mutations des q enfants sélectionnés
    Poffspring=
    
    % Evaluation de la descendance et de l'intensité de sélection
    Foffspring=fGA(Poffspring);
    
    % Ajout des descendants (croisements et mutations) à la population 
    PT=[PT,Poffspring];     
    FTold=FT; 
    FT=[FTold,Foffspring];

    % Selection des m meilleurs individus
    PT=
    FT=
    
    S = abs((mean(FT)-mean(FTold))/mean(FT));
    fprintf('Variation de sélection S = %g\n',S);
    
    k=k+1;
end
