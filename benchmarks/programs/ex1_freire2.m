sdpvar x r s a;
xdim = 4;
vars = [x, r, s, a];

% loop condition 
loop_cond = s - x;

% while body
branch_num = 1;
f1 = [  x - s , % x
        r + 1 , % r
        s + 6*r + 3 , % s
        a     % a
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
pre_cond_eq = [a, 1, 3.25, a];
pre_cond_ineq = [-a]; % -a<=0

% post-condtion
post_cond_ineq = [4*a-4*r^3-6*r^2-3*r, 4*r^3-6*r^2+3*r-1-4*a];

% invariant 
[p, coef_p] = polynomial([x,r], 3);
mono_p = monolist([x,r], 3);

inv_eq_var = a;
inv_eq_masked = p;

inv_ineq = [4*s-12*r^2-1, 12*r^2+1-4*s, -x];

sdeg = 2;

% [p1, coef_p1] = polynomial([x,r], 3);
% [p2, coef_p2] = polynomial([r], 2);
% coef_p = [coef_p1; coef_p2];

% mono_p1 = monolist([x,r], 3);
% mono_p2 = monolist([r], 2);
% mono_p = [mono_p1; mono_p2]; 

% inv_eq_var = [a, s];
% inv_eq_masked = [p1, p2];

% inv_ineq = [-x];

% sdeg = 2;