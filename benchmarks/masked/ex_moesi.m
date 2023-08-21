sdpvar vm vs ve vi vo vt;

xdim = 5;
vars = [vm, vs, ve, vi, vo, vt];

% loop condition 
loop_cond = -1;

% while body
branch_num = 5;

f1 = [  0, 
        vs + ve + 1,
        0,
        vi - 1,
        vo + vm,
        vt
]; 

f2 = [  vm + 1, 
        vs,
        ve - 1,
        vi,
        vo,
        vt
]; 

f3 = [  0, 
        0,
        1,
        vi + vm + ve + vs + vo - 1;
        0,
        vt
]; 

f4 = [  0, 
        0,
        1,
        vi + vm + ve + vs + vo - 1;
        0,
        vt
];

f5 = [  0, 
        0,
        1,
        vi + vm + ve + vs + vo - 1;
        0,
        vt
]; 

f_list = [f1, f2, f3, f4, f5]; 

% guard conditions
guard_cond_list = [    
        1-vi;
        1-ve;
        1-vs;
        1-vo;
        1-vi;
];

% variable range
for i = 1: length(vars)
        range_cond(2*i-1) = -100 - vars(i);
        range_cond(2*i)   = vars(i) - 100;
end

% pre-condition
pre_cond_eq = [0, 0, 0, vi, vo, vi+vo];
pre_cond_ineq = [-1];

% post-condtion
post_cond_ineq = [-1];

% invariant 
[p, coef_p] = polynomial([vm, vs, ve, vi,vo], 1);
mono_p = monolist([vm, vs, ve, vi, vo], 1);

inv_eq_var = vt;
inv_eq_masked = p;

inv_ineq = [-vm, -vs, -ve, -vi];

sdeg = 2;