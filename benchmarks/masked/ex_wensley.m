sdpvar vp vq ve va vb vd vy;
xdim = 7;
vars = [vp, vq, ve, va, vb, vd, vy];

% loop condition 
loop_cond = [ve-vd];

% while body
branch_num = 2;
f1 = [  vp;
        vq;
        ve;
        va;
        vb/2;
        vd/2;
        vy
]; 

f2 = [  vp;
        vq;
        ve;
        va+vb;
        vb/2;
        vd/2;
        vy+vd/2;
]; 


f_list = [f1,f2]; 

% guard conditions
guard_cond_list = [
    vp-va-vb;
    va+vb-vp
];

% variable range
for i = 1: length(vars)
        range_cond(2*i-1) = -1 - vars(i);
        range_cond(2*i)   = vars(i) - 1;
end

% pre-condition
pre_cond_eq = [vp,vq,ve,0,vq/2,1,0]; 
pre_cond_ineq = [vp-vq,-vp,-ve]; 

% post-condtion
post_cond_ineq = [vy*vq-vp];
%post_cond_ineq = [vy*vq-vp, vp-(vy+ve)*vq]; donot know why

% invariant 
[p1, coef_p1] = polynomial([vq,vy], 2);
[p2, coef_p2] = polynomial([vq,vd], 2);
coef_p = [coef_p1;coef_p2];

mono_p1 = monolist([vq,vy], 2);
mono_p2 = monolist([vq,vd], 2);
mono_p = [mono_p1; mono_p2];

inv_eq_var = [va, vb];
inv_eq_masked = [p1, p2];

inv_ineq = [vy*vq-vp, vp-(vy+vd)*vq, -vq]; 

sdeg = 2;