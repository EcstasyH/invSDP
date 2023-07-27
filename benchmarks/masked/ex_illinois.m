sdpvar vd vs ve vi vt;

xdim = 5;
vars = [vd, vs, ve, vi, vt];

% loop condition 
loop_cond = -1;

% while body
branch_num = 10;
f1 = [  vd, 
        vs,
        ve + 1,
        vi - 1,
        vt
]; 

f2 = [  vd - 1, 
        vs + 2,
        ve,
        vi - 1
        vt
]; 

f3 = [  vd,
        vs + ve + 1,
        0,
        vi - 1
        vt
]; 


f4 = [  vd,
        vs + ve + 1,
        0,
        vi - 1,
        vt
];

f5 = [  vd + 1,
        vs,
        ve - 1,
        vi,
        vt
];

f6 = [  vd + 1,
        0,
        ve,
        vi + vs - 1,
        vt
];

f7 = [  1,
        0,
        0,
        vi + ve + vd + vs - 1,
        vt
];

f8 = [  vd - 1,
        vs,
        ve,
        vi + 1,
        vt
];

f9 = [  vd,
        vs - 1,
        ve,
        vi + 1,
        vt
];

f10 = [ vd,
        vs,
        ve - 1,
        vi + 1,
        vt
];



f_list = [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10]; 

% guard conditions
guard_cond_list = [    
        1-vi, vd, vs, ve;
        1-vi, 1-vd, -1, -1;
        1-vi, 1-vs, -1, -1;
        1-vi, 1-ve, -1, -1;
        1-ve, -1, -1, -1;
        1-vs, -1, -1, -1;
        1-vi, -1, -1, -1;
        1-vd, -1, -1, -1;
        1-vs, -1, -1, -1;
        1-ve, -1, -1, -1;
];

% variable range
for i = 1: length(vars)
        range_cond(2*i-1) = -100 - vars(i);
        range_cond(2*i)   = vars(i) - 100;
end

%range_cond = [ -100-vu, vu-100, -100-ve, ve-100, -100-vn, vn-100, -100-vi, vi-100,-100-vt,vt-100];

% pre-condition
pre_cond_eq = [0, 0, 0, vi, vi];
pre_cond_ineq = [-1];

% post-condtion
post_cond_ineq = [-1];

% invariant 
[p, coef_p] = polynomial([vd, vs, ve, vi], 1);
mono_p = monolist([vd, vs, ve, vi], 1);

inv_eq_var = vt;
inv_eq_masked = p;

inv_ineq = [-vd, -vs, -ve, -vi];

sdeg = 2;