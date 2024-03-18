sdpvar vm vs ve vi vt;

name = ["vm", "vs", "ve", "vi", "vt"];
yvars = [vm, vs, ve, vi];
zvars = [vt];

% loop condition 
loop_cond = -1;

% guard conditions
guard_cond = [    
        1-vi;
        1-ve;
        1-vs;
        1-vi;
];

% while body
f = [
        [  0, vs + ve + vm + 1, 0, vi - 1, vt ],
        [  vm + 1, vs, ve - 1, vi, vt],
        [  0, 0, 1, vi + vm + ve + vs - 1, vt],
        [  0, 0, 1, vi + vm + ve + vs - 1, vt]
]; 


% pre-condition
pre_cond = [vm, -vm, vs, -vs, ve, -ve, vt-vi, vi-vt, 1-vi];

% post-condtion
post_cond = [-1];

inv_ineq = [-vm, -vs, -ve, -vi];

inv_deg = 1;