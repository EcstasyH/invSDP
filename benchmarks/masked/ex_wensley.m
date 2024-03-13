sdpvar vp vq ve va vb vd vy;

name = ["vp", "vq", "ve", "vd", "vy", "va", "vb"];
yvars = [vp, vq, ve, vd, vy];
zvars = [va, vb];
% loop condition 
loop_cond = [ve-vd];

% guard conditions
guard_cond = [
    vp-va-vb;
    va+vb-vp
];

% while body
f = [
        [  vp, vq, ve, vd/2, vy, va, vb/2],
        [  vp, vq, ve, vd/2, vy+vd/2, va+vb, vb/2]
];

% pre-condition
pre_cond = [va,-va,vb-vq/2,vq/2-vb,vd-1,1-vd,vy,-vy,vp-vq,-vp,-ve]; 

% post-condtion
post_cond = [vy*vq-vp, vp-(vy+ve)*vq];

% inv_ineq = [vy*vq-vp, vp-(vy+vd)*vq]; 
inv_ineq = []; 

inv_deg = 2;