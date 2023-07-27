sdpvar n x;
xdim = 2;
vars = [n, x];

% loop condition 
loop_cond = n-5;

% while body
branch_num = 1;
f1 = [  n + 1, 
        x + 6*n + 6,
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
pre_cond_eq = [0, 0];
pre_cond_ineq = [-1]; % -a<=0

% post-condtion
post_cond_ineq = [2.5*n^2+4*n-x, x-3.5*n^2-3*n];


a = sdpvar(1,3);
a_range = [-2, 2,-2, 2,-2, 2];

inv = a(1)*n^2 + a(2)*n + a(3) - x;
inv_ineq = [-n]; % -a<=0


adeg = 2;  
% deg = 1: 3.5s 
% deg = 2: 4.3s -> found

M = -10;
sdeg = 4; % max deg in SOS
degrees = [sdeg, sdeg, 2,2,2];
epsilon = 0; % tolerance for >= 