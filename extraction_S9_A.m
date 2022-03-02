S9_A_eyes = readtable('Database\S9_A\eyes.csv');
S9_A_popups = readtable('Database\S9_A\popups.csv');

leftPupil_S9_A= S9_A_eyes.leftPupil;
rightPupil_S9_A= S9_A_eyes.rightPupil;
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
reponses=zeros(a,1);


% ************************************************************
% on modifie le vecteur answer:
% la réponse à la question d'attention est valable pendant 5 minutes 
% =>> les vecteurs timestamp et answer sont de même longueur 
i=1;
k=1
for j=1:a
    if k<=9
        if date_S9_A_eyes(j)<=date_S9_A_eyes(i)+minutes(5)
            reponses(j)=answer_S9_A(k:k);
        elseif date_S9_A_eyes(j)>date_S9_A_eyes(i)+minutes(5)
            i=j;
            k=k+1;
            reponses(j)=answer_S9_A(k:k);
        end 
     else
        reponses(j)=answer_S9_A(k:k);
    end 
end 

x=(leftPupil_S9_A+rightPupil_S9_A)/2
% hold on 
plot(x,reponses,'+r');
set(gca, 'XAxisLocation', 'origin')
set(gca, 'YAxisLocation', 'origin')
title(["Attention subjective en fonction de la moyenne d'élargissement des pupilles"])
xlabel(["Moyenne d'élargissement des pupilles"])
ylabel(["Attention subjective"])