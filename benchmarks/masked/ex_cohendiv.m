sdpvar vx vy vd vr vq;
xdim = 5;
vars = [vx, vy, vd, vr, vq];

% loop condition 
loop_cond = vy-vr;

% while body
branch_num = 1;
f1 = [  vx;
        vy;
        vd; %d
        vr - vy*vd;
        vq + vd
]; 
f_list = [f1]; 

% guard conditions
guard_cond_list = [-1];

% variable range
range_cond = [ -vd-100, vd-100, -vx-100, vx-100, -vy-100, vy-100, -vr-100, vr-100, -vq-100, vq-100];

% pre-condition
pre_cond_eq = [vx, vy, vd, vx, 0];
pre_cond_ineq = [-1];

% post-condtion
post_cond_ineq = [-1];

% invariant 
[p, coef_p] = polynomial([vq, vy, vr], 2);
mono_p = monolist([vq, vy, vr], 2);

inv_eq_var = [vx];
inv_eq_masked = [p];

inv_ineq = [];

sdeg = 2;