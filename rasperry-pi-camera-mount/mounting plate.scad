$fa = 1.0;
$fs = 0.4;

basePlateWidth = 40;
basePlateHeight = 5;
tineWidth = 11;
tineLength = 14;
tineHeight = 3;
screwSize = 4;

makeBasePlate();
makeTines();

module makeBasePlate() {
    cube([basePlateWidth, basePlateWidth, basePlateHeight]);
}

module makeTines() {
    for (i =[-1:1:1])
        
        translate([
            basePlateWidth / 2 + tineHeight / 2 + tineHeight * 2 * i,
            basePlateWidth / 2 + tineWidth / 2,
            basePlateHeight - 0.001])
        rotate([90,0,270])
        makeTine();
}

module makeTine() {
    difference() {
        union(){
            color("green")
            translate([tineWidth/2,tineLength-tineWidth/2,0])
            cylinder(r=tineWidth/2,h=tineHeight);
            cube([tineWidth, tineLength-tineWidth/2, tineHeight]);
        }
        color("blue")
        translate([tineWidth/2,tineLength-tineWidth/2,0])
        cylinder(d=screwSize, h=tineHeight);
    }
}