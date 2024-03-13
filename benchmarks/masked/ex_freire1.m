sdpvar x r a;

name = ["x", "r", "a"];

yvars = [x, r];
zvars = [a];

% loop condition 
loop_cond = r - x;

% guard conditions
guard_cond = [-1];

% while body
f = [ x - r, r + 1, a];

% pre-condition
pre_cond = [-a, x-a/2, a/2-x, r, -r];

% post-condtion
post_cond = [a-r^2-r, r^2-r-a];

% invariant 

inv_ineq = [-x];

inv_deg = 2;