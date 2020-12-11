$fa = 1.0;
$fs = 0.4;

difference() {
	cube([28.5, 19, 4]);

	color("blue")
	translate([28.5/2-0.5, 0, 0])
	rotate([0,45,0])
	cube([1, 19, 1]);
}

translate([0, 2.25, 4])
rotate([90,0,90])
cylinder(r=2.25, h=28.5);


difference() {
	translate([(28.5-8)/2, 0, 1])
	intersection() {
		translate([0,19/2-1,-1])
		rotate([90,0,90])
		cylinder(d=19, h=8);

		color("green")
		cube([20, 14, 10]);

	}

	color("orange")
	translate([(28.5-10)/2, 14, 0])
	rotate([6,0,0])
	cube([10, 10, 10]);

	color("blue")
	translate([(28.5-8)/2,10,7])
	rotate([90,0,90])
	cylinder(d=2.5, h=8);

color("blue")
translate([0, 9, 7.7])
rotate([15,0,0])
cube([28.5, 1.5, 3]);

color("blue")
translate([0, 9.5, 7.7])
rotate([-15,0,0])
cube([28.5, 1.5, 3]);
}



