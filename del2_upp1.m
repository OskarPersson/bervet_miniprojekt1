% anv�nd GenerateMatrix.m f�r att h�mta matrisen och
% noden f�r vattentornet

[A,nodes] = GenerateMatrix('lutorp');
b = [0; 0; 0; 0; 0; 0;];
% l�t anv�ndaren ange trycket i vattentornet
b(1,1) = input('Ange trycket i vattentornet: ');
% l�s x med gauss
x = A\b;
% plotta x
plot(x); xlabel('Noder'); ylabel('Tryck');