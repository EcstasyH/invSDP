sdpvar n rr u v r;
xdim = 5;
vars = [n, rr, u, v, r];

% loop condition 
loop_cond = -1;

% while body
branch_num = 2;
f1 = [  n;
        rr;
        u;
        v+2;
        r-v;
];

f2 = [  n;
        rr;
        u+2;
        v;
        r+u;
];

f_list = [f1, f2]; 

% guard conditions
guard_cond_list = [-r; r];

% variable range
for i = 1: length(vars)
        range_cond(2*i-1) = -100 - vars(i);
        range_cond(2*i)   = vars(i) - 100;
end
% range_cond = [ -n-100, n-100, -rr-100, rr-100, -u-100, u-100, -v-100, v-100, -r-100, r-100];

% pre-condition
pre_cond_eq = [n, rr, 2*rr+1, 1, rr^2-n];
pre_cond_ineq = [-1]; 

% post-condtion
post_cond_ineq = [-1];

% invariant 
[p, coef_p] = polynomial([u,v,r], 2);
mono_p = monolist([u,v,r], 2);

inv_eq_var = n;
inv_eq_masked = p;

inv_ineq = [];
sdeg = 2;