% Synthesize Program Invariants using quantified SOS

% Initiation
%
yalmip('clear')

% Read benchmark input
%
ex_dubins;
a_var = a;
x_var = x;

adeg = 6;

M = 10;

% Encode constraints on invariants
%
% pre   : pre_cond(x) <= 0 implies inv(a,x) <= 0 
% branch: for all branch 0 <= i <= branch_num
%         gi(x) <= 0 and inv(a,x) <= 0 implies inv(a,f(x)) <= 0
% post  : Wedge_i [-gi(x) <= 0] and inv(a,x) <= 0 implies post(x) <= 0
g_ax_list = [pre_cond_list, x_range_cond, a_range_cond];
l_ax = inv;
p_a_list(1) = compute_p(a_var, x_var, g_ax_list, l_ax, adeg, sdeg, M, epsilon);
%for i=1:branch_num  
%    p_a_list(1+i) = compute_p(a_var, x_var, g_ax_list, l_ax, adeg, sdeg, M);
%end
%p_a_list(branch_num+2) = compute_p(a_var, x_var, g_ax_list, l_ax, adeg, sdeg, M);
sdisplay(p_a_list(1));

return

% Local Functions

function p_a_val = compute_p(a_var, x_var, g_ax_list, l_ax, adeg, sdeg, M, epsilon)
    a_monomials = monolist(a_var, adeg);
    p = sdpvar(length(a_monomials),1);
    p_a = dot(p,a_monomials);

    % Compute objective function
    %
    moments = [];
    for i = 1:length(a_monomials)
        moments(i) = compute_moment(a_var, a_monomials(i));
    end
    obj = dot(moments,p);

    % Translate into SOS constraints
    %
    vars = [a_var;x_var];
    sigma_cell = {};
    sigma_coef_cell = {};
    constraints = [];
    sdp_var = [p];
    tail = 1;

    % Encode the 1st Constraint 
    %
    sum = 0;
    for i=1:length(g_ax_list)
        [sigma_cell{tail}, sigma_coef_cell{tail}] = polynomial(vars, sdeg);    
        sum = sum+sigma_cell{tail}*g_ax_list(i);
        constraints = [constraints, sos(sigma_cell{tail})];
        sdp_var = [sdp_var; sigma_coef_cell{tail}];
        tail = tail + 1;
    end
    constraints = [constraints, sos( p_a - l_ax + sum + epsilon)];

    % Encode the 2nd Constraint
    %{
    sum2 = 0;
    for i=1:length(x_range)
        [sigma_cell{tail}, sigma_coef_cell{tail}] = polynomial(vars, sdeg);    
        j = ceil(i/2);
        if even(i)
            sum2 = sum2+sigma_cell{tail}*(x_var(j) - x_range(i));        
        else
            sum2 = sum2+sigma_cell{tail}*(x_range(i) - x_var(j)); 
        end
        constraints = [constraints, sos(sigma_cell{tail})];
        sdp_var = [sdp_var; sigma_coef_cell{tail}];
        tail = tail+1;
    end
    onstraints = [constraints, sos( p_a - M + sum2 + epsilon)];
    %}

    options = sdpsettings('solver','mosek','verbose', 0);%1, 'sos.newton',1,'sos.congruence',1);

    diagnostics=  solvesos(constraints, obj, options, sdp_var);   

    if diagnostics.problem == 0
        fprintf('A feasible solution is found:\n'); 
        p_a_val = dot(double(p),a_monomials);
        sdisplay(p_a_val);
    else
        p_a_val = 1;
        fprintf('No solution is found:\n'); 
    end

end

function moment = compute_moment(a_var,a_monomial)
    exp_list = degree(a_monomial,a_var);
    moment = 1;
    for i=1:length(exp_list)
        upper = 1/(exp_list(i)+1);
        lower = (-1)^(exp_list(i)+1)*1/(exp_list(i)+1);
        moment = moment*(upper-lower);
    end
end
