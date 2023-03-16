###This function will do the following things :
#1 - create the necessary folders 
#2 - clean the folders 
#3 - Check the existance of grains data; if it 
#exists the program will not do the insertion part


#Make and clean directories
mkdir post1  post2 generalvariables reFolder
nbCpu=4

count=`ls -1 *.resData 2>/dev/null | wc -l`
if [ $count != 0 ]; then
	echo "Restart file found, only compression will be done" ;
	JI=2;
	rm post2/* generalvariables/*
elif test -f "part1Data.txt"; then 
	echo "Insertion data found, insertion wont be done" ;
	JI=1;
	rm post2/* generalvariables/*
else
	echo "No data found, insertion will be done" ;
	JI=0;
	rm post1/* post2/* generalvariables/*
fi


#Execute LIGGGHTS
mpirun -np $nbCpu lmp_auto -v tfI ${JI} $Jump -e screen < Box.liggghts
