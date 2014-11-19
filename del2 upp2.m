city = input('Ange stad: ', 's');
%check that the files exists
while ((exist([city, '_source.txt'], 'file') ~= 2) && (exist([city, '_graph.txt'], 'file') ~= 2) && (exist([city, '_coords.txt'], 'file') ~= 2))
    city = input('Ange stad: ', 's');
end

[A,nodes] = GenerateMatrix(city); %get matrix from file
[m,n] = size(A); %get size
b = zeros([n,1]);%create a column-vector

%set the pressure in each water tower
for i = 1:size(nodes)
  value = input(['Ange trycket i vattentorn #', num2str(i), ': ']);
  b(nodes(i), 1) = value;
end

x = A\b;
medeltryck = mean(x);
disp(['Medeltrycket är ', num2str(medeltryck)]);
plot(x); xlabel('Noder'); ylabel('Tryck');