%All link lengths and offsets are measured in m 
clear all
clear links
%            theta      d           a       alpha
links = [
	    Link([0        -0.2848         0       pi/2  0  0], 'standard')
		Link([0        -0.0118         0       pi/2  0  pi], 'standard')
		Link([0        -0.4208         0       pi/2  0  pi], 'standard')
		Link([0        -0.0128         0       pi/2  0  pi], 'standard')
		Link([0        -0.3143         0       pi/2  0  pi], 'standard')
	 	Link([0         0              0       pi/2  0  pi], 'standard')
        Link([0         0              0       pi    0  pi], 'standard')

	];

gen3=SerialLink(links, 'name', 'Kinova Gen3');
gen3.base=trotx(180);

q0 = [0, 15, 180, -130, 0, 55, 90];
