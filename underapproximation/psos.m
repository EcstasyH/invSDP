tic
yalmip('clear')

% Read benchmark
% ex_simple;
% ex_unicycle;

ex_equil;

epsilon = 0.1;
M = -10;

vars = [a; x];

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
for i = 1:length(x)
    x_range_cond(2*i-1) = x_range(2*i-1)-x(i);
    x_range_cond(2*i) = x(i)-x_range(2*i);
end
range_cond= [a_range_cond, x_range_cond];

% Encode SOS constraints
%
sdp_var = [coef_p];
constraints = [];
sigma_cell = {};
sigma_coef_cell = {};
tail = 1;

sdp_cons = {vars, sdp_var, constraints, sigma_cell, sigma_coef_cell, tail};

% pre cond
sdp_cons = translateSOS([pre_cond, range_cond], inv - p_a, sdp_cons, sdeg, epsilon);

% inductive
for j = 1:branch_num
    sdp_cons = translateSOS([loop_cond, guard_cond_list(j), inv, range_cond], replace(inv, x, f_list(:,j))-p_a, sdp_cons, sdeg, epsilon);
end

%post
for j = 1:length(post_cond)
    % -loopcond
    sdp_cons = translateSOS([inv, range_cond, -loop_cond], post_cond(j)-p_a, sdp_cons, sdeg, epsilon);
end

% M
sdp_cons = translateSOS([range_cond], M - p_a, sdp_cons, sdeg, epsilon);

vars = sdp_cons{1};
sdp_var = sdp_cons{2};
constraints = sdp_cons{3};
sigma_cell  = sdp_cons{4}; 
sigma_coef_cell = sdp_cons{5};
tail = sdp_cons{6};

options = sdpsettings('solver','mosek','verbose', 0, 'sos.newton',1,'sos.congruence',1);

diagnostics=  solvesos(constraints, obj, options, sdp_var);   

if diagnostics.problem == 0
    %fprintf('A feasible solution is found.\n')
    sol = 1;
    p_val = double(coef_p);
    for i = 1:length(p_val)
        if abs(p_val(i)) <= 10^(-5)
            p_val(i) = 0.0;
        end
    end
    p_a_val = dot(p_val,a_monomials);
    
    
    s = string(sdisplay(dot(p_val,a_monomials)));
    s = strrep(s, 'a(1)', 'a1');
    s = strrep(s, 'a(2)', 'a2');
    s = strrep(s, 'a(3)', 'a3');
    display(s);
    %display(a_range);
    %{
    fprintf('A solution is found: %f\n',p_a_val); 
    if p_a_val <= 0
        fprintf('Minimal Point: \n');
        for i = 1:adim
            min = a_range(2*i-1);
            max = a_range(2*i);
            a_val(i) = (max-min)/2*a_val(i)+(max+min)/2;
            fprintf('a%d = %f \n',i, a_val(i));    
        end
    end
    %}
else
    fprintf('No solution is found:\n'); 
end
toc

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
