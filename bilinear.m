% Synthesize Program Invariants using bilinear SOS

% Initiation
%
yalmip('clear')

% Read benchmark input
%
ex_dubins;
a_var = a;
x_var = x;

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
sdp_var = [a_var];
%vars = [a_var; x_var];

% Encode Pre condition as LMI
g_ax_list = [pre_cond_list, x_range_cond];
l_ax = inv;
sum = 0;
for i=1:length(g_ax_list)
    [sigma_cell{tail}, sigma_coef_cell{tail}] = polynomial(x_var, sdeg);    
    sum = sum+sigma_cell{tail}*g_ax_list(i);
    constraints = [constraints, sos(sigma_cell{tail})];
    sdp_var = [sdp_var; sigma_coef_cell{tail}];
    tail = tail + 1;
end
constraints = [constraints, sos( -l_ax + sum + epsilon)];

% Encode Branch condition as BMI
for j=1:branch_num
    g_ax_list = [inv, guard_list(j), x_range_cond];
    l_ax = inv_f_list(j);
    sum = 0;
    for i=1:length(g_ax_list)
        [sigma_cell{tail}, sigma_coef_cell{tail}] = polynomial(x_var, sdeg);    
        sum = sum+sigma_cell{tail}*g_ax_list(i);
        constraints = [constraints, sos(sigma_cell{tail})];
        sdp_var = [sdp_var; sigma_coef_cell{tail}];
        tail = tail + 1;
    end 
end
constraints = [constraints, sos( -l_ax + sum + epsilon)];

% Encode Post condition as BMI
g_ax_list = [inv, -guard_list, x_range_cond]; 
l_ax = post_cond;
sum = 0;
for i=1:length(g_ax_list)
    [sigma_cell{tail}, sigma_coef_cell{tail}] = polynomial(x_var, sdeg);    
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
    for i=1:length(a_var)
        fprintf('variable a_%d is:',i);
        display(double(a_var(i)));
    end
else
    fprintf('No solution is found:\n'); 
end

return

