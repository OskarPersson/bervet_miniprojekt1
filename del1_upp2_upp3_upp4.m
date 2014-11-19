%%%%% GAUSS %%%%%%

A = [ 1.0 0 0 0 0 0; 0.3 -1.3 0.5 0.5 0 0; 0 0.5 -1.6 0.6 0 0.5; 0 0.5 0.6 -1.6 0.5 0; 0 0 0 0 1.0 0; 0 0 0 0 0 1.0];
b = [10; 0; 0; 0; 0; 0;];
x = A\b;
medeltryck = mean(x);

disp('Gauss');
tic; %starta timern
while(medeltryck < 20)
    b(1,1) = b(1,1)+1;
    x = A\b;
    medeltryck = mean(x);
end
t1 = toc; %spara värdet på timern
disp(['Beräkningstiden blev ', num2str(t1)])

A = [ 1.0 0 0 0 0 0; 0.3 -1.3 0.5 0.5 0 0; 0 0.5 -1.6 0.6 0 0.5; 0 0.5 0.6 -1.6 0.5 0; 0 0 0 0 1.0 0; 0 0 0 0 0 1.0];
b = [10; 0; 0; 0; 0; 0;];
x = A\b;
medeltryck = mean(x);

%%%%% LU %%%%%%

disp('LU');
tic; %starta timern
[L, U, P] = lu(A); %LU-faktorisering
while(medeltryck < 20)
    b(1,1) = b(1,1)+1;
    z = L\(P*b);
    x = U\z;
    medeltryck = mean(x);
end

t1 = toc; %spara värdet på timern
disp(['Beräkningstiden blev ', num2str(t1)]);
disp('------------------------------------');
disp(['Medeltrycket blev ', num2str(medeltryck), ' när vattentrycket i vattentornet är ', num2str(b(1,1))]);

plot(x); xlabel('Noder'); ylabel('Tryck');