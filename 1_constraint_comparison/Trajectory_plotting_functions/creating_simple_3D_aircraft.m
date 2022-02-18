clear,clc,close all

%       X       Y       Z
V = [   0.4     0       0       % Port wing
        0.25    0.5     0
        0.05    0.5     0
        0.1     0       0
        0.4     0       0       % Starboard wing
        0.25   -0.5     0
        0.05   -0.5     0
        0.1     0       0   
       -0.5     0       0       % Port horizontal tailplane
       -0.6     0.25    0
       -0.7     0.25    0
       -0.65    0       0
       -0.5     0       0       % Starboard horizontal tailplane
       -0.6    -0.25    0
       -0.7    -0.25    0
       -0.65    0       0   
       -0.5     0       0       % Vertical tailplane
       -0.6     0       0.25
       -0.7     0       0.25
       -0.65    0       0   
        1      -0.05  	0.05   	% Body upper face
       -0.65   -0.05  	0.05
       -0.65    0.05    0.05
        1       0.05    0.05   
        1      -0.05    0   	% Body lower face
       -0.65   -0.05    0
       -0.65    0.05    0
        1       0.05    0   
        1       0.05    0.05   	% Body starboard face
       -0.65    0.05    0.05
       -0.65  	0.05    0
        1       0.05    0       
        1      -0.05    0.05   	% Body port face
       -0.65   -0.05    0.05
       -0.65   -0.05    0
        1      -0.05    0       ];
    
F = [   1       2       3       4
        5       6       7       8   
        9       10      11      12
        13      14      15      16  
        17      18      19      20
        21      22      23      24
        25      26      27      28
        29      30      31      32  
        33      34      35      36  ];

save('simple.mat', 'V', 'F')

trajectory_plot_test2