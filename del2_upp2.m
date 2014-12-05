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

% låt användaren sätta trycket i varje vattentorn
for i = 1:size(nodes)
  value = input(['Ange trycket i vattentorn #', num2str(i), ': ']);
  b(nodes(i), 1) = value;
end

% räkna ut x med gauss
x = A\b;
% räkna ut och skriv ut medeltrycket på x
medeltryck = mean(x);
disp(['Medeltrycket är ', num2str(medeltryck)]);
% plotta x
plot(x); xlabel('Noder'); ylabel('Tryck');