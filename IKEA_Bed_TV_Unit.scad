module bracket() {
	scale([0.3,0.3,0.3])
	rotate([0,90,270])
	import("right_angle_support.stl");
}

// Bed Variables
BedWidth = 156.7;
FooterHeight = 30;
BedBoardThickness = 5;
ThickerBedBoard = BedBoardThickness + 0.2;
InnerSideBeamHeight = 12.5;
InnerSideBeamThickness = 4.5;
UpperSideBeamWidth = 7.5;
SideBeamLength = 201.2;
HeadBoardHeight = 78;
// Shelf Variables
CabinetDepth = 35;
ThinBoard = 3;
ThickBoard = 5;
ShelfSpacing = 20;
TvAreaHeight = 60;
ShelfTotalHeight = 80;
ShelfWidth = (BedWidth-(ThinBoard*2)-ThickBoard)/2;
SupportHeight = FooterHeight-BedBoardThickness-InnerSideBeamHeight;
// Side Table Variables
ExtraThinBoard = 2;
TableHeight = 30;
TableWidth = 30;
TableDepth = 36;

module table() {
	//Bottom
	translate([ExtraThinBoard,0,0])
	cube([TableWidth-(ExtraThinBoard*2),TableDepth-ExtraThinBoard,ExtraThinBoard]);
	//Back
	translate([0,TableDepth-ExtraThinBoard,0])	
	cube([TableWidth,ExtraThinBoard,HeadBoardHeight-ExtraThinBoard]);
	//Left
	translate([0,0,0])	
	cube([ExtraThinBoard,TableDepth-ExtraThinBoard,TableHeight]);
	//Right
	translate([TableWidth-ExtraThinBoard,0,0])	
	cube([ExtraThinBoard,TableDepth-ExtraThinBoard,TableHeight]);
	//Top
	translate([0,0,TableHeight])
	cube([TableWidth,TableDepth-ExtraThinBoard,ExtraThinBoard]);
}

module bed_frame() {
	translate([0,0,0])
	cube([BedWidth,ThickerBedBoard,FooterHeight]);
	translate([BedWidth-UpperSideBeamWidth,ThickerBedBoard,FooterHeight-BedBoardThickness])
	cube([UpperSideBeamWidth,SideBeamLength,BedBoardThickness]);
	translate([0,ThickerBedBoard,FooterHeight-BedBoardThickness])
	cube([UpperSideBeamWidth,SideBeamLength,BedBoardThickness]);
	translate([UpperSideBeamWidth-InnerSideBeamThickness,ThickerBedBoard,(FooterHeight-BedBoardThickness)/2])
	cube([InnerSideBeamThickness,SideBeamLength,InnerSideBeamHeight]);
	translate([BedWidth-UpperSideBeamWidth,ThickerBedBoard,(FooterHeight-BedBoardThickness)/2])
	cube([InnerSideBeamThickness,SideBeamLength,InnerSideBeamHeight]);
	translate([0,SideBeamLength+BedBoardThickness,0])
	cube([BedWidth,BedBoardThickness,HeadBoardHeight]);
}

module tv_stand_shelf() {
	cube([ShelfWidth,CabinetDepth-(ThinBoard*2),ThinBoard]);
}

module tv_stand_mid_shelf() {
	cube([BedWidth-(ThickBoard*2),CabinetDepth,ThickBoard]);
}

module tv_stand_long_shelf() {
	cube([BedWidth,CabinetDepth,ThickBoard]);
}

module tv_side_panel() {
	cube([ThickBoard,CabinetDepth,ShelfTotalHeight+TvAreaHeight+1]);
}

module tv_stand() {
	// Top Board
	translate([0,0,TvAreaHeight+ShelfTotalHeight+(ThinBoard*2)])
	tv_stand_long_shelf();
	// TV Base Board
	translate([ThickBoard,0,ShelfTotalHeight+ThinBoard])
	tv_stand_mid_shelf();
	// Bottom Board
	translate([0,0,0])
	tv_stand_long_shelf();
	// TV Backing
	translate([0,0,ShelfTotalHeight+(ThinBoard*2)])
	cube([BedWidth,ThinBoard,TvAreaHeight]);
	// Foot Board
	translate([0,CabinetDepth-ThinBoard,ThinBoard])
	cube([BedWidth,ThinBoard,ShelfTotalHeight]);
	// Left Panel
	translate([0,0,ThickBoard])
	tv_side_panel();
	// Right Panel
	translate([BedWidth-ThickBoard,0,ThickBoard])
	tv_side_panel();
	// Mid Divider
	translate([(BedWidth-ThickBoard)/2,0,ThickBoard])
	cube([ThickBoard,CabinetDepth-ThinBoard,ShelfTotalHeight]);
	// Left Shelves
	translate([ThinBoard,ThinBoard,ShelfSpacing])
	tv_stand_shelf();
	translate([ThinBoard,ThinBoard,(ShelfSpacing*2)+(ThinBoard)])
	tv_stand_shelf();
	translate([ThinBoard,ThinBoard,(ShelfSpacing*3)+(ThinBoard*2)])
	tv_stand_shelf();
	// Right Shelves
	translate([ShelfWidth+ThickBoard+ThinBoard,ThinBoard,ShelfSpacing])
	tv_stand_shelf();
	translate([ShelfWidth+ThickBoard+ThinBoard,ThinBoard,(ShelfSpacing*2)+(ThinBoard)])
	tv_stand_shelf();
	translate([ShelfWidth+ThickBoard+ThinBoard,ThinBoard,(ShelfSpacing*3)+(ThinBoard*2)])
	tv_stand_shelf();
}

module tv_stand_support() {
	translate([ThickBoard,CabinetDepth+ThickerBedBoard,0])
	cube([BedWidth,ThickBoard,SupportHeight]);
	translate([0,0,0])
	cube([ThickBoard,CabinetDepth+ThickerBedBoard+ThickBoard,ThickBoard]);
	translate([BedWidth+ThickBoard,0,0])
	cube([ThickBoard,CabinetDepth+ThickerBedBoard+ThickBoard,ThickBoard]);
}

module headboard_shelf() {
	translate([0,0,0])
	cube([2,10,76]);
	translate([154.7,0,0])
	cube([2,10,76]);
	translate([0,0,76])
	cube([156.7,10,2]);
	translate([2,6,76])
	bracket();
	translate([154.7,6,76])
	rotate([0,0,180])
	bracket();
}

color("Brown", 0.6)
translate([5,35,0])
bed_frame();

color("Green", 0.4)
translate([5,0,0])
tv_stand();

color("Blue", 0.4)
translate([0,0,0])
tv_stand_support();

color("Orange", 0.4)
translate([-25,208,0])
table();
translate([161.6,208,0])
table();
translate([5,246,0])
headboard_shelf();