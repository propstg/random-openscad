$fa = 1;
$fs = 0.4;

// Width of magazine in mm
widthOfMag = 21.5;
// Depth of magazine in mm
depthOfMag = 33;
// Height of speedloader in mm
height = 65;
// Width of plunger in mm
widthOfPlunger = 7;
// Length of plunger in mm
lengthOfPlunger = 17;
// Thickness of walls in mm
thickness = 3;
// How deep the cutout should be at the top
cutoutDepthTop = 13;
// How far down the cutout should go
cutoutHeightTop = lengthOfPlunger * 2.5;
    
difference() {
    // create outer shell
    cube ([widthOfMag + thickness * 2, depthOfMag + thickness * 2, height + thickness]);

    // hollow out the inner space
    translate([thickness, thickness, -thickness])
        cube ([widthOfMag, depthOfMag, height + thickness]);
 
    // cut out the angled bit
    translate([0,depthOfMag+thickness*2,height-cutoutHeightTop])
        rotate([90,0,0])
        prism(l=widthOfMag+thickness*2,w=height+thickness-cutoutHeightTop,h=depthOfMag-cutoutDepthTop); 
    
    // cut out the square at the top
    translate([0, cutoutDepthTop + thickness * 2, height - cutoutDepthTop - thickness - 1])
        cube([widthOfMag + thickness * 2, depthOfMag - cutoutDepthTop, height - cutoutHeightTop + thickness * 2]);
}

// plunger
translate([(widthOfMag - widthOfPlunger) / 2 + thickness, thickness * 2, height - lengthOfPlunger - 0.001])
    difference() {
        // overall plunger
        cube([widthOfPlunger, widthOfPlunger, lengthOfPlunger]);
  
        // indent
        translate([widthOfPlunger/2, widthOfPlunger, -2])
            rotate([90,0,0])
            cylinder(r=widthOfPlunger/2,h=widthOfPlunger* 2);
    };
    
// plunger support left
translate([widthOfMag + thickness + 0.001, thickness * 2 + widthOfPlunger, height + 0.001])
    rotate([0,180,90])
    prism(widthOfPlunger, widthOfPlunger, lengthOfPlunger / 3);
    
// plunger support right
translate([thickness-0.001, widthOfPlunger-1, height - 0.001])
    rotate([0,180,-90])
    prism(widthOfPlunger+0.01, widthOfPlunger, lengthOfPlunger / 3);

// plunger support front
translate([(widthOfMag - widthOfPlunger) / 2 + thickness + widthOfPlunger, widthOfPlunger + thickness * 2, height -thickness*2- 0.001])
    rotate([-90,180,00])
    prism(widthOfPlunger+0.01, widthOfPlunger, lengthOfPlunger / 3);

// comfort angle on top
color("green")
translate([0, -2.999, height + thickness - 0.001])
prism(widthOfMag + thickness * 2, cutoutDepthTop + thickness * 2 + 3, 5);
    
// comfort angle on side
color("blue")
translate([0, -2.999, height + thickness - 0.001])
rotate([180,0,0])
mirror(v = [0,1,0])
prism(widthOfMag + thickness * 2, 3, 10);
  
// From https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids
module prism(l, w, h){
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}