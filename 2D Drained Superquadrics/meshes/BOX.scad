mode = 0;py1=-0;py2=0;pz=-0;

//Dimension : principal box
v=0.011;//'void widith;  x
l=0.35; //box length;  y
h=0.45; //box height;  z
e=0.01*l;
//Value needed to centralise figure in x
val=(v+2*e)/2;

//Floor
module bot() {
translate([-0.3*l,-e,-val]) 
    cube([l*1.6,e,v+2*e]);
    }
//Glass
module glass1() {
translate([-0.3*l ,0,-val]) 
    color("blue") 
    cube([l*1.6,h,e]);
    }
module glass2() {
translate([-0.3*l,0,e+v-val]) 
    color("blue") 
    cube([l*1.6,h,e]);
    }
//Pression lateral1 mov y+
module pistY1() {
translate([-e ,0,-e-val]) 
    color("red") 
    cube([e, h+5*e,v+4*e]);
    }
//Pression lateral2 mov y-
module pistY2() {
translate([l ,0,-val-e]) 
    color("red") 
    cube([e, h+5*e,v+4*e]);
    }
//Pression vertical mov z-
module pistZ() {
translate([l/2 ,h,e+v/2-val]) 
    color("red") 
    cube([1.6*l, e,v], true); 
}
 module insertHelper() {
translate([l/2 ,3*h/2,e+v/2-val]) 
difference() {

    color("red") 
    cube([l*1.6, h,v*1.4], true);
        color("red") 
        cube([l, 2*h,v], true);
    }
}
module all(){
    bot();
    glass1();
    //glass2();
    pistY1();
    pistY2();
    pistZ();
    //insertHelper(); 
}
if (mode==1){
    bot();
}else if (mode==21){
    glass1();
}else if (mode==22){
    glass2();
}else if (mode==31){
    pistY1();
}else if (mode==32){
    pistY2();
}else if (mode==4){
    pistZ();
}else if (mode==5){
    insertHelper(); 

}else{
    all();
}