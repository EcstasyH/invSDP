sdpvar vx vy va vb vp vq vr vs;
xdim = 8;
vars = [vx, vy, va, vb, vp, vq, vr, vs];

% loop condition 
loop_cond = -1;

% while body
branch_num = 2;
f1 = [  vx;
        vy;
        va-vb;
        vb;
        vp-vq;
        vq;
        vr-vs;
        vs
];

f2 = [  vx;
        vy;
        va;
        vb-va;
        vp;
        vq-vp;
        vr;
        vs-vr
];

f_list = [f1, f2]; 
% guard conditions
guard_cond_list = [vb-va; va-vb];

% variable range
range_cond = [ -vx-100, vx-100, -vy-100, vy-100, -va-100, va-100, -vb-100, vb-100, -vp-100, vp-100,-vq-100,vq-100,-vr-100,vr-100,-vs-100,vs-100];

% pre-condition
pre_cond_eq = [vx, vy, vx, vy, 1, 0, 0, 1];
pre_cond_ineq = [-1]; 

% post-condtion
post_cond_ineq = [-1];

% invariant 
% [p, coef_p] = polynomial([vx, vy, vr, vp], 2);
% mono_p = monolist([vx, vy, vr, vp], 2);

% inv_eq_var = [va];
% inv_eq_masked = [p];

% inv_ineq = [vx*vq+vy*vs-vb, vb-vx*vq-vy*vs];

% sdeg = 2;

[p1, coef_p1] = polynomial([vx, vy, vr, vp], 2);
[p2, coef_p2] = polynomial([vx, vy, vq, vs], 2);
coef_p = [coef_p1; coef_p2];

mono_p1 = monolist([vx, vy, vr, vp], 2);
mono_p2 = monolist([vx, vy, vq, vs], 2);
mono_p = [mono_p1;mono_p2];

inv_eq_var = [va, vb];
inv_eq_masked = [p1, p2];

inv_ineq = [];

sdeg = 2;