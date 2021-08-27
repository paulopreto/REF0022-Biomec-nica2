% Toolbox for Analytical Geometry and Linear Algebra
%
%       written by Reginaldo J. Santos on 20 November 1996 
%                  DMat/ICEx/UFMG
%
% 1. VECTORS:
%
% 1.1 Basics:
%plavec(p,v,color) places the vector v in the point p
%ip(v,w) calculates the inner (dot or scalar) product between v and w
%n(v) calculates the 2-norm of v (i.e, sqrt(v1^2+...+vn^2))
%vp(v,w) calculates the vector product between v and w
%proj(w,v) calculates the projection of v on w
% 1.2 Illustrations:
%ILVECIJK(v) illustrates the vector v as a linear combination of i j k
%ILADDVEC(v,w) illustrates the sum v + w of 2 or 3-dimensional vectors
%ILAXV(a,v) illustrates the  product of the scalar a by the vector v
%
% 2. PLANS AND STRAIGHT LINES:
%
% 2.1 Basics:
%POINT1(p,name)  shows a point p 
%POINT2(p1,name1,p2,name2) shows two points p1 and p2
%LINESEG(p1,p2,color) displays the line segment between p1 and p2
%LINE1(p,v,color) displays a straight line 
%PLAN1(p,n,color) displays a plan 
%PARALEG(p1,p2,p3,color) displays a paralelogram 
% 2.2 Others:
%POINPLAN(p1,p2,n2) displays a point and a plan
%POINLINE(p1,p2,v2) displays a point and a straight line
%LINE2(p1,v1,p2,v2) displays two straight lines
%LINEPLAN(p1,v1,p2,n2) displays a straight line and a plan
%PLAN2(p1,n1,p2,n2) displays two plans 
%PLAN3(p1,n1,p2,n2,p3,n3) displays three plans 
%
% 3. Matrices and Linear Systems
%
%tran(A) calculates the matrix transpose   
%dete(A) calculates the determinant of the matrix A  
%ip(v,w) calculates the inner (dot or scalar) product between v and w
%n(v) calculates the norm of v (i.e, sqrt(ip(v,v)))
%vp(v,w) calculates the vector product between v and w
%ro(alpha,i,A) alpha*row i ==> row i of the matrix A
%ro(alpha,i,j,A) alpha*row i + row j ==> row j of the matrix A
%rs(i,j,A) interchanges rows i <==> row j of the matrix A
%detpivo(i,A) determines the pivot below the row i-1 of the matrix A
%srref(A) step by step reduced row echelon form of the matrix A
%showmat([A1 ... An],n) places n matrices in the graphical window
%showsys([A1 b1 ... An bn],n) shows graphically n systems Aix=bi
%
% 4. UTILITIES:
%
%axisc        plots the coordinates axes
%box          makes a box around the picture
%axiss        makes the current axis box square
%rota         makes a rotation around the axis z
%zoom3(factor)  amplifies the region by the factor factor
%tex(p,string) places the text string in the point p
%plotfun1	Easy to use one variable function plotter.
%plotsurf	Easy to use surface plotter.
%plotfun2	Easy to use 2 variables function plotter.
%plotcur3	Easy to use curve plotter in 3D.
%
%Commands for information by sections: 
%      help gaal1, help gaal2, help gaal3, help gaal4
%
%Commands to get started:
%      demog1 demonstrates the functions of Vectors 
%      demog2 demonstrates the functions of Planes and Lines
%      demosys demonstrates the functions of Linear Systems
%
%Command for more information about each function: 
%      help   the name of function
