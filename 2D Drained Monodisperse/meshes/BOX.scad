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
translate([-val,-0.3*l,-e]) 
    cube([v+2*e,l*1.6,e]);
    }
//Glass
module glass1() {
translate([-val,-0.3*l ,0]) 
    color("blue") 
    cube([e,l*1.6,h]);
    }
module glass2() {
translate([e+v-val,-0.3*l,0]) 
    color("blue") 
    cube([e,l*1.6,h]);
    }
//Pression lateral1 mov y+
module pistY1() {
translate([-e-val,-e ,0]) 
    color("red") 
    cube([v+4*e,e, h+5*e]);
    }
//Pression lateral2 mov y-
module pistY2() {
translate([-val-e,l ,0]) 
    color("red") 
    cube([v+4*e,e, h+5*e]);
    }
//Pression vertical mov z-
module pistZ() {
translate([e+v/2-val,l/2 ,h]) 
    color("red") 
    cube([v,1.6*l, e], true); 
}
 module insertHelper() {
translate([e+v/2-val,l/2 ,3*h/2]) 
difference() {

    color("red") 
    cube([v*1.4,l*1.6, h], true);
        color("red") 
        cube([v,l, 2*h], true);
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