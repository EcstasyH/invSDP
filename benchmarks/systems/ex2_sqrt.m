sdpvar n y su;
xdim = 3;
vars = [n,y,su];

% loop condition 
loop_cond = [su-n];

% while body
branch_num = 1;
f1 = [  n ; 
        y + 1; 
        su + 2*y + 3;    
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
pre_cond_eq = [n, 0, 1]; 
pre_cond_ineq = [-n]; 

% post-condtion
post_cond_ineq = [y^2-n];%, n-(y+1)^2]; %  remove y post condition 


post_cond_ineq = [-1];


a = sdpvar(1,2);
a_range = [-2, 2,-2, 2];
inv = su - a(1)*(y+(a(2)))^2;
inv_ineq = [];


adeg = 2;  
M = -10;
sdeg = 4; % max deg in SOS
degrees = [sdeg,sdeg, 2,2,2,2,2];
epsilon = 0; % tolerance for >= 