sdpvar va ve vr vq vp;
name = ["ve", "vr", "vq", "vp", "va"];
yvars = [ve, vr, vq, vp];
zvars = [va];

% loop condition 
loop_cond = [ve-2*vp*vr];

% guard conditions
guard_cond = [
        [vp+2*vq-2*vr],
        [2*vr-2*vp-vq]
];

% while body
f = [
        [  ve, 2*vr-2*vq-vp, vq+vp, vp/2, va], 
        [  ve, 2*vr, vq, vp/2, va ]
];

% pre-condition 
pre_cond = [vr-va+1, va-1-vr, vq-1, 1-vq, vp-0.5,0.5-vp,1-va,-ve]; 

% post-condtion 
post_cond = [va-ve-vq^2]; 

% invariant 
inv_ineq = [-ve];

inv_deg = 2;