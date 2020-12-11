/* constants */
oneInchInMm = 25.4;
twoByFourWidthIn = 1.5;
twoByFourWidth = twoByFourWidthIn * oneInchInMm;
twoByTwoWidthIn = twoByFourWidthIn;
twoByTwoWidth = twoByFourWidth;
twoByFourHeightIn = 3.5;
twoByFourHeight = twoByFourHeightIn * oneInchInMm;
oneFoot = 12 * oneInchInMm;
twoFeet = 2 * oneFoot;
threeFeet = 3 * oneFoot;
fourFeet = 4 * oneFoot;
fiveFeet = 5 * oneFoot;
sixFeet = 6 * oneFoot;
sevenFeet = 7 * oneFoot;
eightFeet = 8 * oneFoot;
nineFeet = 9 * oneFoot;
tenFeet = 10 * oneFoot;
    
/* variables */
widthOfFloorIn = 10 * 12;
floorBeams = 6;
thicknessOfFloorIn = 0.5;
doorWidthIn = 12 * 2.5;
doorFrameHeightIn = 7 * 12;
frontWindowWidthIn = (widthOfFloorIn - doorWidthIn * 2 ) / 2 - 3;
height = 8 * 12;
hardwareClothThickness = 1;

/* not modifiable */
widthOfFloor = widthOfFloorIn * oneInchInMm;
thicknessOfFloor = thicknessOfFloorIn * oneInchInMm;
doorWidthMm = doorWidthIn * oneInchInMm;
doorFrameHeight = doorFrameHeightIn * oneInchInMm;
middleBeamZ = ((height / 2) - twoByFourWidthIn / 2) * oneInchInMm + thicknessOfFloor + twoByFourWidth * 2;
windowHeight = height / 2 - twoByFourWidthIn / 2;

/*
TODO

Overall:
    Add slope to roof?
    Add some roosts
Back:
    Add vertical supports
    Make windows
    Figure out how the hell the house will work
Roof:
    Add hardware cloth
    Add corrugated roofing
    
*/

/*
translate([fiveFeet + oneFoot / 2, eightFeet, fourFeet])
cube([fourFeet, twoFeet, twoFeet]);
*/

module makeCoop() {
    translate([oneFoot/2, eightFeet, sixFeet + oneFoot / 2])
    rotate([-15,0,0])
    cube([nineFeet, twoFeet + oneFoot / 2, oneInchInMm]);
        
    translate([oneFoot, eightFeet, fourFeet])
    cube([eightFeet, twoFeet, twoFeet]);
}

module makeFront() {
    height = 8 * 12;
    
    // bottom beam
    translate([0,0,thicknessOfFloor + twoByFourWidth])
    rotate([90,90,0])
    horizontal2x4(lengthInInches = 10 * 12);
    
    // top beam
    translate([0,0,thicknessOfFloor + twoByFourWidth * 2 + eightFeet])
    rotate([90,90,0])
    horizontal2x4(lengthInInches = 10 * 12);
    
    // left beam
    translate([0,0,thicknessOfFloor + twoByFourWidth])
    vertical2x4(lengthInInches = height);
    
    // right beam
    translate([widthOfFloor - twoByFourWidth,0,thicknessOfFloor + twoByFourWidth])
    vertical2x4(lengthInInches = height);
    
    // middle beam (left)
    translate([twoByFourWidth,0,middleBeamZ])
    rotate([90,90,0])
    horizontal2x4(lengthInInches = frontWindowWidthIn);
    
    // middle beam (right)
    translate([
        widthOfFloor - frontWindowWidthIn * oneInchInMm - twoByFourWidth,
        0,
        middleBeamZ])
    rotate([90,90,0])
    horizontal2x4(lengthInInches = frontWindowWidthIn);
    
    makeLeftDoorFrame();
    makeRightDoorFrame();
    color("purple")
    makeFrontWindows();

}

module makeFrontWindows() {
    // left lower window
    translate([twoByFourWidth,0,thicknessOfFloor + twoByFourHeight + twoByFourWidth])
    makeLowerWindow(heightIn = windowHeight, widthIn = frontWindowWidthIn);
    
    // right lower window
    translate([widthOfFloor - frontWindowWidthIn * oneInchInMm - twoByFourWidth,0,thicknessOfFloor + twoByFourHeight + twoByFourWidth])
    makeLowerWindow(heightIn = windowHeight, widthIn = frontWindowWidthIn);

    // upper left window
    translate([twoByFourWidth,0,middleBeamZ+twoByTwoWidth])
    makeUpperWindow(heightIn = windowHeight, widthIn = frontWindowWidthIn);

    // upper right window
    translate([widthOfFloor - frontWindowWidthIn * oneInchInMm - twoByFourWidth,0,middleBeamZ+twoByTwoWidth])
    makeUpperWindow(heightIn = windowHeight, widthIn = frontWindowWidthIn);
}

module makeLeftDoorFrame() {
    makeDoorFrame();
    
    translate([widthOfFloor / 2 - doorWidthMm, 0, twoByFourHeight + twoByFourWidth + thicknessOfFloor])
    rotate([0,0,230])
    makeDoor();
    
    // bottom beam
    color("red")
    translate([(widthOfFloor) / 2 - doorWidthMm - twoByFourWidth, twoByFourHeight, thicknessOfFloor])
    rotate([90,0,0])
    rotate([90,90,0])
    horizontal2x6(lengthInInches = doorWidthIn - 1/4);
}

module makeRightDoorFrame() {
    translate([doorWidthMm + twoByFourWidth,0,0])
    makeDoorFrame();
    
    translate([widthOfFloor / 2 + twoByFourWidth, 0, twoByFourHeight + twoByFourWidth + thicknessOfFloor])
    makeDoor(isRight = true);
    
    // bottom beam
    color("red")
    translate([(widthOfFloor) / 2 + twoByFourWidth + 1/4 * oneInchInMm, twoByFourHeight, thicknessOfFloor])
    rotate([90,0,0])
    rotate([90,90,0])
    horizontal2x6(lengthInInches = doorWidthIn - 1/4);
}

module makeDoorFrame() {
    // right beam
    translate([(widthOfFloor - twoByFourWidth) / 2 - twoByFourWidth / 2, 0, thicknessOfFloor + twoByFourWidth])
    vertical2x4(lengthInInches = 8 * 12);
    
    // left beam
    translate([(widthOfFloor - twoByFourWidth) / 2 - twoByFourWidth / 2 - doorWidthMm, 0, thicknessOfFloor + twoByFourWidth])
    vertical2x4(lengthInInches = 8 * 12);
    
    // top beam
    color("red")
    translate([(widthOfFloor) / 2 - doorWidthMm, 0, doorFrameHeight])
    rotate([90,90,0])
    horizontal2x4(lengthInInches = doorWidthIn - 1.5);
    
    // window at top
    color("purple")
    translate([(widthOfFloor) / 2 - doorWidthMm, 0, doorFrameHeight + twoByFourWidth])
    makeUpperWindow(heightIn = 8 * 12 - doorFrameHeightIn + 2, widthIn = doorWidthIn - 1.5);
}

module makeDoor(isRight = false) {
    heightIn = doorFrameHeightIn - twoByFourWidthIn - thicknessOfFloorIn;
    widthIn = doorWidthIn - twoByFourWidthIn;
    
    for(i = [0:1]) {
        yOffset = (hardwareClothThickness + twoByTwoWidth) * i;
        
        // top beam
        translate([widthIn * oneInchInMm,yOffset,(heightIn) * oneInchInMm - twoByFourHeight - twoByFourWidth])
        rotate([0,0,90])
        horizontal2x4(lengthInInches = widthIn);
        
        // left beam
        translate([twoByFourHeight,yOffset,0])
        rotate([0,0,90])
        vertical2x4(lengthInInches = heightIn - twoByTwoWidthIn - twoByFourHeightIn * 2);
        
        // right beam
        translate([widthIn * oneInchInMm,yOffset,0])
        rotate([0,0,90])
        vertical2x4(lengthInInches = heightIn - twoByTwoWidthIn - twoByFourHeightIn * 2);
        
        // middle beam
        translate([widthIn * oneInchInMm - twoByFourHeight,yOffset,middleBeamZ - twoByFourHeight - twoByFourWidth - thicknessOfFloor])
        rotate([0,0,90])
        horizontal2x2(lengthInInches = widthIn - twoByFourHeightIn * 2);

        // bottom beam
        translate([widthIn * oneInchInMm,yOffset,0])
        rotate([0,0,90])
        horizontal2x4(lengthInInches = widthIn);
    }
    
    if (isRight) {
        translate([twoByFourWidth, -twoByFourWidth / 2, middleBeamZ * 0.75])
        sphere(d=twoByFourHeight * 0.75);
    } else {
        translate([widthIn * oneInchInMm - twoByFourWidth, -twoByFourWidth / 2, middleBeamZ * 0.75])
        sphere(d=twoByFourHeight * 0.75);
    }
    
    // hardware cloth
    translate([0,twoByTwoWidth,-twoByFourHeight])
    hardwareCloth(heightIn - twoByFourWidthIn, widthIn);
}

module makeUpperWindow(heightIn, widthIn) {
    makeWindow(heightIn, widthIn, twoByTwoWidthIn, false);
}

module makeLowerWindow(heightIn, widthIn) {
    makeWindow(heightIn, widthIn, twoByFourHeightIn, true);
}

module makeWindow(heightIn, widthIn, bottomHeightIn, wideBottom) {
    for(i = [0:1]) {
        yOffset = (hardwareClothThickness + twoByTwoWidth) * i;
        
        // top beam
        translate([0,yOffset,(heightIn - bottomHeightIn) * oneInchInMm])
        rotate([90,90,0])
        horizontal2x2(lengthInInches = widthIn);
        
        // left beam
        translate([0,yOffset,0])
        rotate([0,0,0])
        vertical2x2(lengthInInches = heightIn - twoByTwoWidthIn - bottomHeightIn);
        
        // right beam
        translate([(widthIn - twoByTwoWidthIn) * oneInchInMm,yOffset,0])
        rotate([0,0,0])
        vertical2x2(lengthInInches = heightIn - twoByTwoWidthIn - bottomHeightIn);

        // bottom beam
        translate([widthIn * oneInchInMm,yOffset,0])
        rotate([0,0,90])
        if (wideBottom) {
            horizontal2x4(lengthInInches = widthIn);
        } else {
            horizontal2x2(lengthInInches = widthIn);
        }
    }
    
    // hardware cloth
    translate([0,twoByTwoWidth,-bottomHeightIn * oneInchInMm])
    hardwareCloth(heightIn, widthIn);
}

module makeBack() {
    yOffset = eightFeet - twoByFourHeight;
    height = 8 * 12;
    
    // bottom beam
    translate([0,yOffset,thicknessOfFloor + twoByFourWidth])
    rotate([90,90,0])
    horizontal2x4(lengthInInches = 10 * 12);
    
    // top beam
    translate([0,yOffset,thicknessOfFloor + twoByFourWidth * 2 + height * oneInchInMm])
    rotate([90,90,0])
    horizontal2x4(lengthInInches = 10 * 12);
    
    // middle beam
    translate([0,yOffset,middleBeamZ])
    rotate([90,90,0])
    horizontal2x4(lengthInInches = 10 * 12);
    
    // left beam
    translate([0,yOffset,thicknessOfFloor + twoByFourWidth])
    vertical2x4(lengthInInches = height);
    
    // right beam
    translate([widthOfFloor - twoByFourWidth,yOffset,thicknessOfFloor + twoByFourWidth])
    vertical2x4(lengthInInches = height);
}

module makeLeft() {
    makeOuterSideWall();
}

module makeRight() {
    translate([widthOfFloor - twoByFourHeight, 0, 0])
    makeOuterSideWall();
}

module makeDivider() {
    translate([(widthOfFloor - twoByFourHeight) / 2, 0, 0])
    union() {
	    makeSideWall();
	    // right vertical beam
	    translate([0, twoFeet + twoByFourWidth * 0.5, thicknessOfFloor + twoByFourWidth])
	    rotate([0,0,-90])
	    vertical2x4(lengthInInches = height);

	    // middle vertical beam
	    translate([0, eightFeet / 2 + twoByFourWidth * 0.5, thicknessOfFloor + twoByFourWidth])
	    rotate([0,0,-90])
	    vertical2x4(lengthInInches = height);

	    // right vertical beam
	    translate([0, sixFeet + twoByFourWidth * 0.5, thicknessOfFloor + twoByFourWidth])
	    rotate([0,0,-90])
	    vertical2x4(lengthInInches = height);
    }
    
    translate([(widthOfFloor) /2, eightFeet, eightFeet + twoByFourWidth])
    rotate([90,90,0])
    hardwareCloth(8 * 12, height);

}

module makeOuterSideWall() {
    height = 8 * 12;
    lengthOfBeams = 8 * 12 - 7;
    windowWidth = (lengthOfBeams - twoByFourWidthIn * 3) / 2;
    
    makeSideWall();
    
    // middle vertical beam
    translate([0, eightFeet / 2 + twoByFourWidth * 0.5, thicknessOfFloor + twoByFourWidth])
    rotate([0,0,-90])
    vertical2x4(lengthInInches = height);
    
    // left middle horizontal beam
    translate([twoByFourHeight,windowWidth * oneInchInMm + twoByFourHeight + twoByFourWidth * 2,middleBeamZ])
    rotate([0,90,0])
    horizontal2x4(lengthInInches = windowWidth);
    
    // right middle horizontal beam
    translate([twoByFourHeight,twoByFourHeight+twoByFourWidth,middleBeamZ])
    rotate([0,90,0])
    horizontal2x4(lengthInInches = windowWidth);
    
    color("purple")
    makeSideWindows();
}

module makeSideWindows() {
    height = 8 * 12;
    lengthOfBeams = 8 * 12 - 7;
    windowWidth = (lengthOfBeams - twoByFourWidthIn * 3) / 2;
    
    // left lower window
    translate([0,(windowWidth * oneInchInMm + twoByFourWidth) * 2 + twoByFourHeight, thicknessOfFloor + twoByFourHeight + twoByFourWidth])
    rotate([0,0,270])
    makeLowerWindow(heightIn = windowHeight, widthIn = windowWidth);
    
    // upper left window
    translate([0,(windowWidth * oneInchInMm + twoByFourWidth) * 2 + twoByFourHeight, middleBeamZ + twoByFourWidth])
    rotate([0,0,270])
    makeUpperWindow(heightIn = windowHeight, widthIn = windowWidth);
    
    // right lower window
    translate([0,windowWidth * oneInchInMm + twoByFourHeight + twoByFourWidth, thicknessOfFloor + twoByFourHeight + twoByFourWidth])
    rotate([0,0,270])
    makeLowerWindow(heightIn = windowHeight, widthIn = windowWidth);

    // upper right window
    translate([0,windowWidth * oneInchInMm + twoByFourHeight + twoByFourWidth, middleBeamZ + twoByFourWidth])
    rotate([0,0,270])
    makeUpperWindow(heightIn = windowHeight, widthIn = windowWidth);
}

module makeSideWall() {
    lengthOfBeams = 8 * 12 - 7;
    height = 8 * 12;
    
    // bottom beam
    translate([twoByFourHeight,twoByFourHeight,thicknessOfFloor + twoByFourWidth])
    rotate([0,90,0])
    horizontal2x4(lengthInInches = lengthOfBeams);
       
    // top beam
    translate([twoByFourHeight,twoByFourHeight,thicknessOfFloor + twoByFourWidth * 2 + height * oneInchInMm])
    rotate([0,90,0])
    horizontal2x4(lengthInInches = lengthOfBeams);

    // right beam
    translate([0, twoByFourHeight + twoByFourWidth, thicknessOfFloor + twoByFourWidth])
    rotate([0,0,-90])
    vertical2x4(lengthInInches = height);

    // left beam
    translate([0, eightFeet - twoByFourHeight, thicknessOfFloor + twoByFourWidth])
    rotate([0,0,-90])
    vertical2x4(lengthInInches = height);
}

module makeFloor() {
    color("yellow")
    cube([sixFeet, fourFeet, thicknessOfFloor]);
    
    color("green")
    translate([0, fourFeet, 0])
    cube([sixFeet, fourFeet, thicknessOfFloor]);
    
    color("blue")
    translate([sixFeet, 0, 0])
    cube([fourFeet, eightFeet, thicknessOfFloor]);
}

module makeFloorBeams() {
    spacingDistance = (widthOfFloor - twoByFourWidth * floorBeams) / (floorBeams - 1);
    
    for(i = [0:floorBeams - 1]) {
        x = i * twoByFourWidth + i * spacingDistance;
        translate([x, 0, 0])
        horizontal2x4();    
    } 
}

module vertical2x4(lengthInInches = 12 * 8) {
    rotate([90,0,0])
    horizontal2x4(lengthInInches);
}

module horizontal2x4(lengthInInches = 12 * 8) {
    echo("Making a 2x4 that is ", lengthInInches, " inches long.");
    
    rotate([-90,0,0])
    make2x(lengthInInches);
}

module vertical2x2(lengthInInches = 12 * 8) {
    rotate([90,0,0])
    horizontal2x2(lengthInInches);
}

module horizontal2x2(lengthInInches = 12 * 8) {
    echo("Making a 2x2 that is ", lengthInInches, " inches long.");
    
    rotate([-90,0,0])
    make2x(lengthInInches, twoByTwoWidth);
}

module horizontal2x6(lengthInInches = 12 * 8) {
    echo("Making a 2x6 that is ", lengthInInches, " inches long.");
    
    rotate([-90,0,0])
    make2x(lengthInInches, heightOfBoard = 5.5 * oneInchInMm);
}

module make2x(lengthInInches = 12 * 8, heightOfBoard = twoByFourHeight) {
    cube([twoByFourWidth, heightOfBoard, lengthInInches * oneInchInMm]);
}

module hardwareCloth(heightIn, widthIn) {
    verticalLines = widthIn * 2;
    horizontalLines = heightIn * 2;
    halfInch = oneInchInMm / 2;

    //draw vertical lines    
    for(x = [0:verticalLines - 1]) {
        translate([halfInch * x, 0, 0])
        cube([hardwareClothThickness, hardwareClothThickness, heightIn * oneInchInMm]);
    }
    
    // draw horizontal lines
    for(y = [0:horizontalLines - 1]) {
        translate([0, 0, halfInch * y])
        cube([widthIn * oneInchInMm, hardwareClothThickness, hardwareClothThickness]);
    }
}

module makeChickens() {
    color("orange")
    translate([twoFeet, twoFeet, thicknessOfFloor])
    rotate([0,0,115])
    makeChicken();
    
    color("black")
    translate([oneFoot, threeFeet, thicknessOfFloor])
    rotate([0,0,-15])
    makeChicken();
    
    translate([sixFeet, threeFeet, thicknessOfFloor])
    rotate([0,0,80])
    makeChicken();
    
    translate([sevenFeet, fiveFeet, thicknessOfFloor])
    rotate([0,0,45])
    makeChicken();
}

module makeChicken() {
    color("red")
    resize([oneFoot / 2, 0, 0], auto=true)
    import("Chicken.stl", convexity=3);
}

module makeRoof() {
	// TODO frame on bottom
	makeRoofHardwareCloth();
	// TODO angled thingy to make the roof sloped
	// TODO corrugated roofing
}

module makeRoofHardwareCloth() {
	translate([0, eightFeet, eightFeet + thicknessOfFloor + twoByFourWidth * 2])
	rotate([90,0,0])
	hardwareCloth(8 * 12, 10 * 12);
}

color("green")      makeFloorBeams();
color("green")      makeFloor();
                    makeFront();
color("orange")     makeBack();
                    makeLeft();
color("purple")     makeRight();
color("purple")     makeDivider();
makeCoop();
makeRoof();

render()
makeChickens();
