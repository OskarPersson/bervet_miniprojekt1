%%%%% GAUSS %%%%%%

% skapa matrisen f�r lutorp
A = [ 1.0 0 0 0 0 0; 0.3 -1.3 0.5 0.5 0 0; 0 0.5 -1.6 0.6 0 0.5; 0 0.5 0.6 -1.6 0.5 0; 0 0 0 0 1.0 0; 0 0 0 0 0 1.0];
b = [10; 0; 0; 0; 0; 0;];

% r�kna ut x n�r trycket i vattenreservoaren �r 10
x = A\b;
% r�kna ut medelv�rdet p� x
medeltryck = mean(x);

disp('Gauss');
% starta timern
tic;
% g�r om gauss till det att medeltrycket �r minst 20
while(medeltryck < 20)
    b(1,1) = b(1,1)+1;
    x = A\b;
    medeltryck = mean(x);
end
% stoppa och spara v�rdet p� timern
t1 = toc;
% skriv ut tiden det tog att g�ra alla ber�kningarna
disp(['Ber�kningstiden blev ', num2str(t1)]) 

%%%%% LU %%%%%%

% �terst�ll b till startv�rderna
b = [10; 0; 0; 0; 0; 0;];
% g�r f�rsta ber�kningen med gauss
x = A\b;
% r�kna ut medeltrycket p� x
medeltryck = mean(x);

disp('LU');
% starta timern
tic;
% Anv�nd LU-faktorisering f�r att r�kna ut medeltrycket
% till det att medeltrycket �r minst 20
[L, U, P] = lu(A);
while(medeltryck < 20)
    b(1,1) = b(1,1)+1;
    z = L\(P*b);
    x = U\z;
    medeltryck = mean(x);
end
% stoppa och spara v�rdet p� timern
t1 = toc;
% skriv ut tiden det tog att g�ra alla ber�kningarna
disp(['Ber�kningstiden blev ', num2str(t1)]);
disp('------------------------------------');
% skriv ut vad trycket i vattentornet beh�vde vara
% f�r att medeltrycket skulle bli st�rre �n 20
disp(['Medeltrycket blev ', num2str(medeltryck), ' n�r vattentrycket i vattentornet �r ', num2str(b(1,1))]);

% plotta x
plot(x); xlabel('Noder'); ylabel('Tryck');