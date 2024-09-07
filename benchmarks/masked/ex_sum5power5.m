sdpvar n1 n2 n3 n4 n5 s;

d = 5;

name = ["n1", "n2", "n3", "n4", "n5" "s"];

yvars = [n1, n2, n3, n4, n5];
zvars = [s];

% loop condition 
loop_cond = -1;

% guard conditions
guard_cond = [-1];

% while body
f = [ [n1+1, n2+1, n3+1, n4+1, n5+1,s+(n1+n2+n3+n4+n5+5)^d-(n1+n2+n3+n4+n5)^d]];

% pre-condition
pre_cond = [s-(n1+n2+n3+n4+n5)^d, (n1+n2+n3+n4+n5)^d-s];

% post-condtion
post_cond = [-1];

% invariant 

inv_ineq = [];

inv_deg = d;

