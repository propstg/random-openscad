$fa = 1.0;
$fs = 0.4;

width = 25;
length = 80;
height = 14;
insideHeight = 6;
thickness = 2;

ledCircleDiameter = 21;
sensorDiameter = 7;
sensorDistanceFromEdge = 24;
lensDiameter = 17;
lensRimHeight = 5;
lensRimThickness = 1;
wireCutoutWidth = 26;

union() {
    difference() {
        createSolidBody();
        createHolesInFacePlate();
        hollowInsideDownToFacePlate();
        createWireCutout();
    }
    createRimForLens();
    createRimForLeftLed();
    createRimForRightLed();
}

module createSolidBody() {
    color("yellow")
    union() {
        //left rounded corner
        translate([0, width/2, 0])
        cylinder(d=width,h=height);

        //right rounded corner
        translate([0,length-width/2,0])
        cylinder(d=width,h=height);

        //center rectangle
        translate([-width/2,width/2,0])
        cube([width,55,height]);
    }
}

module createHolesInFacePlate() {
    color("blue")
    union() {
        //left led hole
        translate([0,width/2,0])
        cylinder(d=ledCircleDiameter,h=height);
        
        //right led hole
        translate([0,length-width/2,0])
        cylinder(d=ledCircleDiameter,h=height);

        //lens hole
        translate([0,length/2,0])
        cylinder(d=lensDiameter,h=height);    
        
        //left sensor hole
        translate([
            width/2-sensorDiameter/2-thickness,
            sensorDistanceFromEdge,
            0])
        cylinder(d=sensorDiameter,h=height);
        
        //right sensor hole
        translate([
            -(width/2-sensorDiameter/2-thickness),
            length-sensorDistanceFromEdge,
            0])
        cylinder(d=sensorDiameter,h=height);
    }
}

module hollowInsideDownToFacePlate() {
    widthOfRectangle = width-thickness*2;
    
    color("green")
    union(){
        //left led hole
        translate([0,width/2,thickness])
        cylinder(d=ledCircleDiameter,h=height);
        
        //right led hole
        translate([0,length-width/2,thickness])
        cylinder(d=ledCircleDiameter,h=height);
        
        //center rectangle section
        translate([-widthOfRectangle/2,width/2,thickness])
        cube([widthOfRectangle,55,height]);
    }   
}

module createWireCutout() {
    color("blue")
    translate([-width/2,(length-wireCutoutWidth)/2,insideHeight])
    cube([thickness,wireCutoutWidth,height]);
}

module createRimForLens() {
    difference() {
        //lens hole border
        translate([0,length/2,0])
        cylinder(d=lensDiameter+lensRimThickness*2,h=lensRimHeight);

        translate([0,length/2,0])
        cylinder(d=lensDiameter,h=height); 
    }    
}

module createRimForLeftLed() {
    difference() {
        //outer rim
        translate([0, width/2, 0])
        cylinder(d=width,h=insideHeight);
        
        //hollow center
        translate([0,width/2,0])
        cylinder(d=ledCircleDiameter,h=height);
        
        //notch for sensor
        translate([
            width/2-sensorDiameter/2-thickness,
            sensorDistanceFromEdge,
            0])
        cylinder(d=sensorDiameter,h=height);
    }
}

module createRimForRightLed() {
    difference() {
        //outer rim
        translate([0,length-width/2,0])
        cylinder(d=width,h=insideHeight);
        
        //hollow center
        translate([0,length-width/2,0])
        cylinder(d=ledCircleDiameter,h=height);
        
        //notch for sensor
        translate([
            -(width/2-sensorDiameter/2-thickness),
            length-sensorDistanceFromEdge,
            0])
        cylinder(d=sensorDiameter,h=height);
    }
}