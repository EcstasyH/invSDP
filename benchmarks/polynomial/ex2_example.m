% example: simple
sdpvar x1 x2;
xdim = 2;
vars = [x1, x2];

% Program body
%
% branches
loop_cond = 0;

branch_num = 1;
f1 = [  0.9 * ( x1 - 0.01 * x2); 
        0.9 * ( x2 + 0.01 * x1)];

f_list = [f1];
guard_cond_list = [-1];


% variable range
for i = 1: length(vars)
        range_cond(2*i-1) = -5 - vars(i);
        range_cond(2*i)   = vars(i) - 5;
end
% x_range = [-4, 4, -4, 4];

% pre-conditions
pre_cond_eq = [x1, x2]; 
pre_cond_ineq = [x1^2 + x2^2 - 1];
% post-condtion
post_cond_ineq = [1/4 - x1^2 - (x2-2)^2];

% invariant template

a = sdpvar(1,2);
a_range = [ -10, 10, -10,  10];
inv = x1^2 + a(1)*x2^2 + a(2); 
inv_ineq = [];
% Parameters in SOS constraints translation

adeg = 3;  
% 4 6
% deg 1: 0.8s
% deg 2: 1.7s
% deg 3: 1.8s
% deg 4: 3.2s
M = -10;

sdeg = 4; % max deg in SOS
degrees = [sdeg, sdeg, 2,2];
epsilon = 0; % tolerance for >= 


% a = sdpvar(1,2);
% a_range = [ -1, 1, -1,  1];
% inv = x1^2 + 10*a(1)*x2^2 + 10*a(2); 
% inv_ineq = [];
% % Parameters in SOS constraints translation

% adeg = 4;  
% % 4 6
% % deg 1: 0.8s
% % deg 2: 1.7s
% % deg 3: 1.8s
% % deg 4: 3.2s
% M = -10;

% sdeg = 6; % max deg in SOS
% degrees = [sdeg, sdeg, 2,2];
% epsilon = 0; % tolerance for >= 
