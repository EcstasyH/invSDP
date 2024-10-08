function algo_mask(benchmark)

tic;
yalmip('clear')

run(strcat('ex_',benchmark,'.m'))

epsilon = 0;%10^(-5); % numerical tolerence

% store information of SOS polynomials
inv_eq = [];
sdp_var = [];
constraints = [];
sigma_cell = {};
sigma_coef_cell = {};
tail = 1;
coef = [];

if mod(inv_deg,2) == 1
    sdeg = inv_deg+1;
else
    sdeg = inv_deg;
end

sum_para = 0;
% set invariant template
for i = 1:length(zvars)
    [p, coef_p] = polynomial(yvars, inv_deg);
    sum_para = sum_para + length(coef_p);
    inv_eq = [inv_eq, p];
    sdp_var = [sdp_var; coef_p];
    coef = [coef, coef_p]; 
end

fprintf("Number of yvars: %g\n", length(yvars));
fprintf("Number of zvars: %g\n", length(zvars));
fprintf("Number of parameters: %g\n", sum_para);


sdp_cons = {[yvars, zvars], sdp_var, constraints, sigma_cell, sigma_coef_cell, tail};

% Encode constraints on invariants

% pre-condition
for i = 1: length(zvars)
    sdp_cons = translateSOS([pre_cond], zvars(i) - inv_eq(i), sdp_cons, sdeg, epsilon);
    sdp_cons = translateSOS([pre_cond], inv_eq(i) - zvars(i), sdp_cons, sdeg, epsilon);
end
for i = 1: length(inv_ineq)
    sdp_cons = translateSOS([pre_cond], inv_ineq(i), sdp_cons, sdeg, epsilon);
end
    
% inductive-condition
sz = size(f);
for i = 1:sz(1)
    for j = 1:length(zvars)
        left = f(i, length(yvars)+j);
        left = replace(left, zvars, inv_eq);
        right = replace(inv_eq(j), yvars, f(i, 1:length(yvars)));
        sdp_cons = translateSOS([inv_ineq, loop_cond, guard_cond(i,:)], left-right, sdp_cons, sdeg, epsilon);
        sdp_cons = translateSOS([inv_ineq, loop_cond, guard_cond(i,:)], right-left, sdp_cons, sdeg, epsilon);
    end
    for j = 1:length(inv_ineq)
        sdp_cons = translateSOS([inv_ineq, loop_cond, guard_cond(i,:)], replace(inv_ineq(j), yvars, f(i,1:length(yvars))), sdp_cons, sdeg, epsilon);
    end
end

% post-condition
for i = 1: length(post_cond)
    sdp_cons = translateSOS([inv_ineq, -loop_cond], replace(post_cond(i), zvars, inv_eq), sdp_cons, sdeg, epsilon);
end

% set optimization problem
vars = sdp_cons{1};
sdp_var = sdp_cons{2};
constraints = sdp_cons{3};
sigma_cell  = sdp_cons{4}; 
sigma_coef_cell = sdp_cons{5};
tail = sdp_cons{6};

% options = sdpsettings('solver','sdpa','verbose', 0);
options = sdpsettings('solver','mosek','verbose', 0, 'sos.newton',1,'sos.congruence',1, 'mosek.MSK_DPAR_ANA_SOL_INFEAS_TOL', 10^(-4));
diagnostics =  solvesdp(constraints, 0, options, sdp_var);
elapsedTime = toc;
% print results into files
fileID = fopen(strcat('results/mask/', benchmark,'.txt'), 'w');

if diagnostics.problem == 0
    fprintf(fileID, 'success\n%.2f\n', elapsedTime);

    sol = 1;
    for j = 1:length(zvars)    
        fprintf(fileID, strcat(name(j+length(yvars)), '\n'));

        coef_p_val = double(coef(:,j));
        monomials_str = sdisplay(monolist(yvars, inv_deg));
        for i = 1:length(monomials_str)
            for k = 1:length(yvars)
                internal_name = evalc(strcat('sdisplay(', name(k), ')'));
                internal_name = internal_name(1:length(internal_name)-1);
                monomials_str{i} = strrep(monomials_str{i}, internal_name, name(k));
            end
        end

        for i = 1:length(coef_p_val)
            % disp(rat(coef_p_val(i),1e-5));
            fprintf(fileID, strcat(rat(coef_p_val(i),1e-5), '\t') );
            fprintf(fileID, strcat(monomials_str{i}, '\t'));
            coef_p_val(i) = round(coef_p_val(i), 5);
        end
        fprintf(fileID, '\n');


        inv_val = dot(coef_p_val, monolist(yvars, inv_deg));
        
        inv_val_s = evalc('sdisplay(inv_val)');
        for i = 1:length(yvars)
            ss = evalc(strcat('sdisplay(', name(i), ')'));
            ss = ss(1:length(ss)-1);
            inv_val_s = strrep(inv_val_s, ss, name(i));
        end
        % inv_val_s = inv_val_s(1:length(inv_val_s)-1);
        fprintf(strcat(name(j+length(yvars))," = ", inv_val_s));

    end
else
    fprintf(fileID, 'fail\n%.2f\n', elapsedTime);
    sol = 0;
end
fprintf('time: %f.2\n', elapsedTime);
fclose(fileID);
end

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
        % [sigma_cell{tail}, sigma_coef_cell{tail}] = polynomial(vars, sdeg-degree(pre_list(i)));    
        sum = sum + sigma_cell{tail} * pre_list(i);
        constraints = [constraints, sos(sigma_cell{tail}+epsilon)];
        sdp_var = [sdp_var; sigma_coef_cell{tail}];
        tail = tail + 1;
    end
    constraints = [constraints, sos( - post + sum + epsilon)];
    sdp_cons = {vars, sdp_var, constraints, sigma_cell, sigma_coef_cell, tail};
end
