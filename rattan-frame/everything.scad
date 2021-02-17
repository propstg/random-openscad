include <constants.scad>;
include <mainPlank.scad>;
include <straightConnector.scad>;
include <cornerConnector.scad>;

// Top
color("red")
translate([0, 0, 0])
makeMainPlank();
color("red")
translate([length * 1, 0, 0])
    rotate([0, 0, 0])
    makeMainPlank();
color("red")
translate([length * 2, 0, 0])
    rotate([0, 0, 0])
    makeMainPlank();

// left
color("red")
translate([width, -length - holeDistance * 1, 0])
    rotate([0,0,90])
    makeMainPlank();
color("red")
translate([width, -length * 2  - holeDistance * 1, 0])
    rotate([0,0,90])
    makeMainPlank();
color("red")
translate([width, -length * 3 - holeDistance * 1, 0])
    rotate([0,0,90])
    makeMainPlank();
    
//right
color("red")
translate([length * 3 + holeDistance, width, 0])
    rotate([0,0,-90])
    makeMainPlank();
color("red")
translate([length * 3 + holeDistance, width - length, 0])
    rotate([0,0,-90])
    makeMainPlank();
color("red")
translate([length * 3 + holeDistance, width - length * 2, 0])
    rotate([0,0,-90])
    makeMainPlank();
    
// bottom
color("red")
translate([width + length * 1 + holeDistance, -length * 3 + width - holeDistance, 0])
    rotate([0, 0, 180])
    makeMainPlank();
color("red")
translate([width + length * 2 + holeDistance, -length * 3 + width - holeDistance, 0])
    rotate([0, 0, 180])
    makeMainPlank();
color("red")
translate([width + length * 3 + holeDistance, -length * 3 + width - holeDistance, 0])
    rotate([0, 0, 180])
    makeMainPlank();

// top straight connectors
color("white")
translate([4.75 * holeDistance , 0, thickness / 2])
    makeStraightConnector();
color("white")
translate([holeDistance * 11.75, 0, thickness / 2])
    makeStraightConnector();
// bottom straight connectors
color("white")
translate([7.75 * holeDistance, -length * 3 - holeDistance, thickness / 2])
    makeStraightConnector();
color("white")
translate([holeDistance * 14.75, -length * 3 - holeDistance, thickness / 2])
    makeStraightConnector();
// left straight connectors
color("white")
translate([width, -8.25 * holeDistance - width, thickness / 2])
    rotate([0, 0, 90])
    makeStraightConnector();
color("white")
translate([width, -15.25 * holeDistance - width, thickness / 2])
    rotate([0, 0, 90])
    makeStraightConnector();
// right straight connectors
color("white")
    translate([length * 3 + holeDistance, -width * 1.375, thickness / 2])
    rotate([0, 0, -90])
    makeStraightConnector();
color("white")
translate([length * 3 + holeDistance, -width * 4.87, thickness / 2])
    rotate([0, 0, -90])
    makeStraightConnector();

//upper left corner
color("green")
translate([width, width, thickness / 2])
    rotate([0, 0, 180])
    makeCornerConnector();

//bottom left corner
color("green")
translate([0, -length * 3 + holeDistance, thickness / 2])
    rotate([0, 0, -90])
    makeCornerConnector();

//upper right corner
color("green")
translate([length * 3 + width + holeDistance, 0, thickness / 2])
    rotate([0, 0, 90])
    makeCornerConnector();

//bottom right corner
color("green")
translate([length * 3 + holeDistance, -length * 3 - holeDistance, thickness / 2])
    rotate([0, 0, 360])
    makeCornerConnector();





