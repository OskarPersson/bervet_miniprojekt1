% använd GenerateMatrix.m för att hämta matrisen och
% noden för vattentornet

[A,nodes] = GenerateMatrix('lutorp');
b = [0; 0; 0; 0; 0; 0;];
% låt användaren ange trycket i vattentornet
b(1,1) = input('Ange trycket i vattentornet: ');
% lös x med gauss
x = A\b;
% plotta x
plot(x); xlabel('Noder'); ylabel('Tryck');