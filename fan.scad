//written by Michiel Brink
//fridgefire@irc.freenode.net

//length fan,distance hole,circle diameter
    //25,20,
    //30,24,
    //40,33,
    //50,40,
    //60,50,
    //70,60,
    //80,70,86
    //90,83,100
    //120,105,130
    //140,125,150

length =  80;
holedistance = 70;
diameter = 86;

screwhole = 4.8; 

//effect vars
    //circles:
        circlesThickness = 5;
        circlesDistance = 5;
        circlesCrossThickness = 5;
    //holes:
        holesDiameter = 5;
        holesDistance = 2;

intersection() {
    fanHole();

    //choose one effect:
        //none();
        //circles();
        holes();
}

screwHoles();

module fanHole() {
    intersection() {
        translate([-length/2,-length/2]){
            square([length,length],0);
        }
        circle(diameter/2,0);
    }
}

module screwHoles() {
    translate([holedistance/2,holedistance/2]){
            circle(screwhole/2,0);
        }
    translate([-holedistance/2,holedistance/2]){
            circle(screwhole/2,0);
        }
    translate([-holedistance/2,-holedistance/2]){
            circle(screwhole/2,0);
        }
    translate([holedistance/2,-holedistance/2]){
            circle(screwhole/2,0);
        }
}

module circles() {
    //circles
    for (x = [0:circlesDistance*2:60]) {
        difference() {
            circle(x+circlesThickness,0);
            circle(x,0);
        }
    }
    //cross
    rotate([0,0,45]){
        translate([-circlesCrossThickness/2,-length/2]){
            square([circlesCrossThickness,length],0);
         }
        translate([-length/2,-circlesCrossThickness/2]){
            square([length,circlesCrossThickness],0);
         }
     }
}

module holes() {
    for (x = [0:holesDiameter+holesDistance:length]) {
        for (y = [holesDiameter:holesDiameter+holesDistance*2:length]) {
            translate([x-length/2,y-length/2]){
                circle(holesDiameter/2,0);
            }
            translate([x-holesDistance/2-holesDiameter/2-length/2,y-holesDistance-holesDiameter/2-length/2]){
                circle(holesDiameter/2,0);
            }
        }
    }
}