%%%%% GAUSS %%%%%%

% skapa matrisen för lutorp
A = [ 1.0 0 0 0 0 0; 0.3 -1.3 0.5 0.5 0 0; 0 0.5 -1.6 0.6 0 0.5; 0 0.5 0.6 -1.6 0.5 0; 0 0 0 0 1.0 0; 0 0 0 0 0 1.0];
b = [10; 0; 0; 0; 0; 0;];

% räkna ut x när trycket i vattenreservoaren är 10
x = A\b;
% räkna ut medelvärdet på x
medeltryck = mean(x);

disp('Gauss');
% starta timern
tic;
% gör om gauss till det att medeltrycket är minst 20
while(medeltryck < 20)
    b(1,1) = b(1,1)+1;
    x = A\b;
    medeltryck = mean(x);
end
% stoppa och spara värdet på timern
t1 = toc;
% skriv ut tiden det tog att göra alla beräkningarna
disp(['Beräkningstiden blev ', num2str(t1)]) 

%%%%% LU %%%%%%

% återställ b till startvärderna
b = [10; 0; 0; 0; 0; 0;];
% gör första beräkningen med gauss
x = A\b;
% räkna ut medeltrycket på x
medeltryck = mean(x);

disp('LU');
% starta timern
tic;
% Använd LU-faktorisering för att räkna ut medeltrycket
% till det att medeltrycket är minst 20
[L, U, P] = lu(A);
while(medeltryck < 20)
    b(1,1) = b(1,1)+1;
    z = L\(P*b);
    x = U\z;
    medeltryck = mean(x);
end
% stoppa och spara värdet på timern
t1 = toc;
% skriv ut tiden det tog att göra alla beräkningarna
disp(['Beräkningstiden blev ', num2str(t1)]);
disp('------------------------------------');
% skriv ut vad trycket i vattentornet behövde vara
% för att medeltrycket skulle bli större än 20
disp(['Medeltrycket blev ', num2str(medeltryck), ' när vattentrycket i vattentornet är ', num2str(b(1,1))]);

% plotta x
plot(x); xlabel('Noder'); ylabel('Tryck');