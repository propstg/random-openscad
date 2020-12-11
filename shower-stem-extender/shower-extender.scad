$fa = 0.4;
$fs = 1.0;

rotate([90,90,0])
union() {
	difference() {
		makeMainBody();
		makeScrewHole();
		makeLeftNotch();
		makeRightNotch();
	}

	rotate([0,0,90])
	translate([0, 0, 37-0.001])
	makeTabs();
}

module makeMainBody() {
	cylinder(d=25, h=37);
}

module makeScrewHole() {
	cylinder(d=5, h=37);
}

module makeLeftNotch() {
	translate([-9,0,0])
	translate([-6.4, -(6.4/2), 0])
	cube([6.4, 6.4, 37]);
}

module makeRightNotch() {
	translate([9, -(6.4/2), 0])
	cube([6.4, 6.4, 37]);
}

module makeTabs() {
	intersection() {
		difference() {
			cylinder(d=25, h=6.1);
			cylinder(d=18, h=6.1);
			rotate([0,0,90])
			translate([-(26/2), -19/2, 0]) 
			cube([26,19,6.1]);
		}
		translate([-(26/2), -6.5/2, 0]) 
		cube([26,6.5,6.1]);
	}
}
