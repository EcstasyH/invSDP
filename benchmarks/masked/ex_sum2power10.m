sdpvar n1 n2 s;

d = 10;

name = ["n1", "n2", "s"];

yvars = [n1, n2];
zvars = [s];

% loop condition 
loop_cond = -1;

% guard conditions
guard_cond = [-1];

% while body
f = [ [n1+1, n2+1, s+(n1+n2+2)^d-(n1+n2)^d]];

% pre-condition
pre_cond = [s-(n1+n2)^d, (n1+n2)^d-s];

% post-condtion
post_cond = [-1];

% invariant 

inv_ineq = [];

inv_deg = d;

% Number of yvars: 2
% Number of zvars: 1
% Number of parameters: 66
% A feasible solution is found.
% s = n1^10+10*n1^9*n2+45*n1^8*n2^2+120*n1^7*n2^3+209.99999*n1^6*n2^4+251.99999*n1^5*n2^5+209.99999*n1^4*n2^6+120*n1^3*n2^7+45*n1^2*n2^8+10*n1*n2^9+n2^10
% Elapsed time is 12.640609 seconds.