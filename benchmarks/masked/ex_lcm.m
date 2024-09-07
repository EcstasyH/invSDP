sdpvar a b x y u v c;

name = ["a", "b", "x", "y", "u", "v", "c"];
yvars = [a, b, x, y, u, v];
zvars = [c];
% loop condition 
loop_cond = 0;

% guard conditions
guard_cond = [
    [y-x],
    [x-y]
];

% while body
f = [
    [  a, b, x-y, y, u, v+u, c],
    [  a, b, x, y-x, u+v, v, c]
];

% pre-condition
pre_cond = [x-a, a-x, y-b, b-y, u-b, b-u, v, -v, c-a*b, a*b-c];

% post-condtion
post_cond = [x*u+y*v-c, c-x*u-y*v];

inv_ineq = [];

inv_deg = 2;