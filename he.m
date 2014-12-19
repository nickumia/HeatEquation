function he(nr_fr, Type)

n = 100;
k = 1;
a = 0;
b = 1;
dX = 1/n;
dT = dX/100;

x = a:dX:b;
t = 0:.01:20;

% Initial Heat Profile
for i= 1:n+1
    u(i) = 3*sin(2*pi*x(i)) + 4*sin(3*pi*x(i));
end

% Boundary Conditions
u(1) = 0;
u(n+1) = 0;

% Finite Difference Matrix
D = diffn(n, k, dX, dT, Type);
u = u';

F = moviein(nr_fr); 
up(1:n+1, 1) = u;

% Plot
for i = 1 : nr_fr
    
    for j = 1:n+1
        t1(j) = i;
    end
    up = D*u;
    plot3(x, t1, up)
    hold on
    u = up;
    
    axis([0  b 0 nr_fr -4 6])
    grid on
    title('u(x, 0) = 3sin(2?x) + 4sin(3?x);')
    xlabel('Position (m)')
    ylabel('Time (*10^-^2s)')
    zlabel('Heat Distribution (J)')
    F(:, i) = getframe;         % Put the frame it F vector
end

title('Heat Transfer Play back')
movie(F,1,10)