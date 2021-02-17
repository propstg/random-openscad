include <constants.scad>;

makeMainPlank();

module makeMainPlank() {
    difference() {
        union() {
            translate([length / 4 + holeDistance / 2, 0, 0])
                cube([length / 2 - holeDistance, width, thickness]);
            cube([length, width, thickness / 2]);
        }
        
        union() {
            color("blue")
            translate([length, width / 2, -thickness / 2])
            cylinder(d=holeDiameter, h=thickness * 2);
            
            color("blue")
            translate([0, width / 2, -thickness / 2])
            cylinder(d=holeDiameter, h=thickness * 2);
            
            color("blue")
            translate([holeDistance, width / 2 - holeDistance, -thickness / 2])
            cylinder(d=holeDiameter, h=thickness * 2);

            color("green")
            translate([holeDistance, width / 2, -thickness / 2])
            cylinder(d=holeDiameter, h=thickness * 2);

            color("green")
            translate([holeDistance * 2, width / 2, -thickness / 2])
            cylinder(d=holeDiameter, h=thickness * 2);

            color("green")
            translate([holeDistance * 3, width / 2, -thickness / 2])
            cylinder(d=holeDiameter, h=thickness * 2);

            color("green")
            translate([holeDistance * 4, width / 2, -thickness / 2])
            cylinder(d=holeDiameter, h=thickness * 2);

            color("green")
            translate([holeDistance * 5, width / 2, -thickness / 2])
            cylinder(d=holeDiameter, h=thickness * 2);

            color("green")
            translate([holeDistance * 6, width / 2, -thickness / 2])
            cylinder(d=holeDiameter, h=thickness * 2);

            color("green")
            translate([holeDistance * 7, width / 2, -thickness / 2])
            cylinder(d=holeDiameter, h=thickness * 2);
        }
        color("black")
        translate([holeDistance * 0.5, width * 0.75, -thickness])
        cylinder(d=screwHoleDiameter, h=thickness * 3);
        color("black")
        translate([holeDistance * 1.5, width * 0.75, -thickness])
        cylinder(d=screwHoleDiameter, h=thickness * 3);
        
        color("black")
        translate([holeDistance * 5.5, width * 0.75, -thickness])
        cylinder(d=screwHoleDiameter, h=thickness * 3);
        color("black")
        translate([holeDistance * 6.5, width * 0.75, -thickness])
        cylinder(d=screwHoleDiameter, h=thickness * 3);
    }
}