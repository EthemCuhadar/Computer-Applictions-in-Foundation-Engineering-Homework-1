% ========================= HOMEWORK-01 =====================================
% ===========================================================================


% ========================= Question-1 ======================================

% Find the roots of the following 11th‐degree polynomial. Then find the 
%min,max, mean, median,standard deviation, and variance of the data set
%consisting of the roots (Hint: “roots” function).

% constant variables of x powers
p = [0 0 0 0 0 0.5 3.15 0 -7.2 0 1.32 0];

% root() method is used to calculate roots of function.
r = roots(p);

% Min(), max(), mean(), median(), std(), var() methods are used to
% calculate necessary values
minValue = min(r);
maxValue = max(r);
meanValue = mean(r);
medianValue = median(r);
standardDeviation = std(r);
varianceValue = var(r);

% ======================= Question-2 ========================================

% ======================= Part-a ============================================

% Create a 10x10 magic matrix called my_magic and assign zero to the 
% elements that are not divisible by 7 in a new matrix called my_new_magic.

% my_magic array is created. The values of indices are assigned as shown
% below for an example.
my_magic = [1 2 3 4 5 6 7 8 9 10; 11 12 13 14 15 16 17 18 19 20; 
            21 22 23 24 25 26 27 28 29 30; 31 32 33 34 35 36 37 38 39 40; 
            41 42 43 44 45 46 47 48 49 50; 51 52 53 54 55 56 57 58 59 60;
            61 62 63 64 65 66 67 68 69 70; 71 72 73 74 75 76 77 78 79 80;
            81 82 83 84 85 86 87 88 89 90; 91 92 93 94 95 96 97 98 99 100];

% A new temporary array is created with rem() method. The results were
% logical. Therefore, the array is mutiplied with my_magic array to
% determine the new one which has necessary 0 values.
tmp = rem(my_magic, 7) ~= 0;
my_new_magic = tmp.*my_magic;
my_new_magic

% ======================= Part-b ============================================

% Store “CE461” in a variable, get the 4th digit from its left and 
% extract the corresponding column from the answer of part A. Print 
% the new matrix on the command window.  

% The "CE461" is assigned to newVariable. After that the necessary index is
% extracted and thanks to str2double() method, it converted to number.
newVariable = 'CE461';
columnNumber = str2double(newVariable(4));

% The column is extracted from the previous array.
newColumnVector = my_magic(:, columnNumber);
newColumnVector

% ====================== Question-3 =========================================
% Solve the system of linear equations by using:

% ====================== Part-a =============================================
% Matrix Inversion Method

% The arrays are multiplied as shown below to calculate x values.
A = [12 3 5 0; 5 -6 0 13; 8 4 3 2; -1 20 3 -3];
B = [10; 5; 0; 1];
X = A^-1*B

% ====================== Part-b =============================================
% Built‐in MATLAB function called “linsolve”. 

% linsolve() method is used to calculate x values easily.
linsolve(A, B)

% ====================== Question-4 =========================================

% You are given two arrays named “x” and “y” .
% x = [1.9, 2.0, -3.8, 4.7, 5.5, -7.2]
% y = [1.0, 2.0, 3.8, 2.5, -5.5, -6.8]
% Find the elements whose absolute value is different from each other 
% (only compare the respective elements) and store these elements in a 
% matrix called “diff_ones”. The resulting matrix should be like the
% one given below:

% The x and y arrays are assigned as shown below.
x = [1.9, 2.0, -3.8, 4.7, 5.5, -7.2];
y = [1.0, 2.0, 3.8, 2.5, -5.5, -6.8];

% A temporary vector is created which eliminates the  same absolute values.
tmp = find(abs(x) ~= abs(y));

% After that the new array (diff_ones[]) is created.
diff_ones = [(x(tmp())); y(tmp())];
diff_ones

% ==================== Question-5 ===========================================
% A square footing having 6 m width (B) will be built on a clayey 
% soil profile, and you need to estimate consolidation settlement. 
% Therefore, stress changes beneath the foundation are going to be 
% calculated. By using the 30° method and assuming that the net 
% foundation pressure is 80 kPa, plot Stress Change vs. Depth graph 
% on MATLAB (Take Df = 0 and plot your graph up to Depth = 2*B) 

% Dimensions are assigned.
widthB = 6;  % m    % square footing (B = L)
widthL = 6;  % m    % square footing (B = L)

% The net pressure and range of depth are assigned.
netPressure = 80;  % kPa  % net foundation pressure
zDepth = 0: 0.1: 2*widthB;  % the depth will be plotted up to 2*B meters

% The stress change formula with respect to depth is assigned.
stressChange = (netPressure*widthB*widthL)./ ((widthB + 2*zDepth*tan(pi/6)) ...
    .* (widthL + 2*zDepth*tan(pi/6)));

% The stress change vs depth are plotted.
plot(stressChange, zDepth)

% The ranges of plot for x and y axes are assigned.
xlim([0 80])
ylim([0 12])

% Title and label names are assigned.
title("Stress Change vs Depth")
ylabel("Depth (m)")
xlabel("Stress Change (kPa)")

% For y values (depth) the axis is rearranged in reverse thanks to set()
% method. Also, the position of the x label is located at top.
set (gca,'Ydir','reverse')
set (gca, "xaxisLocation", "top")

% grid lines of the plot are activated
grid on
