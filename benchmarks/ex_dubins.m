% Dubin's car example

% Program variables
%
x = sdpvar(2,1);
a = sdpvar(2,1);

% Program body
%
d = 0.01;
w = 1.0178 + 1.8721 * x(1) - 0.0253 * x(2);    
% branches
branch_num = 1;
f1 = [ x(1) + d*(1-x(2)*w); x(2) + d*x(1)*w ];
f_list = [f1];
guard_list = [-1];
% pre-conditions
pre_cond_list = [x(1)^2 + (x(2)-1)^2 - 1];
% post-condtion
post_cond = x(1)^2 + (x(2)-1)^2 - 4;
% invariant template
inv = x(1)^2 + a(1)*x(2)^2 - 2*a(1)*x(2) + a(2); 
% variable range
x_range = [-100, 100, -100, 100];
a_range = [0.95, 1.05, -2.0, 2.0];

% Pre-processing
%
% scaling of a_var
a_scaled = a;
for i = 1:length(a)
    min = a_range(2*i-1);
    max = a_range(2*i);
    a_scaled(i) = (max-min)/2*a_scaled(i)+(max+min)/2;
end
% generate inv and inv_f_list
inv = replace(inv, a, a_scaled);
for i=1:branch_num
    inv_f_list(i) = replace(inv, x, f_list(i,:));
end
inv_f_list = replace(inv_f_list, a, a_scaled);
% make box constraints for a_var and x_var
for i = 1:length(a)
    a_range_cond(2*i-1) = -1-a(i);
    a_range_cond(2*i) = a(i)-1;
end
for i = 1:length(x)
    x_range_cond(2*i-1) = x_range(2*i-1)-x(i);
    x_range_cond(2*i) = x(i)-x_range(2*i);
end

% Parameters in SOS constraints translation
%
sdeg = 4;
epsilon = 0.01;