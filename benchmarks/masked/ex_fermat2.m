sdpvar n rr u v r;

name = ["rr", "u", "v", "r", "n"];
yvars = [rr, u, v, r];
zvars = [n]

% loop condition 
loop_cond = -1;

% guard conditions
guard_cond = [
        -r,
        r
];

% while body
f = [
        [  rr, u, v+2, r-v, n  ],
        [  rr, u+2, v, r+u, n  ] 
];

% pre-condition
pre_cond= [ u-2*rr-1, 2*rr+1-u, v-1, 1-v, r-rr^2+n, rr^2-n-r];

% post-condtion
post_cond = [-1];

inv_ineq = [];

inv_deg = 2;