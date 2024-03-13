% example: simple
sdpvar x1 x2;
xdim = 2;
vars = [x1, x2];

% Program body
%
% branches
loop_cond = 0;

branch_num = 1;
f1 = [  x1^2+x2-1; 
        (x1^2+x2-1)*x2+x2+1];

f_list = [f1];
guard_cond_list = [x1^2 + x2^2 - 3];


% variable range
for i = 1: length(vars)
        range_cond(2*i-1) = -5 - vars(i);
        range_cond(2*i)   = vars(i) - 5;
end
% x_range = [-4, 4, -4, 4];

% pre-conditions
pre_cond_eq = [x1,x2]; 
pre_cond_ineq = [x1^2 + x2^2 - 1];
% post-condtion
post_cond_ineq = [x1^2 + x2^2 - 4];

% invariant template

a = sdpvar(1,3);
for i = 1: length(a)
        a_range(2*i-1) = 0;
        a_range(2*i)   = 10;
end

% a_range = [ -10, 10, -10,  10,-10,10,-10,10];

inv = a(1)*x1^2 + a(2)*x2^2 + a(3)*x1-1; 
inv_ineq = [];
% Parameters in SOS constraints translation


sdeg = 6; % max deg in SOS
degrees = [sdeg, sdeg,sdeg, 4,4];
epsilon = 0; % tolerance for >= 
