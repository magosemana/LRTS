//Starting variables in the general case
mode = 0;

//Geometric data
//Dimension : principal box
w=0.10;       //'void' widith;  x
l=0.35;       //box length;  y
h=0.45;       //box height;  z
e=0.02;     //thickness walls
 
//MAKE IT BIG
big=0.5;
//Floor
module bot() {
    translate([0,0.5*l,-e/2]) 
        cube([2*w+2*e+big,l+big,e],true);
}
//Pression lateral mov y+-
module pisty1() {
    translate([-w/2-big/2,-e ,0]) 
        color("red") 
        cube([w+big,e,h*1.1]);
}
module pisty2() {
    translate([-w/2-big/2,l,0]) 
        color("red") 
        cube([w+big,e, h*1.1]);
}
//Pression lateral mov x+-
module pistx1() {
    translate([-w/2-e,-big/2,0]) 
        color("red") 
        cube([e,l+big,h*1.1]);
}
module pistx2() {
    translate([w/2,-big/2,0]) 
        color("red") 
        cube([e,l+big,h*1.1]);
}
//Pression vertical mov z-
module pistz() {
    translate([0,l/2 ,h+e/2]) 
        color("red") 
        cube([w*1.1+big,l+big, e], true); 
}
//InsHelper
 module insertHelper() {
    difference() {
        translate([0,l/2 ,h*1.6+e]) 
            color("blue") 
            cube([w*1.2,l*1.2, h+2*e], true);
        translate([0,l/2 ,h*1.6]) 
            color("orange") 
            cube([w,l,h+2*e], true);
    }
}
//Draw All
module all(){
    bot();
    pisty1();
    pisty2();
    pistz();
    pistx1();
    pistx2();
    //insertHelper(); 
}
//Execution
if (mode==1){
    bot();
}else if (mode==21){
    pisty1();
}else if (mode==22){
    pisty2();
}else if (mode==31){
    pistx1();
}else if (mode==32){
    pistx2();
}else if (mode==4) {
    pistz();
}else if (mode==5) {
    insertHelper(); 
}else{
    all();
}
//insertion region - - visualisation only - -
//translate([-0.45,2,24]) color("white") cube([0.9,31,20]);
