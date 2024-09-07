sdpvar n1 n2 n3 s;

d = 8;

name = ["n1", "n2", "n3", "s"];

yvars = [n1, n2, n3];
zvars = [s];

% loop condition 
loop_cond = -1;

% guard conditions
guard_cond = [-1];

% while body
f = [ 
    [n1+1, n2+1, n3+1, s+(n1+n2+n3+3)^d-(n1+n2+n3)^d]
];

% pre-condition
pre_cond = [s-(n1+n2+n3)^d, (n1+n2+n3)^d-s];

% post-condtion
post_cond = [-1];

% invariant 

inv_ineq = [];

inv_deg = d;

