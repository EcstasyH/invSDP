sdpvar n1 n2 s;

d = 22;

name = ["n1", "n2", "s"];

yvars = [n1, n2];
zvars = [s];

% loop condition 
loop_cond = -1;

% guard conditions
guard_cond = [-1];

% while body
f = [ n1+1, n2+1, s+(n1+n2+2)^d-(n1+n2)^d];

% pre-condition
pre_cond = [s-(n1+n2)^d, (n1+n2)^d-s];

% post-condtion
post_cond = [-1];

% invariant 

inv_ineq = [];

inv_deg = d;

% ========sum2power20========
% Number of yvars: 2
% Number of zvars: 1
% Number of parameters: 231
% No feasible solution is found.
% Elapsed time is 522.337333 seconds.