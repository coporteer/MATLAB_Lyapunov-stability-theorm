clearvars
clc 

% This code is for matlab simulation which is about Lyapunov`s stability theorm

% https://kr.mathworks.com/help/matlab/matlab_prog/comments.html
% Possibly error range
eps = 1e-6;

% Array list
A = [0 1;
    -2 -3];

B = [0 1;
    2 3];

% size of 1 demension
n = size(A,1);
% Yalimp`s symmetric martix
% https://yalmip.github.io/command/sdpvar/
P = sdpvar(n,n);

lmi1 = P - eps*eye(n) >= 0;
lmi2 = P*A + A'*P + eps*eye(n) <= 0;

lmis = [lmi1; lmi2];

optimize(lmis)

P = value(P)
% n = value(n)
