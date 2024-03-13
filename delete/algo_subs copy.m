% based on substitution
tic;
yalmip('clear')

% benchmarks

% ex_berkeley;
% 2.4s

% ex_cohencu;
% 1.1s

% ex_cohendiv; 
% 1.0s>>

% ex_euclidex2;
% 4.8s

%ex_fermat2;
% 1.5s

% ex_firefly;
% 4.7

ex_freire1;
% 0.6s

%ex_freire2;
% 1.0s

% ex_illinois;
% 7.3s

% ex_lcm;  
% 2.8s

% ex_mannadiv;
% 1.4s

%ex_mesi;
% 2.7s

% ex_moesi;
% 1.3s

% ex_petter;
% 0.6s

% ex_readerswriters;
% 3.3s

% ex_sqrt;
% 1.0s ***
% fail if two post condition

%ex_wensley;
% 4.2s

%ex_z3sqrt
% 1.45s


epsilon = 0; % relaxation in computation, can be removed

sdp_var = [coef_p];
constraints = [];
sigma_cell = {};
sigma_coef_cell = {};
tail = 1;

% Encode constraints on invariants
sdp_cons = {vars, sdp_var, constraints, sigma_cell, sigma_coef_cell, tail};

%pre-condition
q = replace(inv_eq_var - inv_eq_masked, vars, pre_cond_eq);
sdp_cons = translateSOS([pre_cond_ineq, range_cond], q, sdp_cons, sdeg, epsilon);
sdp_cons = translateSOS([pre_cond_ineq, range_cond], -q, sdp_cons, sdeg, epsilon);

%inductive-condition
for i = 1:branch_num
    for j = 1:length(inv_eq_var)
        %sdisplay(inv_eq_var(j) - inv_eq_masked(j))
        q = replace(inv_eq_var(j) - inv_eq_masked(j), vars, f_list(:,i));
        q = replace(q, inv_eq_var, inv_eq_masked);
        %q = inv_eq_var - inv_eq_masked - replace(inv_eq_var - inv_eq_masked, vars, f_list(:,i));
        sdp_cons = translateSOS([inv_ineq, loop_cond, guard_cond_list(i,:), range_cond], q, sdp_cons, sdeg, epsilon);
        sdp_cons = translateSOS([inv_ineq, loop_cond, guard_cond_list(i,:), range_cond], -q, sdp_cons, sdeg, epsilon);
        %sdp_cons = translateSOS([inv_ineq, loop_cond, guard_cond_list(i,:), range_cond], q, sdp_cons, sdeg, epsilon);
    end
end

% post-condition
for i = 1: length(post_cond_ineq)
    q = post_cond_ineq(i);
    q = replace(q, inv_eq_var, inv_eq_masked);
    sdp_cons = translateSOS([inv_ineq, -loop_cond, range_cond], q, sdp_cons, sdeg, epsilon);
end

vars = sdp_cons{1};
sdp_var = sdp_cons{2};
constraints = sdp_cons{3};
sigma_cell  = sdp_cons{4}; 
sigma_coef_cell = sdp_cons{5};
tail = sdp_cons{6};

options = sdpsettings('solver','mosek','verbose', 0, 'sos.newton',1,'sos.congruence',1);
diagnostics =  solvesdp(constraints, 0, options, sdp_var);

if diagnostics.problem == 0
    fprintf('A feasible solution is found.\n')
    sol = 1;
    coef_p_val = double(coef_p);
    for i = 1:length(coef_p_val)
        if abs(coef_p_val(i)) <= 10^(-4)
            coef_p_val(i) = 0.0;
        end
    end
    inv_val = dot(coef_p_val, mono_p);
    sdisplay(inv_val);
else
    fprintf('No feasible solution is found.\n')
    sol = 0;
end
toc;


function sdp_cons = translateSOS(pre_list, post, sdp_cons, sdeg, epsilon)
    vars = sdp_cons{1};
    sdp_var = sdp_cons{2};
    constraints = sdp_cons{3};
    sigma_cell  = sdp_cons{4}; 
    sigma_coef_cell = sdp_cons{5};
    tail = sdp_cons{6};
    sum = 0;
    for i = 1:length(pre_list)
        [sigma_cell{tail}, sigma_coef_cell{tail}] = polynomial(vars, sdeg);    
        sum = sum + sigma_cell{tail} * pre_list(i);
        constraints = [constraints, sos(sigma_cell{tail})];
        sdp_var = [sdp_var; sigma_coef_cell{tail}];
        tail = tail + 1;
    end
    constraints = [constraints, sos( - post + sum + epsilon)];
    sdp_cons = {vars, sdp_var, constraints, sigma_cell, sigma_coef_cell, tail};
end
