% Dubin's car example

% ----- Program body ------
%
sdpvar x1 x2

vars = [x1, x2];

% loop condition 
loop_cond = -1;

% body

d = 0.01;
w = 1.0178 + 1.8721 * x1 - 0.0253 * x2;    

f = [ 
       [x1 + d*(1-x2*w), x2 + d*x1*w]
];

guard_cond = [-1];

% variable range
for i = 1: length(vars)
       range_cond(2*i-1) = -5 - vars(i);
       range_cond(2*i)   = vars(i) - 5;
end
% x_range = [0, 10, 0, 10];

% pre-conditions
pre_cond_eq = [x1,x2];
pre_cond = [x1^2 + (x2-1)^2 - 1];

% post-condtion
post_cond = [x1^2 + (x2-1)^2 - 4];

% ----- Invariant template ------
%

a = sdpvar(1,3);
a_range = [0, 10, -10, 10, -10, 10];

% invariant template
inv = x1^2 + a(1)*x2^2 + a(2)*x2 + a(3); 
inv_ineq = [];


sdeg = adeg+1;
degrees = [sdeg, sdeg, sdeg, 2,2];