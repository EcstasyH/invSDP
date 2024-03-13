% example: simple
sdpvar x1 x2;
xdim = 2;
vars = [x1, x2];

% Program body
%
% branches
loop_cond = x1^2-0.81;

branch_num = 1;
% f1 = [  0.9 * ( x1 - 0.01 * x2); 
%         0.9 * ( x2 + 0.01 * x1)];

f1 = [  0.95 * ( x1 - 0.1 * x2^2); 
        0.95 * ( x2 + 0.2 * x1*x2)];
f_list = [f1];
guard_cond_list = [-1];


% variable range
for i = 1: length(vars)
        range_cond(2*i-1) = -2 - vars(i);
        range_cond(2*i)   = vars(i) - 2;
end


% pre-conditions
pre_cond_eq = [x1, x2]; 
pre_cond_ineq = [x1^2 + x2^2 - 1];
% post-condtion
post_cond_ineq = [1/4 - x1^2 - (x2-1.5)^2];

% invariant template

a = sdpvar(1,2);
a_range = [ -1, -0.5, -0.5, 0];
inv = x1^2 + 10*a(1)*x2^2 + 10*a(2); 
inv_ineq = [];
% Parameters in SOS constraints translation

% adeg = 5;  
sdeg = 4;
degrees = adeg+1;%[sdeg, sdeg, 2,2];
epsilon = 0; % tolerance for >= 
