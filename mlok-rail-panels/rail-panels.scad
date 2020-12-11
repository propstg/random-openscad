$fa = 0.4;
$fs = 1.0;

difference() {
        
    translate([0,1.5,0])
    hull() {
        translate([1.5,0,0])
        cylinder(d1=3, d2=0.5, h=2);
        
        translate([18.5 - 1.5, 0, 0])
        cylinder(d1=3, d2=0.5, h=2);
        
        translate([1.5,75-1.5,0])
        cylinder(d1=3, d2=0.5, h=2);
        
        translate([18.5 - 1.5, 75-1.5, 0])
        cylinder(d1=3, d2=0.5, h=2);
    }
    
    translate([18.5/2, 10, 0])
    cylinder(d=5, h=2);
    
    translate([18.5/2, 66, 0])
    cylinder(d=5, h=2);
}
