city = input('Ange stad: ', 's');
%check that the files exists
while ((exist([city, '_source.txt'], 'file') ~= 2) && (exist([city, '_graph.txt'], 'file') ~= 2) && (exist([city, '_coords.txt'], 'file') ~= 2))
    city = input('Ange stad: ', 's');
end

[A,nodes] = GenerateMatrix(city); %get matrix from file
[m,n] = size(A); %get size
b = zeros([n,1]);%create a column-vector

[L, U, P] = lu(A); %LU-faktorisering

answer = 'ja';
while strcmp(answer,'ja')
    %set the pressure in each water tower
    for i = 1:size(nodes)
      value = input(['Ange trycket i vattentorn #', num2str(i), ': ']);
      b(nodes(i), 1) = value;
    end
    z = L\(P*b);
    x = U\z;
    medeltryck = mean(x);
    standard = std(x);
    disp(['Medeltrycket är ', num2str(medeltryck)]);
    disp(['Standardavvikelsen är ', num2str(standard)]);
    willplot = input('Vill du se en graf på resultaten? [ja/nej]: ', 's');
    if strcmp(willplot, 'ja')
        plot(x); xlabel('Noder'); ylabel('Tryck');
    end
    answer = input('Vill du testa med nya värden? [ja/nej]: ', 's');
end

