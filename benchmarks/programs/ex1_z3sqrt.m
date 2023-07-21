sdpvar va ve vr vq vp;
xdim = 5;
vars = [va, ve, vr, vq, vp];

% loop condition 
loop_cond = [ve-2*vp*vr];

% while body
branch_num = 2;
f1 = [  
        va;
        ve;
        2*vr-2*vq-vp;
        vq+vp;
        vp/2;
]; 

f2 = [  
        va;
        ve;
        2*vr;
        vq;
        vp/2;
]; 


f_list = [f1,f2]; 

% guard conditions
guard_cond_list = [
        vp+2*vq-2*vr;
        2*vr-2*vp-vq
];

% variable range
for i = 1: length(vars)
        range_cond(2*i-1) = -100 - vars(i);
        range_cond(2*i)   = vars(i) - 100;
end

% pre-condition
pre_cond_eq = [va, ve, va-1, 1, 0.5]; 
pre_cond_ineq = [-ve,1-va]; 

% post-condtion
post_cond_ineq = [va-ve-vq^2];  % the original post condition is wrong

% invariant 
[p, coef_p] = polynomial([vp,vq,vr], 2);

mono_p = monolist([vp,vq,vr], 2);

inv_eq_var = [va];
inv_eq_masked = [p];

inv_ineq = [-ve,-vp,-vr];

sdeg = 2;