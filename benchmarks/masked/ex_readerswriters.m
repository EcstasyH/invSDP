sdpvar c1 c2 k0 r w k;
xdim = 6;
vars = [c1, c2, k0, r, w, k];

% loop condition 
loop_cond = -1;

% while body
branch_num = 4;
f1 = [  c1;
        c2;
        k0;
        r+1;
        w;
        k-c1
]; 

f2 = [  c1;
        c2;
        k0;
        r;
        w+1;
        k-c2
]; 

f3 = [  c1;
        c2;
        k0;
        r-1;
        w;
        k+c1
]; 

f4 = [  c1;
        c2;
        k0;
        r;
        w-1;
        k+c2
]; 

f_list = [f1,f2,f3,f4]; 

% guard conditions
guard_cond_list = [
        w, -w;
        r,-r;
        w,-w;
        r,-r;
];

% variable range
for i = 1: length(vars)
        range_cond(2*i-1) = -100 - vars(i);
        range_cond(2*i)   = vars(i) - 100;
end

% pre-condition
pre_cond_eq = [c1, c2, k0, 0, 0 , k0];
pre_cond_ineq = [-c1, -c2, -k0];

% post-condtion
post_cond_ineq = [-1];

% invariant 
[p, coef_p] = polynomial([r,c1,c2,w,k], 2);
mono_p = monolist([r,c1,c2,w,k], 2);

inv_eq_var = [k0];
inv_eq_masked = [p];

inv_ineq = [r*w,-r*w];

sdeg = 2;