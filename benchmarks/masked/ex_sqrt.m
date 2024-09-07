sdpvar n a su t;

name = ["su","t","n","a"];
yvars = [su,t];
zvars = [n,a];
% loop condition 
loop_cond = [su-n];

% guard conditions
guard_cond = [-1];

% while body
f = [ [su + t + 2, t + 2, n, a + 1]]; 

% pre-condition
pre_cond = [a, -a, su-1, 1-su, t-1, 1-t,-n]; 

% post-condtion
post_cond = [a^2-n, n-(a+1)^2]; 

inv_ineq = [a^2-n];

inv_deg = 2;