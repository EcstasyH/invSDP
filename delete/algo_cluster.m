function algo_cluster(benchmark, adeg)

tic
yalmip('clear')
epsilon = 0;

run(strcat('ex2_',benchmark,'.m'))

% Read benchmark

% ex2_cohencu;
% ex2_cohencu2;
% ex2_cohencu3;
% ex2_freire1;
% ex2_freire12;
% ex2_freire13;

% ex2_examplenew;
% ex2_unicycle;
% ex2_circuit;
% ex2_overview; 

epsilon = 0;
M = -1;

lvars = [a, vars];


% if degree(f)>= adeg
%     sdeg = degree(f)+1;
% else
%     sdeg = adeg+1;
% end
% degrees = sdeg;

% Set p_a template and compute objective function
%
[p_a, coef_p] = polynomial(a, adeg);
a_monomials = monolist(a, adeg);

% Scaling "a" variables
% 
a_scaled = a;
for i = 1:length(a)
    min = a_range(2*i-1);
    max = a_range(2*i);
    a_scaled(i) = (max-min)/2*a_scaled(i)+(max+min)/2;
end

inv = replace(inv, a, a_scaled);

moments = [];
for i = 1:length(a_monomials)
    moments(i) = compute_moment(a, a_monomials(i));
end
obj = dot(moments,coef_p);

% make box constraints for a_var and x_var
for i = 1:length(a)
    a_range_cond(2*i-1) = -1-a(i);
    a_range_cond(2*i) = a(i)-1;
end
range_cond= [a_range_cond, range_cond];

% Encode SOS constraints
%
sdp_var = [coef_p];
constraints = [];
sigma_cell = {};
sigma_coef_cell = {};
tail = 1;

sdp_cons = {lvars, sdp_var, constraints, sigma_cell, sigma_coef_cell, tail};

% pre cond
q = replace(inv, vars, pre_cond_eq);
sdp_cons = translateSOSnew([pre_cond, range_cond], q - p_a, sdp_cons, sdeg, epsilon,degrees);

% inductive
sz = size(f);
for j = 1:sz(1)
    sdp_cons = translateSOSnew([inv, inv_ineq, loop_cond, guard_cond(j), range_cond], replace(inv, vars, f(j,:))-p_a, sdp_cons, sdeg, epsilon,degrees);
end

%post
for j = 1:length(post_cond)
    sdp_cons = translateSOSnew([inv, range_cond, -loop_cond], post_cond(j)-p_a, sdp_cons, sdeg, epsilon,degrees);
end

% M
sdp_cons = translateSOSnew([range_cond], M - p_a, sdp_cons, sdeg, epsilon,degrees);

lvars = sdp_cons{1};
sdp_var = sdp_cons{2};
constraints = sdp_cons{3};
sigma_cell  = sdp_cons{4}; 
sigma_coef_cell = sdp_cons{5};
tail = sdp_cons{6};

options = sdpsettings('solver','mosek','verbose', 0, 'sos.newton',1,'sos.congruence',1);

% toc 
fprintf("Begin Solving...\n");

diagnostics=  solvesos(constraints, obj, options, sdp_var);   

if diagnostics.problem == 0
    %fprintf('A feasible solution is found.\n')
    sol = 1;
    p_val = double(coef_p);
    for i = 1:length(p_val)
        p_val(i) = round(p_val(i), 5);
    end
    p_a_val = dot(p_val,a_monomials);
    s = string(sdisplay(dot(p_val,a_monomials)));
    s = strrep(s, 'a(1)', 'a1');
    s = strrep(s, 'a(2)', 'a2');
    s = strrep(s, 'a(3)', 'a3');
    s = strrep(s, 'a(4)', 'a4');
    display(s);
else
    fprintf('No solution is found:\n'); 
end
toc
    return
end

% Local Functions

function moment = compute_moment(a,a_monomial)
    exp_list = degree(a_monomial,a);
    moment = 1;
    for i=1:length(exp_list)
        upper = 1/(exp_list(i)+1);
        lower = (-1)^(exp_list(i)+1)*1/(exp_list(i)+1);
        moment = moment*(upper-lower);
    end
end


function deg2 = evendegree(poly)
    deg = degree(poly);
    if even(deg)
        deg2 = deg;
    else
        deg2 = deg + 1;
    end
end

function sdp_cons = translateSOSnew(pre_list, post, sdp_cons, sdeg, epsilon, degrees)
    vars = sdp_cons{1};
    sdp_var = sdp_cons{2};
    constraints = sdp_cons{3};
    sigma_cell  = sdp_cons{4}; 
    sigma_coef_cell = sdp_cons{5};
    tail = sdp_cons{6};
    sum = 0;
    for i = 1:length(pre_list)
        [sigma_cell{tail}, sigma_coef_cell{tail}] = polynomial(vars, degrees-degree(pre_list(i)));    
        sum = sum + sigma_cell{tail} * pre_list(i);
        constraints = [constraints, sos(sigma_cell{tail})];
        sdp_var = [sdp_var; sigma_coef_cell{tail}];
        tail = tail + 1;
    end
    constraints = [constraints, sos( - post + sum + epsilon)];
    sdp_cons = {vars, sdp_var, constraints, sigma_cell, sigma_coef_cell, tail};
end