sdpvar s n;

name = ["n", "s"];
yvars = [n];
zvars = [s];

% loop condition 
loop_cond = -1;

% guard conditions
guard_cond = [-1];

% while body
f = [  
        [n + 1, s + n^5]
]; 

% pre-condition
pre_cond = [s, -s, n, -n];

% post-condtion
post_cond = [-1];

inv_ineq = [];

inv_deg = 6;