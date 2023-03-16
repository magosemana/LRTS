###This function will do the following things :
#1 - create the necessary folders 
#2 - clean the folders 
#3 - Check the existance of grains data; if it 
#exists the program will not do the insertion part
clear
#Make and clean directories
dirBse=SimResults 				#main directory
dirPs1=$dirBse/post1			#insertion vtk
dirPs2=$dirBse/post2			#triaxial vtk
dirGnV=$dirBse/generalvariables	#data directory
dirRes=$dirBse/reFolder			#reset files directory
nbCpu=4  #nb of cpu cores fore execution

[ ! -d "./$dirBse" ] && mkdir $dirBse
[ ! -d "./$dirPs1" ] && mkdir $dirPs1 
[ ! -d "./$dirPs2" ] && mkdir $dirPs2
[ ! -d "./$dirGnV" ] && mkdir $dirGnV 
[ ! -d "./$dirRes" ] && mkdir $dirRes 

cnt=`ls -1 Conso.rest 2>/dev/null | wc -l`
cnt2=`ls -1 QcstRupt.* 2>/dev/null | wc -l`
if [ $cnt2 != 0 ]; then
	echo "Qcst rupture restart file found, test will restart from there" ;
	JI=3;
elif [ $cnt != 0 ]; then
	echo "Consolidation restart file found, only compression will be done" ;
	JI=2;
	rm -f $dirPs2/* 
elif test -f "ResetInsertion.txt"; then 
	echo "Insertion data found, insertion wont be done" ;
	JI=1;
	rm -f $dirPs2/* $dirGnV/*
else
	echo "No data found, insertion will be done" ;
	JI=0;
	rm -f $dirPs1/* $dirPs2/* $dirGnV/*
fi

#Add a timer
SECONDS=0

#Execute LIGGGHTS
#mpirun -np 12 lmp_auto -v tfI $JI  < 0_Execution.liggghts
##Detailled execution
mpirun -np $nbCpu lmp_auto -v tfI $dirBse $dirPs1 $dirPs2 $dirGnV $dirRes $JI -e screen < 0_Execution.liggghts

#Finish adding timer and execution type to Matlab file
fnm='LiggghtstoMatlab.txt'
echo "ExecutionType=$JI">>$fnm 
let "h=SECONDS/3600"
let "m=(SECONDS%3600)/60"
let "s=(SECONDS%3600)%60"
if (( $h < 10 )) ; then 
	hrs="0$h"
	h=$hrs
fi
if (( $m < 10 )) ; then 
	min="0$m"
	m=$min
fi
if (( $s < 10 )) ; then 
	sec="0$s" 
	s=$sec
fi
echo "ElapsedTime=$h:$m:$s"
echo "ElapsedTime=$h:$m:$s">>$fnm 
echo "">>$fnm 
