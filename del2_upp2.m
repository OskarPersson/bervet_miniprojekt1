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

% l�t anv�ndaren s�tta trycket i varje vattentorn
for i = 1:size(nodes)
  value = input(['Ange trycket i vattentorn #', num2str(i), ': ']);
  b(nodes(i), 1) = value;
end

% r�kna ut x med gauss
x = A\b;
% r�kna ut och skriv ut medeltrycket p� x
medeltryck = mean(x);
disp(['Medeltrycket �r ', num2str(medeltryck)]);
% plotta x
plot(x); xlabel('Noder'); ylabel('Tryck');