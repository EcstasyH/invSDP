sdpvar vx vy va vb vp vq vr vs;

name = ["vx", "vy", "vp", "vq", "vr", "vs", "va", "vb"];

yvars = [vx, vy, vp, vq, vr, vs];
zvars = [va, vb];
% loop condition 
loop_cond = -1;

% guard conditions
guard_cond = [
        vb-va, 
        va-vb
];

% while body
f = [
        [  vx, vy, vp-vq, vq, vr-vs, vs, va-vb, vb],
        [  vx, vy,  vp, vq-vp, vr, vs-vr, va, vb-va]    
];
 
% pre-condition
pre_cond = [va-vx, vx-va, vy-vb, vb-vy, vp-1, 1-vp, vq, -vq, vr, -vr , 1-vs, vs-1];

% post-condtion
post_cond = [-1];

inv_ineq = [];
inv_deg=2;