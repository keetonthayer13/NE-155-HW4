%HW04 Q04

%we will be constructing a tridiagonal matrix, and then solving it using
%several different methods...

n = 100;

A = zeros(100,100);

A(1,1:2) = [2 -1]; A(end,end-1:end) = [-1 2];
b = zeros(100,1); b(1) = 0; b(100) = n-1;

for j = 1:n-2
    A(j+1,j:j+2) = [-1 2 -1];
    b(j+1) = j;
end

%now that we have constructed our matrix ,A, and vector ,b, lets solve it
%in several ways...

%first, the condition number is the norm of A times the norm of A^-1, here
%we will use the two norm

ConditionNumber = norm(A,2)*norm(inv(A),2)

%now we will solve by explicitely inverting A and multiplying by b...

xInverse = inv(A)*b;

%now we will solve using the backslash operator...

xBackslash = A\b;

%now we will plot both solution techniques on the same graph to see if they
%differ...
hold on
scatter(xInverse,b,'ro')
plot(xBackslash,b,'k','LineWidth',2)
legend('Explicit Inverse','Backslash Operator')
title...
    ('Tridiagonal System: Explicit Inverse vs. Backslash Solution Techniques',...
    'FontWeight','b')
xlabel('X','FontWeight','b'); ylabel('Y','FontWeight','b')