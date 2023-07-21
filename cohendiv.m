% Synthesize Program Invariants using bilinear SOS
function val = cohendiv(a_range)

% Initiation
%
yalmip('clear')

% SOS parameters
sdeg = 4;
adeg = 2;
epsilon = 0.1;
M = 10;

% benchmark
%
sdpvar y x r;
a = sdpvar(3,1);
vars = [a;x;r];


a_monomials = [a(1)^2, a(2)^2, a(3)^2, a(1), a(2), a(3), 1];
p = sdpvar(length(a_monomials),1);
p_a = dot(p,a_monomials);  

moments = [];
for i = 1:length(a_monomials)
    moments(i) = compute_moment(a, a_monomials(i));
end
obj = dot(moments,p);

%{
a_monomials = monolist(a, adeg);
p = sdpvar(length(a_monomials),1);
p_a = dot(p,a_monomials);  

moments = [];
for i = 1:length(a_monomials)
    moments(i) = compute_moment(a, a_monomials(i));
end
obj = dot(moments,p);
%}

inv = y - a(1)*x - a(2)*r^2 - a(3)*r;

a_scaled = a;
for i = 1:length(a)
    min = a_range(2*i-1);
    max = a_range(2*i);
    a_scaled(i) = (max-min)/2*a_scaled(i)+(max+min)/2;
end
%
%% generate inv and inv_f_list
inv = replace(inv, a, a_scaled);


inv_f = replace(inv, [x, r], [x-r, r+1]);

sigma_cell = {};
sigma_coef_cell = {};
constraints = [];
sdp_var = [p];
tail = 1;

a_range_cond = [-1-a(1), a(1)-1, -1-a(2), a(2)-1, -1-a(3), a(3)-1];

%a_range_cond = [-a(1), a(1)-1, -a(2), a(2)-1, -a(3), a(3)-1];

x_range_cond = [ -x, x-10, -r , r-10];

range_cond= [a_range_cond,x_range_cond];

% inv
g_ax_list = [r-x, x_range_cond, a_range_cond]; 
l_ax = inv_f;
sum = inv;
for i=1:length(g_ax_list)
    if sdeg-evendegree(g_ax_list(i))<0
        fprintf('Error: sdeg is too small.\n');
        return
    end
    [sigma_cell{tail}, sigma_coef_cell{tail}] = polynomial(vars, sdeg-evendegree(g_ax_list(i)));    
    sum = sum+sigma_cell{tail}*g_ax_list(i);
    constraints = [constraints, sos(sigma_cell{tail})];
    sdp_var = [sdp_var; sigma_coef_cell{tail}];
    tail = tail + 1;
end
constraints = [constraints, sos( p_a - l_ax + sum + epsilon)];

% post

g_ax_list =  [x-r, x_range_cond, a_range_cond];
l_ax = y-r^2-r;
sum3 = inv;
for i=1:length(g_ax_list)
    if sdeg-evendegree(g_ax_list(i))<0
        fprintf('Error: sdeg is too small.\n');
        return

    end
    [sigma_cell{tail}, sigma_coef_cell{tail}] = polynomial(vars, sdeg-evendegree(g_ax_list(i)));    
    sum3 = sum3+sigma_cell{tail}*g_ax_list(i);
    constraints = [constraints, sos(sigma_cell{tail})];
    sdp_var = [sdp_var; sigma_coef_cell{tail}];
    tail = tail + 1;
end

constraints = [constraints, sos( p_a - l_ax + sum3 + epsilon)];

%{
sum2 = 0;
for i=1:length(range_cond)
    if sdeg-2< 0
        fprintf('Error: sdeg is too small.\n');
        return 
    end
    [sigma_cell{tail}, sigma_coef_cell{tail}] = polynomial(vars, sdeg-2);    
    sum2 = sum2+sigma_cell{tail}*range_cond(i);        
    constraints = [constraints, sos(sigma_cell{tail})];
    sdp_var = [sdp_var; sigma_coef_cell{tail}];
    tail = tail+1;
end
constraints = [constraints, sos( p_a + M + sum2 + epsilon)];

%}

constraints = [constraints, p(1)>= 0, p(2) >= 0, p(3) >= 0]; %, 2*p(1)+p(4)>=0, 2*p(1)-p(4)>=0, 2*p(2)+p(5)>=0, 2*p(2)-p(5)>=0, 2*p(3)+p(6)>=0, 2*p(3)-p(6)>=0];

options = sdpsettings('solver','mosek','verbose', 0);%1, 'sos.newton',1,'sos.congruence',1);

diagnostics=  solvesos(constraints, obj, options, sdp_var);   

if diagnostics.problem == 0
    %fprintf('A feasible solution is found.\n')
    sol = 1;
    p_val = double(p);
    for i = 1:length(p_val)
        if abs(p_val(i)) <= 10^(-5)
            p_val(i) = 0.0;
        end
    end
    p_a_val = dot(p_val,a_monomials);
    
    %val = p_val(7)-(p_val(4)^2/p_val(1)^2+p_val(5)^2/p_val(2)^2+p_val(6)^2/p_val(3)^2)*1/4;
    for i = 1:3
        bottom = p_val(i+3)^2/(4*p_val(i)^2);
        if bottom<= -1
            p_a_val = replace(p_a_val, a(i),-1);
        elseif bottom >= -1
            p_a_val = replace(p_a_val, a(i),1);
        else
            p_a_val = replace(p_a_val, a(i),bottom);
        end
    end
    val = p_a_val;

    if val <= 0
        s = string(sdisplay(dot(p_val,a_monomials)));
        s = strrep(s, 'a(1)', 'a1');
        s = strrep(s, 'a(2)', 'a2');
        s = strrep(s, 'a(3)', 'a3');
        display(s);
    end

else
    fprintf('No solution is found:\n'); 
    val = 1000; 
end

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