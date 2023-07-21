sdpvar n a su t;
xdim = 4;
vars = [n,a,su,t];

% loop condition 
loop_cond = [su-n];

% while body
branch_num = 1;
f1 = [  n ; 
        a + 1; 
        su + t + 2;
        t + 2     
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
pre_cond_eq = [n, 0, 1, 1]; 
pre_cond_ineq = [-n]; 

% post-condtion
%post_cond_ineq = [a^2-n]; %  remove a post condition n-(a+1)^2
post_cond_ineq = [a^2-n, n-(a+1)^2]; %  remove a post condition 

% invariant 
[p1, coef_p1] = polynomial([a], 2);
[p2, coef_p2] = polynomial([a], 2);
coef_p = [coef_p1;coef_p2];

mono_p1 = monolist([a], 2);
mono_p2 = monolist([a], 2);
mono_p = [mono_p1; mono_p2];

inv_eq_var = [t, su];
inv_eq_masked = [p1, p2];

inv_ineq = [a^2-n];

sdeg = 2;