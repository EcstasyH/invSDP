sdpvar s n;
xdim = 2;
vars = [s, n];

% loop condition 
loop_cond = -1;

% while body
branch_num = 1;
f1 = [  s + n^5;
        n + 1;
]; 

f_list = [f1]; 

% guard conditions
guard_cond_list = [-1];

% variable range
for i = 1: length(vars)
        range_cond(2*i-1) = -100 - vars(i);
        range_cond(2*i)   = vars(i) - 100;
end

% pre-condition
pre_cond_eq = [0, 0];
pre_cond_ineq = [];

% post-condtion
post_cond_ineq = [-1];

% invariant 
[p, coef_p] = polynomial([n], 8);
mono_p = monolist([n], 8);

inv_eq_var = [s];
inv_eq_masked = [p];

inv_ineq = [];

sdeg = 6;