% Constants
X = [0 1; 1 0]; Z = [1 0;0 -1]; Y = 1i * X * Z;
H = (1/sqrt(2) )* (X +Z);

%% Calculations

ket0 = [1; 0];
ket1 = [0; 1];


rho = ket2dm( ket0);
lambda0  = ket2bv( ket0 );
lambda1  = ket2bv( ket1 );

plotBlochSphere

plotBlochVect( H*ket0  )


%% Helper functions
function rho =  ket2dm( ket )
% Convert ket to a density matrix rho.

    rho  = ket * ket';
end

function lambda =  ket2bv( ket )

    rho =  ket2dm( ket );
    X = [0 1; 1 0]; Z = [1 0;0 -1]; Y = 1i * X * Z;
    lambda = [trace(X*rho); trace(Y*rho); trace(Z*rho)];
end

function plotBlochVect( ket )
    lambda = ket2bv( ket );
    
    someBV = line( [0 lambda(1)], [0 lambda(2)], [0 lambda(3)], ...
        'LineWidth', 2, 'Marker', 'o')
end