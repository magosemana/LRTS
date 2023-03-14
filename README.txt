The repository LIGGGHTS Rectangular Triaxial Script (LRTS)
contains the script for the execution of three types of
rectangular triaxial tests.

- 2D Monodisperse
 LIGGGHTS cannot work in a 2D environement. A 2D simulation
can then be approximated by the création of a narrow box
of width matching the diameter of particles.

- 2D Superquadrics
 A second proposition to create a 2D specimen is to simulate
disks as a superquadric particle. To lauch this function one
must be sure to allow superquadric mechanics upon the making
of the lmp_auto file.

-3D Triaxial Tests
 This is the most developped simulation. Through the file 
0_Execution the user may choose wich type of triaxial 
simulation to be executed (drained, undrained, Constant 
deviatoric stress) and the parameters associeted with 
the simulations.

PS: A code highlighter for the code reader SUBLIMETEXT 
is available at the following repository : 
git@github.com:magosemana/SublimeLiggghts.git