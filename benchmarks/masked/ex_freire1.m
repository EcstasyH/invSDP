sdpvar x r a;
xdim = 3;
vars = [x, r, a];

% loop condition 
loop_cond = r - x;

% while body
branch_num = 1;
f1 = [  x - r ; % x
        r + 1 ; % r
        a       % a
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
pre_cond_eq = [a/2, 0, a]; % x=a/2, r=0, a=a;
pre_cond_ineq = [-a]; % -a<=0

% post-condtion
post_cond_ineq = [a-r^2-r, r^2-r-a];

% invariant 
[p, coef_p] = polynomial([x,r], 2);
mono_p = monolist([x,r], 2);

inv_eq_var = [a];
inv_eq_masked = [p];

inv_ineq = [-x];

sdeg = 2;