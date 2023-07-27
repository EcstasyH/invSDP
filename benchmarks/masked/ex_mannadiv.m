sdpvar x1 x2 y1 y2 y3;
xdim = 5;
vars = [x1, x2, y1, y2, y3];

% loop condition 
loop_cond = - y3;

% while body
branch_num = 2;
f1 = [  x1;
        x2;
        y1 + 1;
        0;
        y3 - 1;
]; 

f2 = [  x1;
        x2;
        y1;
        y2 + 1;
        y3 - 1;
]; 

f3 = [  x1;
        x2;
        y1;
        y2 + 1;
        y3 - 1;
]; 

f_list = [f1, f2, f3]; 

% guard conditions
guard_cond_list = [
    y2+1-x2, x2-y2-1;
    y2+2-x2, -1;
    x2-y2, -1;
    ];

% variable range
for i = 1: length(vars)
        range_cond(2*i-1) = -100 - vars(i);
        range_cond(2*i)   = vars(i) - 100;
end

% pre-condition
pre_cond_eq = [x1, x2, 0, 0, x1]; 
pre_cond_ineq = [-x1, -x2];

% post-condtion
post_cond_ineq = [-1];

% invariant 
[p, coef_p] = polynomial([x2, y1, y2, y3], 2);
mono_p = monolist([x2, y1, y2, y3], 2);

inv_eq_var = [x1];
inv_eq_masked = [p];

inv_ineq = [];

sdeg = 2;