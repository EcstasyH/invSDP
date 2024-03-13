sdpvar vd vs ve vi vt;

name = ["vd", "vs", "ve", "vi", "vt"];

yvars = [vd, vs, ve, vi];
zvars = [vt];

% loop condition 
loop_cond = -1;

guard_cond = [    
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

% while body
f = [
        [  vd, vs, ve + 1, vi - 1, vt],
        [  vd - 1, vs + 2, ve, vi - 1, vt],
        [  vd, vs + ve + 1, 0, vi - 1, vt],
        [  vd, vs + ve + 1, 0, vi - 1, vt],
        [  vd + 1, vs, ve - 1, vi, vt ],
        [  vd + 1, 0, ve, vi + vs - 1, vt],
        [  1, 0, 0, vi + ve + vd + vs - 1, vt],
        [  vd - 1, vs, ve, vi + 1, vt],
        [  vd, vs - 1, ve, vi + 1, vt],
        [  vd, vs, ve - 1, vi + 1, vt]
];

% pre-condition
pre_cond = [vd,-vd, vs, -vs, ve, -ve, vt-vi, vi-vt];

% post-condtion
post_cond = [-1];

inv_ineq = [];

inv_deg = 1;