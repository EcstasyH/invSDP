sdpvar n x y z;
xdim = 4;
vars = [n, x, y, z];

% loop condition 
loop_cond = -1;

% while body
branch_num = 1;
f1 = [  n + 1, 
        x + y,
        y + z,
        z + 6
]; 
f_list = [f1]; 
% guard conditions
guard_cond_list = [-1];

% variable range
range_cond = [ -n-100, n-100, -x-100, x-100, -y-100, y-100, -z-100, z-100];

% pre-condition
pre_cond_eq = [0, 0, 1, 6];
pre_cond_ineq = [-1]; % -a<=0

% post-condtion
post_cond_ineq = [-1];

% invariant 
% [p, coef_p] = polynomial([n], 3);
% mono_p = monolist([n], 3);

% inv_eq_var = x;
% inv_eq_masked = p;

% inv_ineq = [z-6*n-6, 6*n+6-z, y-3*n^2-3*n-1, 3*n^2+3*n+1-y];

[p1, coef_p1] = polynomial([n], 1);
[p2, coef_p2] = polynomial([n], 2);
[p3, coef_p3] = polynomial([n], 3);
coef_p = [coef_p1;coef_p2;coef_p3];
mono_p1 = monolist([n], 1);
mono_p2 = monolist([n], 2);
mono_p3 = monolist([n], 3);
mono_p = [mono_p1;mono_p2;mono_p3];

inv_eq_var = [z, y, x];
inv_eq_masked = [p1, p2, p3];

inv_ineq = [];

sdeg = 2;