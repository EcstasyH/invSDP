function [sol, bc_val] = ComputeTolerantBC2D(deg)

tic

yalmip('clear')

sol=0; % =1 if a verified TolerantBC is found
bc_val=0; 

% d: random disturbance
sdpvar x y d;
sdpvar gamma_p;

% read input
% f: vector field 2D
% S0: init
% Su: unsafe
% Sd: domain
% d: disturbance under uniform distribution [dmin,dmax]
[f, S0, Su, Sd, dmin, dmax] = Ex_BC_RLCcircuit2D(x,y,d);

[bc , coef_bc] = polynomial([x y], deg);
bcf = replace(bc, [x y], f);
ebc = 1/(dmax-dmin)*int(bcf, d, dmin, dmax);

% constraints for TolerantBC
% 1. -B(x)+gamma >= 0 over S0
% 2. B(x) >= 0 over Sd
% 3. B-E(B) >= 0 over Sd
% 4. B-E(B)-1 >= 0 over Su
% sdeg: degree of SOS term
sdeg = deg+4; % +4 by default
[s1, coef_s1] = polynomial([x y], sdeg);
[s2, coef_s2] = polynomial([x y], sdeg);
[s3, coef_s3] = polynomial([x y], sdeg);
[s4, coef_s4] = polynomial([x y], sdeg);

% sos constraints of degree sos_deg 
constraints = [ sos( -bc + gamma_p + s1*S0),...,
                sos(  bc + s2*Sd ),...,
                sos(  bc - ebc + s3*Sd),...,
                sos(  bc - ebc - 1 + s4*Su),...,
                coef_bc>=-100, coef_bc<=100, ...,
                sos(s1), sos(s2), sos(s3), sos(s4)];

options = sdpsettings('solver','mosek','verbose', 0, 'sos.newton',1,'sos.congruence',1);

diagnostics=  solvesdp(constraints, gamma_p, options, [gamma_p;coef_bc;coef_s1;coef_s2;coef_s3;coef_s4]);

if diagnostics.problem == 0
    sol=1;
    fprintf('A feasible solution is found at degree %d:',deg); 
    
    coef_val = double(coef_bc);
    % if the abolute value of a coefficient is less than 10^-5, 
    % then remove this term
    for i = [1:length(coef_val)]
        if abs(coef_val(i)) <= 1e-5
            coef_val(i)=0;
        end
    end
    v = monolist([x y], deg);
    bc_val = v' * coef_val;
    
    disp('Tolerant BC (unverified):'); 
    sdisplay(bc_val);
    disp('gamma:');
    display(double(gamma_p));
    %bcf_val = replace(bc_val, [x y], f);
    %ebc_val = 1/2*int(bcf_val, d, -1, 1);
    %sdisplay(ebc_val-bc_val);
else
    disp('No solution is found.');
    bc_val = 0;
end
toc
return
