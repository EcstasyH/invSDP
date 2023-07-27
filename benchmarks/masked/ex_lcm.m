sdpvar a b x y u v c;
xdim = 7;
vars = [a, b, x, y, u, v c];

% loop condition 
loop_cond = 0;

% while body
branch_num = 2;
f1 = [  a,
        b,
        x-y,
        y,
        u,
        v+u,
        c
]; 


f2 = [  a,
        b,
        x,
        y-x,
        u+v,
        v,
        c
]; 

f_list = [f1, f2]; 
% guard conditions
guard_cond_list = [
    y-x;
    x-y
];

% variable range
for i = 1: length(vars)
    range_cond(2*i-1) = -100 - vars(i);
    range_cond(2*i)   = vars(i) - 100;
end

% pre-condition
pre_cond_eq = [a, b, a, b, b, 0, a*b];
pre_cond_ineq = [-1]; % -a<=0

% post-condtion
post_cond_ineq = [x*u+y*v-c, c-x*u-y*v];

% invariant 
[p, coef_p] = polynomial([x,y,u,v], 2);
mono_p = monolist([x,y,u,v], 2);

inv_eq_var = c;
inv_eq_masked = p;

inv_ineq = [-1];

sdeg = 2;