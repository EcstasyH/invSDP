sdpvar x r y;
xdim = 3;
vars = [x, r, y];

% loop condition 
loop_cond = r - x;

% while body
branch_num = 1;
f1 = [  x - r ; % x
        r + 1 ; % r
        y       % a
]; 

f_list = [f1]; 

% guard conditions
guard_cond_list = [-1];

% variable range
for i = 1: length(vars)
        range_cond(2*i-1) = -5 - vars(i);
        range_cond(2*i)   = vars(i) - 5;
end

% pre-condition
pre_cond_eq = [y/2, 0, y];
pre_cond_ineq = [-y]; 

% post-condtion
post_cond_ineq = [-1];

% invariant 
a = sdpvar(1,2);
a_range = [-2,2,-2,2];

inv = 2*x + a(2)*r^2 - a(1)*r - y;
inv_ineq = [-x, -r];

% adeg = 1;
% deg =1 : 1.1s

sdeg = 2;
degrees = [sdeg, sdeg, 2,2,2];
