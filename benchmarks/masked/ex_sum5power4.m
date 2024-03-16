sdpvar n1 n2 n3 n4 n5 s;

d = 4;

name = ["n1", "n2", "n3", "n4", "n5" "s"];

yvars = [n1, n2, n3, n4, n5];
zvars = [s];

% loop condition 
loop_cond = -1;

% guard conditions
guard_cond = [-1];

% while body
f = [ n1+1, n2+1, n3+1, n4+1, n5+1,s+(n1+n2+n3+n4+n5+5)^d-(n1+n2+n3+n4+n5)^d];

% pre-condition
pre_cond = [s-(n1+n2+n3+n4+n5)^d, (n1+n2+n3+n4+n5)^d-s];

% post-condtion
post_cond = [-1];

% invariant 

inv_ineq = [];

inv_deg = d;

% ========sum5power4========
% Number of yvars: 5
% Number of zvars: 1
% Number of parameters: 126
% A feasible solution is found.
% s = n1^4+4*n1^3*n2+4*n1^3*n3+4*n1^3*n4+4*n1^3*n5+6*n1^2*n2^2+12*n1^2*n2*n3+12*n1^2*n2*n4+12*n1^2*n2*n5+6*n1^2*n3^2+12*n1^2*n3*n4+12*n1^2*n3*n5+6*n1^2*n4^2+12*n1^2*n4*n5+6*n1^2*n5^2+4*n1*n2^3+12*n1*n2^2*n3+12*n1*n2^2*n4+12*n1*n2^2*n5+12*n1*n2*n3^2+24*n1*n2*n3*n4+24*n1*n2*n3*n5+12*n1*n2*n4^2+24*n1*n2*n4*n5+12*n1*n2*n5^2+4*n1*n3^3+12*n1*n3^2*n4+12*n1*n3^2*n5+12*n1*n3*n4^2+24*n1*n3*n4*n5+12*n1*n3*n5^2+4*n1*n4^3+12*n1*n4^2*n5+12*n1*n4*n5^2+4*n1*n5^3+n2^4+4*n2^3*n3+4*n2^3*n4+4*n2^3*n5+6*n2^2*n3^2+12*n2^2*n3*n4+12*n2^2*n3*n5+6*n2^2*n4^2+12*n2^2*n4*n5+6*n2^2*n5^2+4*n2*n3^3+12*n2*n3^2*n4+12*n2*n3^2*n5+12*n2*n3*n4^2+24*n2*n3*n4*n5+12*n2*n3*n5^2+4*n2*n4^3+12*n2*n4^2*n5+12*n2*n4*n5^2+4*n2*n5^3+n3^4+4*n3^3*n4+4*n3^3*n5+6*n3^2*n4^2+12*n3^2*n4*n5+6*n3^2*n5^2+4*n3*n4^3+12*n3*n4^2*n5+12*n3*n4*n5^2+4*n3*n5^3+n4^4+4*n4^3*n5+6*n4^2*n5^2+4*n4*n5^3+n5^4
% Elapsed time is 25.468229 seconds.