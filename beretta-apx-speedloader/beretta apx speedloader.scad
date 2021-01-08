$fa = 1;
$fs = 0.4;

// Width of magazine in mm
widthOfMag = 22.5;
// Depth of magazine in mm
depthOfMag = 32;
// Height of speedloader in mm
height = 65;
// Width of plunger in mm
widthOfPlunger = 7;
// Length of plunger in mm
lengthOfPlunger = 20;
// Thickness of walls in mm
thickness = 2.5;
// How deep the cutout should be at the top
cutoutDepthTop = 13;
// How far down the cutout should go
cutoutHeightTop = lengthOfPlunger * 2.5;

makeOuterShell();
makePlunger();

module makePlunger() {
    translate([0, -0.75, 0])
    union() {
        makeBasePlunger();
        makePlungerLeftSupport();
        makePlungerRightSupport();
        makePlungerFrontSupport();
        
    }
}

module makeBasePlunger() {
    translate([(widthOfMag - widthOfPlunger) / 2 + thickness, thickness * 2, height - lengthOfPlunger - 0.001])
    difference() {
        // overall plunger
        cube([widthOfPlunger, widthOfPlunger * 0.75, lengthOfPlunger]);
  
        // indent
        translate([widthOfPlunger / 2, widthOfPlunger + 1, 3])
            rotate([120, 0, 0])
            cylinder(r=widthOfPlunger/2,h=widthOfPlunger*2);
        
        translate([-0.5, 10, 3.2])
        rotate([200, 0, 0])
        cube([widthOfPlunger + 1, widthOfPlunger * 2, thickness]);
    }
}


module makePlungerLeftSupport() {
    translate([widthOfMag + thickness + 0.001 - 1, thickness * 2 + widthOfPlunger, height + 0.001])
    rotate([0,180,90])
    prism(widthOfPlunger, widthOfPlunger, lengthOfPlunger / 3);
}
    
module makePlungerRightSupport() {
    translate([thickness-0.001+1, widthOfPlunger-2, height - 0.001])
    rotate([0,180,-90])
    prism(widthOfPlunger+0.01, widthOfPlunger, lengthOfPlunger / 3);
}

module makePlungerFrontSupport() {
    translate([(widthOfMag - widthOfPlunger) / 2 + thickness + widthOfPlunger, widthOfPlunger + thickness * 2, height -thickness*2- 0.001])
    rotate([-90,180,00])
    prism(widthOfPlunger+0.01, widthOfPlunger, lengthOfPlunger / 3);
}

module makeOuterShell() {
    difference() {
        minkowski() {
            cube ([widthOfMag + thickness * 2, depthOfMag + thickness * 3, height + thickness]);
            
            cylinder(1, center=true);
        }

        // hollow out the inner space
        translate([thickness, thickness, -thickness])
            cube ([widthOfMag, depthOfMag, height + thickness]);

        // cut out the angled bit
        translate([-thickness/2,19,48])
        rotate([-52,0,0])
        cube([widthOfMag + thickness * 3, 50, 30]);
        
        // cut out the square at the top
        translate([-thickness/2,19,48])
        cube([widthOfMag + thickness * 3, 50, 30]);
        
        // cut out notch for weird triangle thing
        translate([(widthOfMag - 10 +thickness * 2) / 2, depthOfMag + thickness, -1])
    cube([10, thickness, 50]);
    }
    
    makeComfortAngleTop();
    makeComfortAngleSide();
}

module makeComfortAngleTop() {
    translate([0, -2.999, height + thickness - 0.001])
    minkowski() {
        prism(widthOfMag + thickness * 2, cutoutDepthTop + thickness * 2 + 3, 5);
        
        cylinder(1, center=true);
    }    
}
    
module makeComfortAngleSide() {
    translate([0, -2.999, height + thickness - 0.001])
    minkowski() {
        rotate([180,0,0])
        mirror(v = [0,1,0])
        prism(widthOfMag + thickness * 2, 3, 10);
        
        cylinder(1, center=true);
    }
}

// From https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids
module prism(l, w, h){
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}