sdpvar vm vs ve vi vo vt;

name = ["vm", "vs", "ve", "vi", "vo", "vt"];
yvars = [vm, vs, ve, vi, vo];
zvars = [vt];

% loop condition 
loop_cond = -1;

% guard conditions
guard_cond = [    
        1-vi,
        1-ve,
        1-vs,
        1-vo,
        1-vi
];

% while body
f =  [
        [  0, vs + ve + 1, 0, vi - 1, vo + vm, vt], 
        [  vm + 1, vs, ve - 1, vi, vo, vt ], 
        [  0, 0, 1,vi + vm + ve + vs + vo - 1, 0,vt],
        [  0, 0, 1,vi + vm + ve + vs + vo - 1, 0,vt],
        [  0, 0, 1,vi + vm + ve + vs + vo - 1, 0,vt]
];    


% pre-condition
pre_cond = [vm,-vm, vs, -vs, ve, -ve, 1-vi, 1-vo, vt-vi-vo, vi+vo-vt];

% post-condtion
post_cond = [-1];

inv_ineq = [-vm, -vs, -ve, -vi, -vo];

inv_deg = 1;