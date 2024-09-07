sdpvar vx vy vd vr vq;

name = ["vy", "vd", "vr", "vq", "vx"];

yvars = [vy, vd, vr, vq];
zvars = [vx];

% loop condition 
loop_cond = vy-vr;

% guard conditions
guard_cond = [-1];

% while body
branch_num = 1;
f = [ [vy, vd, vr - vy*vd, vq + vd, vx ]]; 

% pre-condition
pre_cond = [vr-vx, vx-vr, vq-0, 0-vq];

% post-condtion
post_cond = [-1];

inv_ineq = [];

inv_deg = 2;