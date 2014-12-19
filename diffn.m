function [D] = diffn(N,k,dX,dT, Type)

if Type == 1
    
    e = ones(N+1, 1);
    r = (k*dT)/dX^2;

    Dtemp = spdiags([e*r 1-(2*r*e) e*r], [-1 0 1], N+1, N+1);

    R1 = [1 zeros(1, N)];
    RN = [zeros(1, N) 1];

    D = [R1; Dtemp(2:N,:);RN];
    
elseif Type == 2
    
    e = ones(N+1, 1);
    r = (k*dT)/dX^2;

    Dtemp = spdiags([-e*r 1+(2*r*e) -e*r], [-1 0 1], N+1, N+1);

    R1 = [1 zeros(1, N)];
    RN = [zeros(1, N) 1];

    D = inv([R1; Dtemp(2:N,:);RN]);
    
end