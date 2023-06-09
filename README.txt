The repository LIGGGHTS Rectangular Triaxial Script (LRTS)
contains the script for the execution of three types of
rectangular triaxial tests.

How to use : 
 1) copy and paste lmp_auto file generated by LIGGGHTs 
  "make auto" in the directory of the simulation.
 2)modify the ".liggghts" file, adjusting parameters 
  to match the desired simulation. 
 3)Launch "LiggghtsExe.sh" execution file. This file 
  can also be modified to change the number of cpu cores
  used in the simulation or the folders the data are
  saved on.

Simulation details :
- 2D Drained Monodisperse
 LIGGGHTS cannot work in a 2D environement. A 2D simulation
can then be approximated by narrow box of width matching 
the diameter of particles, thus blocking movement in the x
direction.

- 2D Drained Superquadrics
 A second proposition to create a 2D specimen is to simulate
disks as a superquadric particle. To lauch this function one
must be sure to allow superquadric mechanics upon the making
of the lmp_auto file.

- 3D Triaxial Tests
 This is the most developped simulation. Through the file 
0_Execution the user may choose wich type of triaxial 
simulation to be executed (drained, undrained, Constant 
deviatoric stress) and the parameters associeted with 
the simulations.

PS: A highlighter for the code reader SUBLIMETEXT 
is available at the following repository : 
git@github.com:magosemana/SublimeLiggghts.git