x=1;
% IMPORTATION DES FICHIERS
S1_B_eyes = readtable('Database\S1_B\eyes.csv');
S2_A_eyes = readtable('Database\S2_A\eyes.csv');
S2_B_eyes = readtable('Database\S2_B\eyes.csv');
S5_B_eyes = readtable('Database\S5_B\eyes.csv');
S7_A_eyes = readtable('Database\S7_A\eyes.csv');
S9_A_eyes = readtable('Database\S9_A\eyes.csv');
S9_B_eyes = readtable('Database\S9_B\eyes.csv');
S31_A_eyes = readtable('Database\S31_A\eyes.csv');
S33_B_eyes = readtable('Database\S33_B\eyes.csv');

S1_B_popups = readtable('Database\S1_B\popups.csv');
S2_A_popups = readtable('Database\S2_A\popups.csv');
S2_B_popups = readtable('Database\S2_B\popups.csv');
S5_B_popups = readtable('Database\S5_B\popups.csv');
S7_A_popups = readtable('Database\S7_A\popups.csv');
S9_A_popups = readtable('Database\S9_A\popups.csv');
S9_B_popups = readtable('Database\S9_B\popups.csv');
S31_A_popups = readtable('Database\S31_A\popups.csv');
S33_B_popups = readtable('Database\S33_B\popups.csv');

% DEFINITION DES COLONNES PUPILS DROITE ET GAUCHE 
leftPupil_S1_B= S1_B_eyes.leftPupil;
rightPupil_S1_B= S1_B_eyes.rightPupil;

leftPupil_S2_A= S2_A_eyes.leftPupil;
rightPupil_S2_A= S2_A_eyes.rightPupil;

leftPupil_S2_B= S2_B_eyes.leftPupil;
rightPupil_S2_B= S2_B_eyes.rightPupil;

leftPupil_S5_B= S5_B_eyes.leftPupil;
rightPupil_S5_B= S5_B_eyes.rightPupil;

leftPupil_S7_A= S7_A_eyes.leftPupil;
rightPupil_S7_A= S7_A_eyes.rightPupil;

leftPupil_S9_A= S9_A_eyes.leftPupil;
rightPupil_S9_A= S9_A_eyes.rightPupil;

leftPupil_S9_B= S9_B_eyes.leftPupil;
rightPupil_S9_B= S9_B_eyes.rightPupil;

leftPupil_S31_A= S31_A_eyes.leftPupil;
rightPupil_S31_A= S31_A_eyes.rightPupil;

leftPupil_S33_B= S33_B_eyes.leftPupil;
rightPupil_S33_B= S33_B_eyes.rightPupil;

% MOYENNE DE L'ELARGISSEMENT DES PUPILLES DROITE ET GAUCHE 
Pupil_S1_B=(leftPupil_S1_B+rightPupil_S1_B)/2;
Pupil_S2_A=(leftPupil_S2_A+rightPupil_S2_A)/2;
Pupil_S2_B=(leftPupil_S2_B+rightPupil_S2_B)/2;
Pupil_S5_B=(leftPupil_S5_B+rightPupil_S5_B)/2;
Pupil_S7_A=(leftPupil_S7_A+rightPupil_S7_A)/2;
Pupil_S9_A=(leftPupil_S9_A+rightPupil_S9_A)/2;
Pupil_S9_B=(leftPupil_S9_B+rightPupil_S9_B)/2;
Pupil_S31_A=(leftPupil_S31_A+rightPupil_S31_A)/2;
Pupil_S33_B=(leftPupil_S33_B+rightPupil_S33_B)/2;

% LES FICHIERS EYES.CSV NE SONT PAS TOUS DE MEME LONGUEUR POUR CHAQUE
% INDIVIDU
% ALORS ON RECUPERE LEUR TAILLE 
[a_S1_B,b_S1_B]=size(Pupil_S1_B);
[a_S2_A,b_S2_A]=size(Pupil_S2_A);
[a_S2_B,b_S2_B]=size(Pupil_S2_B);
[a_S5_B,b_S5_B]=size(Pupil_S5_B);
[a_S7_A,b_S7_A]=size(Pupil_S7_A);
[a_S9_A,b_S9_A]=size(Pupil_S9_A);
[a_S9_B,b_S9_B]=size(Pupil_S9_B);
[a_S31_A,b_S31_A]=size(Pupil_S31_A);
[a_S33_B,b_S33_B]=size(Pupil_S33_B);

% ENSUITE ON PREND LE MINIMUM DE LEUR TAILLE
[val,indice]=min([a_S1_B;a_S2_A;a_S2_B;a_S5_B;a_S7_A;a_S9_A;a_S9_B;a_S31_A;a_S33_B]);
% ON CREE UNE MATRICE TABLE AYANT POUR COLONNES LA MOYENNE DE
% L'ELARGISSEMENT DES PUPILLES POUR CHAQUE INDIVIDU
% ON LA ROGNE AVEC LE MINIMUM DES LONGUEURS DES VECTEURS 
table=[Pupil_S1_B(1:val),Pupil_S2_A(1:val),Pupil_S2_B(1:val),Pupil_S5_B(1:val),Pupil_S7_A(1:val),Pupil_S9_A(1:val),Pupil_S9_B(1:val),Pupil_S31_A(1:val),Pupil_S33_B(1:val)];

% *********************************************************
% S1_B
% *********************************************************
timestamp_S1_B_eyes=S1_B_eyes.LSLTimestamp;
answer_S1_B=S1_B_popups.Answer;
timestamp_S1_B_popups=S1_B_popups.LSLTimestamp;

% date_S1_B_eyes est le vecteur date de timestamp_S1_B_eyes en visible par l'homme 
[a,b]=size(timestamp_S1_B_eyes);
date_S1_B_eyes=[];
for j=1:a
    UTC_epoch_seconds=timestamp_S1_B_eyes(j:j);
    UTC_offset=UTC_epoch_seconds/(24*60*60);
    atomTime=UTC_offset+datenum(1970,1,1);
    date_value=datetime(atomTime,'ConvertFrom','datenum');
%     date_S1_B_eyes(end+1)=date_S1_B_eyes_value;
    date_S1_B_eyes=[date_S1_B_eyes; date_value];
end    
date_S1_B_eyes;
size(date_S1_B_eyes);

[ansx ansy]=size(answer_S1_B);
reponses_S1_B=zeros(a,1);
% ************************************************************
% on modifie le vecteur answer:
% la réponse à la question d'attention est valable pendant 5 minutes 
% =>> les vecteurs timestamp et answer sont de même longueur 
i=1;
k=1;
for j=1:a
    if k<=9
        if date_S1_B_eyes(j)<=date_S1_B_eyes(i)+minutes(5)
            reponses_S1_B(j)=answer_S1_B(k:k);
        elseif date_S1_B_eyes(j)>date_S1_B_eyes(i)+minutes(5)
            i=j;
            k=k+1;
            reponses_S1_B(j)=answer_S1_B(k:k);
        end 
     else
        reponses_S1_B(j)=answer_S1_B(k:k);
    end 
end 
% *********************************************************

% *********************************************************
% S2_A
% *********************************************************
timestamp_S2_A_eyes=S2_A_eyes.LSLTimestamp;
answer_S2_A=S2_A_popups.Answer;
timestamp_S2_A_popups=S2_A_popups.LSLTimestamp;

% ***********************************************
% date_S2_A_eyes est le vecteur date de timestamp_S2_A_eyes en visible par l'homme 
[a,b]=size(timestamp_S2_A_eyes);
date_S2_A_eyes=[];
for j=1:a
    UTC_epoch_seconds=timestamp_S2_A_eyes(j:j);
    UTC_offset=UTC_epoch_seconds/(24*60*60);
    atomTime=UTC_offset+datenum(1970,1,1);
    date_value=datetime(atomTime,'ConvertFrom','datenum');
%     date_S2_A_eyes(end+1)=date_S2_A_eyes_value;
    date_S2_A_eyes=[date_S2_A_eyes; date_value];
end    
date_S2_A_eyes;
size(date_S2_A_eyes);

[ansx ansy]=size(answer_S2_A);
reponses_S2_A=zeros(a,1);
% ************************************************************
% on modifie le vecteur answer:
% la réponse à la question d'attention est valable pendant 5 minutes 
% =>> les vecteurs timestamp et answer sont de même longueur 
i=1;
k=1;
for j=1:a
    if k<=9
        if date_S2_A_eyes(j)<=date_S2_A_eyes(i)+minutes(5)
            reponses_S2_A(j)=answer_S2_A(k:k);
        elseif date_S2_A_eyes(j)>date_S2_A_eyes(i)+minutes(5)
            i=j;
            k=k+1;
            reponses_S2_A(j)=answer_S2_A(k:k);
        end 
     else
        reponses_S2_A(j)=answer_S2_A(k:k);
    end 
end 

% *********************************************************
% S2_B
% *********************************************************
timestamp_S2_B_eyes=S2_B_eyes.LSLTimestamp;
answer_S2_B=S2_B_popups.Answer;
timestamp_S2_B_popups=S2_B_popups.LSLTimestamp;

% ***********************************************
% date_S2_B_eyes est le vecteur date de timestamp_S2_B_eyes en visible par l'homme 
[a,b]=size(timestamp_S2_B_eyes);
date_S2_B_eyes=[];
for j=1:a
    UTC_epoch_seconds=timestamp_S2_B_eyes(j:j);
    UTC_offset=UTC_epoch_seconds/(24*60*60);
    atomTime=UTC_offset+datenum(1970,1,1);
    date_value=datetime(atomTime,'ConvertFrom','datenum');
%     date_S2_B_eyes(end+1)=date_S2_B_eyes_value;
    date_S2_B_eyes=[date_S2_B_eyes; date_value];
end    
date_S2_B_eyes;
size(date_S2_B_eyes);

[ansx ansy]=size(answer_S2_B);
reponses_S2_B=zeros(a,1);
% ************************************************************
% on modifie le vecteur answer:
% la réponse à la question d'attention est valable pendant 5 minutes 
% =>> les vecteurs timestamp et answer sont de même longueur 
i=1;
k=1;
for j=1:a
    if k<=9
        if date_S2_B_eyes(j)<=date_S2_B_eyes(i)+minutes(5)
            reponses_S2_B(j)=answer_S2_B(k:k);
        elseif date_S2_B_eyes(j)>date_S2_B_eyes(i)+minutes(5)
            i=j;
            k=k+1;
            reponses_S2_B(j)=answer_S2_B(k:k);
        end 
     else
        reponses_S2_B(j)=answer_S2_B(k:k);
    end 
end 

% *********************************************************
% S5_B
% *********************************************************
timestamp_S5_B_eyes=S5_B_eyes.LSLTimestamp;
answer_S5_B=S5_B_popups.Answer;
timestamp_S5_B_popups=S5_B_popups.LSLTimestamp;

% ***********************************************
% date_S5_B_eyes est le vecteur date de timestamp_S5_B_eyes en visible par l'homme 
[a,b]=size(timestamp_S5_B_eyes);
date_S5_B_eyes=[];
for j=1:a
    UTC_epoch_seconds=timestamp_S5_B_eyes(j:j);
    UTC_offset=UTC_epoch_seconds/(24*60*60);
    atomTime=UTC_offset+datenum(1970,1,1);
    date_value=datetime(atomTime,'ConvertFrom','datenum');
%     date_S5_B_eyes(end+1)=date_S5_B_eyes_value;
    date_S5_B_eyes=[date_S5_B_eyes; date_value];
end    
date_S5_B_eyes;
size(date_S5_B_eyes);

[ansx ansy]=size(answer_S5_B);
reponses_S5_B=zeros(a,1);
% ************************************************************
% on modifie le vecteur answer:
% la réponse à la question d'attention est valable pendant 5 minutes 
% =>> les vecteurs timestamp et answer sont de même longueur 
i=1;
k=1;
for j=1:a
    if k<=9
        if date_S5_B_eyes(j)<=date_S5_B_eyes(i)+minutes(5)
            reponses_S5_B(j)=answer_S5_B(k:k);
        elseif date_S5_B_eyes(j)>date_S5_B_eyes(i)+minutes(5)
            i=j;
            k=k+1;
            reponses_S5_B(j)=answer_S5_B(k:k);
        end 
     else
        reponses_S5_B(j)=answer_S5_B(k:k);
    end 
end 

% *********************************************************
% S7_A
% *********************************************************
timestamp_S7_A_eyes=S7_A_eyes.LSLTimestamp;
answer_S7_A=S7_A_popups.Answer;
timestamp_S7_A_popups=S7_A_popups.LSLTimestamp;

% ***********************************************
% date_S7_A_eyes est le vecteur date de timestamp_S7_A_eyes en visible par l'homme 
[a,b]=size(timestamp_S7_A_eyes);
date_S7_A_eyes=[];
for j=1:a
    UTC_epoch_seconds=timestamp_S7_A_eyes(j:j);
    UTC_offset=UTC_epoch_seconds/(24*60*60);
    atomTime=UTC_offset+datenum(1970,1,1);
    date_value=datetime(atomTime,'ConvertFrom','datenum');
%     date_S7_A_eyes(end+1)=date_S7_A_eyes_value;
    date_S7_A_eyes=[date_S7_A_eyes; date_value];
end    
date_S7_A_eyes;
size(date_S7_A_eyes);

[ansx ansy]=size(answer_S7_A);
reponses_S7_A=zeros(a,1);
% ************************************************************
% on modifie le vecteur answer:
% la réponse à la question d'attention est valable pendant 5 minutes 
% =>> les vecteurs timestamp et answer sont de même longueur 
i=1;
k=1;
for j=1:a
    if k<=9
        if date_S7_A_eyes(j)<=date_S7_A_eyes(i)+minutes(5)
            reponses_S7_A(j)=answer_S7_A(k:k);
        elseif date_S7_A_eyes(j)>date_S7_A_eyes(i)+minutes(5)
            i=j;
            k=k+1;
            reponses_S7_A(j)=answer_S7_A(k:k);
        end 
     else
        reponses_S7_A(j)=answer_S7_A(k:k);
    end 
end 

% *********************************************************
% S9_A
% *********************************************************
timestamp_S9_A_eyes=S9_A_eyes.LSLTimestamp;
answer_S9_A=S9_A_popups.Answer;
timestamp_S9_A_popups=S9_A_popups.LSLTimestamp;

% ***********************************************
% date_S9_A_eyes est le vecteur date de timestamp_S9_A_eyes en visible par l'homme 
[a,b]=size(timestamp_S9_A_eyes);
date_S9_A_eyes=[];
for j=1:a
    UTC_epoch_seconds=timestamp_S9_A_eyes(j:j);
    UTC_offset=UTC_epoch_seconds/(24*60*60);
    atomTime=UTC_offset+datenum(1970,1,1);
    date_value=datetime(atomTime,'ConvertFrom','datenum');
%     date_S9_A_eyes(end+1)=date_S9_A_eyes_value;
    date_S9_A_eyes=[date_S9_A_eyes; date_value];
end    
date_S9_A_eyes;
size(date_S9_A_eyes);

[ansx ansy]=size(answer_S9_A);
reponses_S9_A=zeros(a,1);
% ************************************************************
% on modifie le vecteur answer:
% la réponse à la question d'attention est valable pendant 5 minutes 
% =>> les vecteurs timestamp et answer sont de même longueur 
i=1;
k=1;
for j=1:a
    if k<=9
        if date_S9_A_eyes(j)<=date_S9_A_eyes(i)+minutes(5)
            reponses_S9_A(j)=answer_S9_A(k:k);
        elseif date_S9_A_eyes(j)>date_S9_A_eyes(i)+minutes(5)
            i=j;
            k=k+1;
            reponses_S9_A(j)=answer_S9_A(k:k);
        end 
     else
        reponses_S9_A(j)=answer_S9_A(k:k);
    end 
end 

% *********************************************************
% S9_B
% *********************************************************
timestamp_S9_B_eyes=S9_B_eyes.LSLTimestamp;
answer_S9_B=S9_B_popups.Answer;
timestamp_S9_B_popups=S9_B_popups.LSLTimestamp;

% ***********************************************
% date_S9_B_eyes est le vecteur date de timestamp_S9_B_eyes en visible par l'homme 
[a,b]=size(timestamp_S9_B_eyes);
date_S9_B_eyes=[];
for j=1:a
    UTC_epoch_seconds=timestamp_S9_B_eyes(j:j);
    UTC_offset=UTC_epoch_seconds/(24*60*60);
    atomTime=UTC_offset+datenum(1970,1,1);
    date_value=datetime(atomTime,'ConvertFrom','datenum');
%     date_S9_B_eyes(end+1)=date_S9_B_eyes_value;
    date_S9_B_eyes=[date_S9_B_eyes; date_value];
end    
date_S9_B_eyes;
size(date_S9_B_eyes);

[ansx ansy]=size(answer_S9_B);
reponses_S9_B=zeros(a,1);
% ************************************************************
% on modifie le vecteur answer:
% la réponse à la question d'attention est valable pendant 5 minutes 
% =>> les vecteurs timestamp et answer sont de même longueur 
i=1;
k=1;
for j=1:a
    if k<=9
        if date_S9_B_eyes(j)<=date_S9_B_eyes(i)+minutes(5)
            reponses_S9_B(j)=answer_S9_B(k:k);
        elseif date_S9_B_eyes(j)>date_S9_B_eyes(i)+minutes(5)
            i=j;
            k=k+1;
            reponses_S9_B(j)=answer_S9_B(k:k);
        end 
     else
        reponses_S9_B(j)=answer_S9_B(k:k);
    end 
end 

% *********************************************************
% S31_A
% *********************************************************
timestamp_S31_A_eyes=S31_A_eyes.LSLTimestamp;
answer_S31_A=S31_A_popups.Answer;
timestamp_S31_A_popups=S31_A_popups.LSLTimestamp;

% ***********************************************
% date_S31_A_eyes est le vecteur date de timestamp_S31_A_eyes en visible par l'homme 
[a,b]=size(timestamp_S31_A_eyes);
date_S31_A_eyes=[];
for j=1:a
    UTC_epoch_seconds=timestamp_S31_A_eyes(j:j);
    UTC_offset=UTC_epoch_seconds/(24*60*60);
    atomTime=UTC_offset+datenum(1970,1,1);
    date_value=datetime(atomTime,'ConvertFrom','datenum');
%     date_S31_A_eyes(end+1)=date_S31_A_eyes_value;
    date_S31_A_eyes=[date_S31_A_eyes; date_value];
end    
date_S31_A_eyes;
size(date_S31_A_eyes);

[ansx ansy]=size(answer_S31_A);
reponses_S31_A=zeros(a,1);
% ************************************************************
% on modifie le vecteur answer:
% la réponse à la question d'attention est valable pendant 5 minutes 
% =>> les vecteurs timestamp et answer sont de même longueur 
i=1;
k=1;
for j=1:a
    if k<=9
        if date_S31_A_eyes(j)<=date_S31_A_eyes(i)+minutes(5)
            reponses_S31_A(j)=answer_S31_A(k:k);
        elseif date_S31_A_eyes(j)>date_S31_A_eyes(i)+minutes(5)
            i=j;
            k=k+1;
            reponses_S31_A(j)=answer_S31_A(k:k);
        end 
     else
        reponses_S31_A(j)=answer_S31_A(k:k);
    end 
end 

% *********************************************************
% S31_A
% *********************************************************
timestamp_S33_B_eyes=S33_B_eyes.LSLTimestamp;
answer_S33_B=S33_B_popups.Answer;
timestamp_S33_B_popups=S33_B_popups.LSLTimestamp;

% ***********************************************
% date_S33_B_eyes est le vecteur date de timestamp_S33_B_eyes en visible par l'homme 
[a,b]=size(timestamp_S33_B_eyes);
date_S33_B_eyes=[];
for j=1:a
    UTC_epoch_seconds=timestamp_S33_B_eyes(j:j);
    UTC_offset=UTC_epoch_seconds/(24*60*60);
    atomTime=UTC_offset+datenum(1970,1,1);
    date_value=datetime(atomTime,'ConvertFrom','datenum');
%     date_S33_B_eyes(end+1)=date_S33_B_eyes_value;
    date_S33_B_eyes=[date_S33_B_eyes; date_value];
end    
date_S33_B_eyes;
size(date_S33_B_eyes);

[ansx ansy]=size(answer_S33_B);
reponses_S33_B=zeros(a,1); 
% ************************************************************
% on modifie le vecteur answer:
% la réponse à la question d'attention est valable pendant 5 minutes 
% =>> les vecteurs timestamp et answer sont de même longueur 
i=1;
k=1;
for j=1:a
    if k<=9
        if date_S33_B_eyes(j)<=date_S33_B_eyes(i)+minutes(5)
            reponses_S33_B(j)=answer_S33_B(k:k);
        elseif date_S33_B_eyes(j)>date_S33_B_eyes(i)+minutes(5)
            i=j;
            k=k+1;
            reponses_S33_B(j)=answer_S33_B(k:k);
        end 
     else
        reponses_S33_B(j)=answer_S33_B(k:k);
    end 
end 

reponses=[reponses_S1_B(1:val),reponses_S2_A(1:val),reponses_S2_B(1:val),reponses_S5_B(1:val),reponses_S7_A(1:val),reponses_S9_A(1:val),reponses_S9_B(1:val),reponses_S31_A(1:val),reponses_S33_B(1:val)];

% ***********************************************************************************
% ETAPE 1 : CALCUL DES ECARTS TYPES 

[nb_lignes, nb_colonnes]=size(table);

s_table=zeros(1,nb_colonnes);
s_reponses=zeros(1,nb_colonnes);
mat_carre_table=zeros(nb_lignes,nb_colonnes);
vect_carre_table=zeros(1,nb_colonnes);
% s_table vecteur des ecarts types pour table et reponses
% mat_carre_table: matrice des valeurs réduites et au carré
% vect_carre_table vecteur somme des elements de mat_carre_table (par variable)
mat_carre_reponses=zeros(nb_lignes,nb_colonnes);
vect_carre_reponses=zeros(1,nb_colonnes);
% s_reponses vecteur des ecarts types pour reponses et reponses
% mat_carre_reponses: matrice des valeurs réduites et au carré
% vect_carre_reponses vecteur somme des elements de mat_carre_reponses (par variable)

for j=1:nb_colonnes
    for i=1:nb_lignes
        mat_carre_reponses(i,j)=(reponses(i,j)-mean(reponses(:,j)))^2;
        mat_carre_table(i,j)=(table(i,j)-mean(table(:,j)))^2;
    end
    vect_carre_table(1,j)=sum(mat_carre_table(:,j));
    s_table(1,j)=sqrt((1/nb_lignes)*vect_carre_table(1,j));
    vect_carre_reponses(1,j)=sum(mat_carre_reponses(:,j));
    s_reponses(1,j)=sqrt((1/nb_lignes)*vect_carre_reponses(1,j));
end

% ***********************************************************************************
% ETAPE 2 : MATRICE CENTREE ET REDUITE 

% vect_moy: vecteur Individu moyen avec les moyennes de chaque variable
X=table;
Y=reponses;
vect_moy_table=zeros(1,nb_colonnes);
vect_moy_reponses=zeros(1,nb_colonnes);
for j=1:nb_colonnes
        vect_moy_table(1,j)=sum(X(:,j))/nb_lignes;
        vect_moy_reponses(1,j)=sum(Y(:,j))/nb_lignes;
    for i=1:nb_lignes
        X(i,j)=(X(i,j)-vect_moy_table(1,j))/s_table(1,j);
        Y(i,j)=(Y(i,j)-vect_moy_reponses(1,j))/s_reponses(1,j);
    end 
end

% ***********************************************************************************
% ETAPE 3 : MATRICE DE VARIANCE COVARIANCE 
% la fonction dot(x,y) calcule le produit scalaire des vecteur x y 
C=zeros(nb_colonnes,nb_colonnes);
for j=1:nb_colonnes 
    for i=1:nb_colonnes
        C(i,j)=(1/nb_lignes)*dot(X(:,i),Y(:,j));
    end 
end 
% comme les données sont centrées réduites 
R=C;
% [V,D]=eig(R); % ici les vap seront dans l'ordre croissant 
% 
% val_propres=sort(diag(D),'descend'); % on cree le vecteur des vap dans l'ordre décroissant 
% D=diag(val_propres) % on change la matrice D avec les vap dans l'ordre décroissant 
% 
% % on intervertit les colonnes de telles sortes que les vecteurs propres
% % correspondent bien aux vap dans l'ordre décroissant
% V(:,[1,nb_colonnes])=V(:,[nb_colonnes,1])
% for i=1,nb_colonnes
%     V(:,[1+1,nb_colonnes-i])=V(:,[nb_colonnes-i,1+i]);
% end 
% % ATTENTION C EST BIZARRE PARCE QUE LE 1ER VECT PROPRE EST L'OPPOSE DE CELUI TROUVE EN
% % COURS DU COUP LA 1ERE CP EST L'OPPOSE DE CELLE TROUVEE EN COURS 
% CP=X*V
% CP1=CP(:,1)
% CP2=CP(:,2)
% 
% x=CP1;
% y=CP2;
% x_pourcent=D(1,1)/trace(D)*100
% y_pourcent=D(2,2)/trace(D)*100
% 
% subplot(2,1,1);
% hold on;
% plot(x,y,'+r');
% set(gca, 'XAxisLocation', 'origin')
% set(gca, 'YAxisLocation', 'origin')
% title(['Fonction affine avec points'])
% xlabel(['CP1=',num2str(round(x_pourcent,2)),'%'])
% ylabel(['CP2=',num2str(round(y_pourcent,2)),'%'])
% hold off;
% 
% subplot(2,1,2);
% [x,y,z] = cylinder(1,200);
% hold on;
% plot(x(1,:),y(1,:),'k')
% x_var1=1/(nb_lignes*sqrt(D(1,1)))*dot(X(:,1),CP1)
% y_var1=1/(nb_lignes*sqrt(D(1,1)))*dot(X(:,1),CP2)
% plot(x_var1,y_var1,'*r');
% set(gca, 'XAxisLocation', 'origin')
% set(gca, 'YAxisLocation', 'origin')
% axis equal
% title(['Représentation de la variable X1: Cercle des corélations '])
% xlabel(['r(X1,CP1)'])
% ylabel(['r(X1,CP2)'])
% hold off;

C



