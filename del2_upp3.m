% låt användaren ange stad
city = input('Ange stad: ', 's');
% kolla så att alla filer för staden existerar,
% om inte så får användaren ange en ny stad till det
% att den angivna staden existerar
while ((exist([city, '_source.txt'], 'file') ~= 2) && (exist([city, '_graph.txt'], 'file') ~= 2) && (exist([city, '_coords.txt'], 'file') ~= 2))
    city = input('Ange stad: ', 's');
end

% hämta matris och noder från filerna
[A,nodes] = GenerateMatrix(city); 
% spara storleken för matrisen
[m,n] = size(A);
% skapa en kolonn-vektor med nollor
b = zeros([n,1]);

[L, U, P] = lu(A); %LU-faktorisering

answer = 'ja';
while strcmp(answer,'ja')
    % låt användaren sätta trycket i varje vattentorn
    for i = 1:size(nodes)
      value = input(['Ange trycket i vattentorn #', num2str(i), ': ']);
      b(nodes(i), 1) = value;
    end
    
    z = L\(P*b);
    x = U\z;
    
    medeltryck = mean(x);
    % räkna ut standardavvikelsen för x
    standard = std(x);
    disp(['Medeltrycket är ', num2str(medeltryck)]);
    disp(['Standardavvikelsen är ', num2str(standard)]);
    % fråga om användaren vill se grafen på resultaten
    willplot = input('Vill du se en graf på resultaten? [ja/nej]: ', 's');
    if strcmp(willplot, 'ja') %visa plot
        plot(x); xlabel('Noder'); ylabel('Tryck');
    end
    % fråga om användaren vill testa med nya värden
    answer = input('Vill du testa med nya värden? [ja/nej]: ', 's');
end

