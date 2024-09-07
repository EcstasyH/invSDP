sdpvar n x y z;

name = ["n", "x", "y", "z"];

yvars = [n];
zvars = [x, y, z];

% loop condition 
loop_cond = -1;

% guard conditions
guard_cond = [-1];

% while body
f = [ [n + 1, x + y, y + z, z + 6] ]; 

% pre-condition
pre_cond = [n, -n, x, -x, 1-y, y-1, z-6, 6-z];

% post-condtion
post_cond = [-1];

inv_ineq = [];

inv_deg = 3;