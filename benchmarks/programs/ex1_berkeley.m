sdpvar vu ve vn vi vt;

xdim = 5;
vars = [vu, ve, vn, vi, vt];

% loop condition 
loop_cond = -1;

% while body
branch_num = 4;
f1 = [  vu + 1, 
        0,
        vn + ve,
        vi - 1,
        vt
]; 

f2 = [  0,
        1,
        0,
        vi + ve + vn + vu - 1,
        vt
];

f3 = [  0,
        ve + 1,
        0,
        vi + vn + vu - 1,
        vt
];

f4 = [  0,
        ve + 1,
        0,
        vi + vn + vu - 1,
        vt
];

f_list = [f1, f2, f3, f4]; 

% guard conditions
guard_cond_list = [1-vi; 1-vi; 1-vn; 1-vu];

% variable range
%range_cond = [ -1-vu, vu-2, -1-ve, ve-2, -1-vn, vn-2, -1-vi, vi-2,-1-vt,vt-2];
range_cond = [ -100-vu, vu-100, -100-ve, ve-100, -100-vn, vn-100, -100-vi, vi-100,-100-vt,vt-100];

% pre-condition
pre_cond_eq = [0, 0, 0, vi, vi];
pre_cond_ineq = [-1];

% post-condtion
post_cond_ineq = [-1];

% invariant 
[p, coef_p] = polynomial([vu, ve, vn, vi], 1);
mono_p = monolist([vu, ve, vn, vi], 1);

inv_eq_var = [vt];
inv_eq_masked = [p];

inv_ineq = [-vu, -ve, -vn, -vi];

sdeg = 2;