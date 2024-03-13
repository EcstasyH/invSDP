% example: simple
sdpvar x1 x2;
xdim = 2;
vars = [x1, x2];

% Program body
%
% branches
loop_cond = -x2;

branch_num = 1;
f1 = [  8/9*x1 - 1/18 *x2; 
        0.1*x1 + 0.9*x2];

f_list = [f1];
guard_cond_list = [-1];


% variable range
for i = 1: length(vars)
        range_cond(2*i-1) = -5 - vars(i);
        range_cond(2*i)   = vars(i) - 5;
end
% x_range = [-4, 4, -4, 4];

% pre-conditions
pre_cond_eq = [x1,x2]; 
pre_cond_ineq = [(x1-0.5)^2 + (x2-0.5)^2-0.25^2 ];
% post-condtion
post_cond_ineq = [x2^2-4];

% invariant template

a = sdpvar(1,2);
for i = 1: length(a)
        a_range(2*i-1) = 0;
        a_range(2*i)   = 1;
end

% a_range = [ -10, 10, -10,  10,-10,10,-10,10];

inv = a(1)*x1^2 + a(2)*x2^2 -1; 
inv_ineq = [-x2];
% Parameters in SOS constraints translation

sdeg = 4; % max deg in SOS
degrees = [sdeg,sdeg, 2,2];
epsilon = 0; % tolerance for >= 
