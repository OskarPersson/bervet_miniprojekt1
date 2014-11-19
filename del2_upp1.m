[A,nodes] = GenerateMatrix('lutorp');
b = [0; 0; 0; 0; 0; 0;];
b(1,1) = input('Ange trycket i vattentornet: ');
x = A\b;
plot(x); xlabel('Noder'); ylabel('Tryck');