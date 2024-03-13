sdpvar x r s a;

name = ["x", "r", "s", "a"];

yvars = [x, r];
zvars = [s, a];

% loop condition 
loop_cond = s - x;

% guard conditions
guard_cond = [-1];

% while body
f = [  x - s, r + 1 , s + 6*r + 3 , a];

% pre-condition
pre_cond = [x-a, a-x, r-1, 1-r, s-3.25, 3.25-s, -a];

% post-condtion
post_cond = [4*a-4*r^3-6*r^2-3*r, 4*r^3-6*r^2+3*r-1-4*a];

% invariant 
inv_ineq = [-x];

inv_deg = 3;
