% Synthesize Program Invariants using BMI

% Initiation
%
yalmip('clear')

% Read benchmark input
%
ex_simple;
%ex_dubins;

a_scaled = a;
for i = 1:length(a)
    min = a_range(2*i-1);
    max = a_range(2*i);
    a_scaled(i) = (max-min)/2*a_scaled(i)+(max+min)/2;
end

inv = replace(inv, a, a_scaled);
for i = 1:length(a)
    a_range_cond(2*i-1) = -1-a(i);
    a_range_cond(2*i) = a(i)-1;
end
for i = 1:length(x)
    x_range_cond(2*i-1) = -4-x(i);
    x_range_cond(2*i) = x(i)-4;
end
%ex_overview;

% Encode constraints on invariants
% 
% pre   : pre_cond(x) <= 0 implies inv(x;a) <= 0 
% branch: for all branch 1 <= i <= branch_num
%         gi(x) <= 0 and inv(x;a) <= 0 implies inv(f(x);a) <= 0
% post  : Wedge_i [-gi(x) <= 0] and inv(x;a) <= 0 implies post(x) <= 0 

% translate into SOS/LMI constraints
sigma_cell = {};
sigma_coef_cell = {};
tail = 1;
constraints = [];
sdp_var = [a];
%vars = [a; x];

% Encode Pre condition as LMI
g_ax_list = [pre_cond, x_range_cond];
l_ax = inv;
sum = 0;
for i=1:length(g_ax_list)
    [sigma_cell{tail}, sigma_coef_cell{tail}] = polynomial(x, sdeg);    
    sum = sum+sigma_cell{tail}*g_ax_list(i);
    constraints = [constraints, sos(sigma_cell{tail})];
    sdp_var = [sdp_var; sigma_coef_cell{tail}];
    tail = tail + 1;
end
constraints = [constraints, sos( -l_ax + sum + epsilon)];

% Encode Branch condition as BMI

for j=1:branch_num
    %g_ax_list = [inv, guard_cond_list(j), x_range_cond];
    g_ax_list = [inv, x_range_cond];
    l_ax = replace(inv, x, f_list(:,j));
    sum = 0;
    for i=1:length(g_ax_list)
        [sigma_cell{tail}, sigma_coef_cell{tail}] = polynomial(x, sdeg);    
        sum = sum+sigma_cell{tail}*g_ax_list(i);
        constraints = [constraints, sos(sigma_cell{tail})];
        sdp_var = [sdp_var; sigma_coef_cell{tail}];
        tail = tail + 1;
    end 
end
constraints = [constraints, sos( -l_ax + sum + epsilon)];

% Encode Post condition as BMI

g_ax_list = [inv, -guard_cond_list, x_range_cond]; 
l_ax = post_cond;
sum = 0;
for i=1:length(g_ax_list)
    [sigma_cell{tail}, sigma_coef_cell{tail}] = polynomial(x, sdeg);    
    sum = sum+sigma_cell{tail}*g_ax_list(i);
    constraints = [constraints, sos(sigma_cell{tail})];
    sdp_var = [sdp_var; sigma_coef_cell{tail}];
    tail = tail + 1;
end
constraints = [constraints, sos( -l_ax + sum + epsilon)];

% add a_range into constraints
%
for i=1:length(a_range_cond)
    constraints = [constraints, a_range_cond(i)<=0];
end

% Set objective function
%
obj = 0;

options = sdpsettings('solver','penlab','verbose', 1);
diagnostics=  solvesos(constraints, obj, options, sdp_var);   

if diagnostics.problem == 0
    fprintf('A feasible solution is found:\n'); 
    %p_a_val = dot(double(p),a_monomials);
    for i=1:length(a)
        fprintf('variable a_%d is:',i);
        display(double(a(i)));
    end
else
    fprintf('No solution is found:\n'); 
end

return

