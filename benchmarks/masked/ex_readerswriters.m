sdpvar c1 c2 k0 r w k;

name = ["c1", "c2", "r", "w", "k", "k0"];
yvars = [c1, c2, r, w, k];
zvars = [k0];

% loop condition 
loop_cond = -r*w;

% guard conditions
guard_cond = [
        w,-w,
        r,-r,
        w,-w,
        r,-r,
];

% while body
f = [
        [c1, c2, r+1, w, k-c1, k0], 
        [c1, c2, r, w+1, k-c2, k0],
        [c1, c2, r-1, w, k+c1, k0], 
        [c1, c2, r, w-1, k+c2, k0]
];

% pre-condition
pre_cond = [r, -r, w, -w, k-k0, k0-k, -c1, -c2, -k0];

% post-condtion
post_cond = [-1];

inv_ineq = [r*w, -r*w];

inv_deg = 2;
