include <constants.scad>;

makeStraightConnector();

module makeStraightConnector() {
    difference() {
        cube([straightPlankLength, width, thickness / 2]);
        
        color("green")
        translate([straightPlankLength / 2, width / 2, -thickness / 2])
        cylinder(d=holeDiameter, h=thickness * 2);
        
        color("green")
        translate([straightPlankLength / 2 - holeDistance * 1, width / 2, -thickness / 2])
        cylinder(d=holeDiameter, h=thickness * 2);
        
        color("green")
        translate([straightPlankLength / 2 - holeDistance * 2, width / 2, -thickness / 2])
        cylinder(d=holeDiameter, h=thickness * 2);
        
        color("green")
        translate([straightPlankLength / 2 + holeDistance * 1, width / 2, -thickness / 2])
        cylinder(d=holeDiameter, h=thickness * 2);
        
        color("green")
        translate([straightPlankLength / 2 + holeDistance * 2, width / 2, -thickness / 2])
        cylinder(d=holeDiameter, h=thickness * 2);
        
        color("black")
        translate([holeDistance * 0.75, width * 0.75, -thickness])
        cylinder(d=screwHoleDiameter, h=thickness * 3);
        color("black")
        translate([holeDistance * 1.75, width * 0.75, -thickness])
        cylinder(d=screwHoleDiameter, h=thickness * 3);
        
        color("black")
        translate([holeDistance * 2.75, width * 0.75, -thickness])
        cylinder(d=screwHoleDiameter, h=thickness * 3);
        color("black")
        translate([holeDistance * 3.75, width * 0.75, -thickness])
        cylinder(d=screwHoleDiameter, h=thickness * 3);
    }
}