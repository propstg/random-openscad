$fa = 1.0;
$fs = 0.4;

margin = 0.6;

thickness = 3;
height = 24;
outerInnerWidth = 25;
innerOuterWidth = outerInnerWidth - margin;
heightOfSlit = thickness + margin;
tineWidth = 11;
tineLength = 18;
tineHeight = thickness;
outerTineLength = 17;
screwSize = 4;

translate([30,0,-10])
union(){
    makeOuterCylinder();
    makeInnerCylinder();
}

module makeOuterCylinder() {
    makeOuterCylinderWall();
    makeOuterCylinderTines();
}

module makeOuterCylinderWall() {
    color("orange")
    difference() {
        // shell
        cylinder(r=outerInnerWidth/2+thickness, h=height);
        
        // hollow out middle
        cylinder(r=outerInnerWidth/2, h=height);
        
        // make slits in side
        for (i =[2:2:6])
            translate([outerInnerWidth/2,0,thickness*i])
            makeOuterSlit();
    }
}

module makeOuterSlit() {
    color("blue")
    cube([outerInnerWidth, outerInnerWidth*2, heightOfSlit],center=true);
}

module makeOuterCylinderTines() {
    for (i =[-1:1:1])
        color("green")
        translate([
            -outerInnerWidth/2,
            thickness*i*2+thickness/2,
            tineWidth/2])
        rotate([90,270,0])
        makeTine(length = outerTineLength );
}

module makeInnerCylinder() {
    makeInnerCylinderWall();
    makeInnerCylinderTines();
}

module makeInnerCylinderWall() {
    color("green")
    difference() {
        cylinder(r=innerOuterWidth/2, h=height);
        cylinder(r=innerOuterWidth/2-thickness, h=height);
    }
}

module makeInnerCylinderTines() {
    for (i =[2:2:6])
        color("yellow")
        translate([(outerInnerWidth)/2-thickness,tineWidth/2,thickness*i-tineHeight/2])
        rotate([0,0,270])
        makeTine();
}

module makeTine(length = tineLength) {
    difference() {
        union(){
            color("green")
            translate([tineWidth/2,length-tineWidth/2,0])
            cylinder(r=tineWidth/2,h=tineHeight);
            cube([tineWidth, length-tineWidth/2, tineHeight]);
        }
        color("blue")
        translate([tineWidth/2,tineLength-tineWidth/2,0])
        cylinder(d=screwSize, h=tineHeight);
    }
}