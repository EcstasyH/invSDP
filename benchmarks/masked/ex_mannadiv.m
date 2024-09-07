sdpvar x1 x2 y1 y2 y3;

name = [ "x2", "y1", "y2", "y3", "x1"];
yvars = [ x2, y1, y2, y3];
zvars = [ x1];
% loop condition 
loop_cond = - y3;

% guard conditions
guard_cond = [
    [y2+1-x2, x2-y2-1],
    [y2+2-x2, -1],
    [x2-y2, -1]
];

% while body
f = [
        [  x2, y1 + 1, 0, y3 - 1, x1],
        [  x2, y1, y2 + 1, y3 - 1, x1],
        [  x2, y1, y2 + 1, y3 - 1, x1]
]; 
        
% pre-condition
pre_cond = [-y1, y1, -y2, y2, y3-x1, x1-y3, -x1, -x2];

% post-condtion
post_cond = [-1];

inv_ineq = [];

inv_deg = 2;