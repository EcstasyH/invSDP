sdpvar vu ve vn vi vt;

name = ["vu", "ve", "vn", "vi", "vt"];  

yvars = [vu, ve, vn, vi];
zvars = [vt];

% loop condition 
loop_cond = -1;

% guard conditions
guard_cond = [
       1-vi, 
       1-vi, 
       1-vn, 
       1-vu, 
];

% while body
f = [
       [vu + 1, 0, vn + ve, vi - 1, vt ], 
       [0, 1, 0, vi + ve + vn + vu - 1, vt],
       [0, ve + 1, 0, vi + vn + vu - 1, vt],
       [0, ve + 1, 0, vi + vn + vu - 1, vt]
];
  
% pre-condition
pre_cond = [vu, -vu, ve, -ve, vn, -vn, vt-vi, vi-vt, -vi];

% post-condtion
post_cond = [-1];

% invariant 
inv_ineq = [-vi, -ve, -vn, -vu];

inv_deg = 1;