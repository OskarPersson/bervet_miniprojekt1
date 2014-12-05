% l�t anv�ndaren ange stad
city = input('Ange stad: ', 's');
% kolla s� att alla filer f�r staden existerar,
% om inte s� f�r anv�ndaren ange en ny stad till det
% att den angivna staden existerar
while ((exist([city, '_source.txt'], 'file') ~= 2) && (exist([city, '_graph.txt'], 'file') ~= 2) && (exist([city, '_coords.txt'], 'file') ~= 2))
    city = input('Ange stad: ', 's');
end

% h�mta matris och noder fr�n filerna
[A,nodes] = GenerateMatrix(city); 
% spara storleken f�r matrisen
[m,n] = size(A);
% skapa en kolonn-vektor med nollor
b = zeros([n,1]);

[L, U, P] = lu(A); %LU-faktorisering

answer = 'ja';
while strcmp(answer,'ja')
    % l�t anv�ndaren s�tta trycket i varje vattentorn
    for i = 1:size(nodes)
      value = input(['Ange trycket i vattentorn #', num2str(i), ': ']);
      b(nodes(i), 1) = value;
    end
    
    z = L\(P*b);
    x = U\z;
    
    medeltryck = mean(x);
    % r�kna ut standardavvikelsen f�r x
    standard = std(x);
    disp(['Medeltrycket �r ', num2str(medeltryck)]);
    disp(['Standardavvikelsen �r ', num2str(standard)]);
    % fr�ga om anv�ndaren vill se grafen p� resultaten
    willplot = input('Vill du se en graf p� resultaten? [ja/nej]: ', 's');
    if strcmp(willplot, 'ja') %visa plot
        plot(x); xlabel('Noder'); ylabel('Tryck');
    end
    % fr�ga om anv�ndaren vill testa med nya v�rden
    answer = input('Vill du testa med nya v�rden? [ja/nej]: ', 's');
end

