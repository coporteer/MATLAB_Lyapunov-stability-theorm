clearvars
clc 

% This code is for matlab simulation which is about Lyapunov`s stability theorm

% simulink related
% https://kr.mathworks.com/help/simulink/ug/what-is-a-matlab-function-block.html
% https://kr.mathworks.com/help/simulink/slref/add.html

% https://kr.mathworks.com/help/matlab/matlab_prog/comments.html
% Possibly error range
eps = 1e-6;

% Array list
A = [0 1;
    0 2];

B = [0; 1];

n = size(A,1);
m = size(B,2);

% Yalimp`s symmetric martix
% https://yalmip.github.io/command/sdpvar/
X = sdpvar(n,n);
M = sdpvar(m,n);
Al = 100;

lmi1 = X - eps*eye(n) >= 0;
lmi2 = 2*Al*A + A*X + X*A' + B*M + M'*B' + eps*eye(n) <= 0;

lmis = [lmi1; lmi2];

optimize(lmis)

X = value(X);
M = value(M);
K = M / X
% m = value(m)
