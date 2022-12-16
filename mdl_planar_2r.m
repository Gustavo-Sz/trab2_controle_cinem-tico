clear all
startup_rtb    
d1 = 0.42;
d2 = 0.31;
wn = 1;
clear links 
links = [
	    Link([0        0         d1       0  0  0], 'standard')
		Link([0        0         d2       0  0  0], 'standard')
		

	];

planar2r= SerialLink(links, 'name', 'Planar 2R');
q0 = [-pi/20, -pi/2];

f = 4e-3;
z0 = 0.6;
phi = 0;
phi2 = pi/3;
alfa = 2e5;
p_bc = [0.5;-0.2];
oc = [320;240];

kp = (f/z0)*[alfa 0; 0 alfa]*[cos(phi) sin(phi); sin(phi) -cos(phi)];
kp2 = (f/z0)*[alfa 0; 0 alfa]*[cos(phi2) sin(phi2); sin(phi2) -cos(phi2)];
xco = (f/z0)*[alfa 0; 0 alfa]*[-cos(phi) -sin(phi);-sin(phi) cos(phi)]*p_bc + oc;
xco2 = (f/z0)*[alfa 0; 0 alfa]*[-cos(phi2) -sin(phi2);-sin(phi2) cos(phi2)]*p_bc + oc;

