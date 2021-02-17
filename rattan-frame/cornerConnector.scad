include <constants.scad>;

makeCornerConnector();

module makeCornerConnector() {
    difference() {
        union() {
            color("blue")
            cube([width, 5.25 * holeDistance, thickness / 2]);
        

            color("green")
            translate([-holeDistance * 0.25, 0, 0])
            cube([holeDistance * 2.25, width, thickness / 2]);
            
            color("orange")
            translate([0, width, -thickness / 2])
            cube([width, holeDistance, thickness]);
        }
        
        color("green")
        union() {
            translate([0, holeDistance, -thickness])
            cylinder(d=holeDiameter, h=thickness * 2);
            translate([holeDistance, holeDistance, -thickness])
            cylinder(d=holeDiameter, h=thickness * 2);
            translate([holeDistance, holeDistance * 2, -thickness])
            cylinder(d=holeDiameter, h=thickness * 2);
            translate([holeDistance, holeDistance * 3, -thickness])
            cylinder(d=holeDiameter, h=thickness * 2);
            translate([holeDistance, holeDistance * 4, -thickness])
            cylinder(d=holeDiameter, h=thickness * 2);
            translate([holeDistance, holeDistance * 5, -thickness])
            cylinder(d=holeDiameter, h=thickness * 2);
        }
        
        color("black")
        translate([holeDistance * 0.5, holeDistance * 0.5, -thickness])
        cylinder(d=screwHoleDiameter, h=thickness * 3);
        color("black")
        translate([holeDistance * 1.5, holeDistance * 0.5, -thickness])
        cylinder(d=screwHoleDiameter, h=thickness * 3);
        color("black")
        translate([holeDistance * 1.5, holeDistance * 4.5, -thickness])
        cylinder(d=screwHoleDiameter, h=thickness * 3);
        color("black")
        translate([holeDistance * 1.5, holeDistance * 3.5, -thickness])
        cylinder(d=screwHoleDiameter, h=thickness * 3);
    }    
}