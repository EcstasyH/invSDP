sdpvar n1 n2 n3 s;

d = 6;

name = ["n1", "n2", "n3", "s"];

yvars = [n1, n2, n3];
zvars = [s];

% loop condition 
loop_cond = -1;

% guard conditions
guard_cond = [-1];

% while body
f = [ n1+1, n2+1, n3+1, s+(n1+n2+n3+3)^d-(n1+n2+n3)^d];

% pre-condition
pre_cond = [s-(n1+n2+n3)^d, (n1+n2+n3)^d-s];

% post-condtion
post_cond = [-1];

% invariant 

inv_ineq = [];

inv_deg = d;

% ========sum3power6========
% Number of yvars: 3
% Number of zvars: 1
% Number of parameters: 84
% A feasible solution is found.
% s = n1^6+6*n1^5*n2+6*n1^5*n3+15*n1^4*n2^2+30*n1^4*n2*n3+15*n1^4*n3^2+20*n1^3*n2^3+60*n1^3*n2^2*n3+60*n1^3*n2*n3^2+20*n1^3*n3^3+15*n1^2*n2^4+60*n1^2*n2^3*n3+89.99999*n1^2*n2^2*n3^2+60*n1^2*n2*n3^3+15*n1^2*n3^4+6*n1*n2^5+30*n1*n2^4*n3+60*n1*n2^3*n3^2+60*n1*n2^2*n3^3+30*n1*n2*n3^4+6*n1*n3^5+n2^6+6*n2^5*n3+15*n2^4*n3^2+20*n2^3*n3^3+15*n2^2*n3^4+6*n2*n3^5+n3^6
% Elapsed time is 10.873296 seconds.