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

module bed_frame() {
	union() {
		translate([0,0,0]) {
			cube([BedWidth,ThickerBedBoard,FooterHeight]);
		}
		translate([BedWidth-UpperSideBeamWidth,ThickerBedBoard,FooterHeight-BedBoardThickness]) {
			cube([UpperSideBeamWidth,SideBeamLength,BedBoardThickness]);
		}
		translate([0,ThickerBedBoard,FooterHeight-BedBoardThickness]) {
			cube([UpperSideBeamWidth,SideBeamLength,BedBoardThickness]);
		}
		translate([UpperSideBeamWidth-InnerSideBeamThickness,ThickerBedBoard,(FooterHeight-BedBoardThickness)/2]) {
			cube([InnerSideBeamThickness,SideBeamLength,InnerSideBeamHeight]);
		}
		translate([BedWidth-UpperSideBeamWidth,ThickerBedBoard,(FooterHeight-BedBoardThickness)/2]) {
			cube([InnerSideBeamThickness,SideBeamLength,InnerSideBeamHeight]);
		}
		translate([0,SideBeamLength+BedBoardThickness,0]) {
			cube([BedWidth,BedBoardThickness,HeadBoardHeight]);
		}
	}
}

module tv_stand() {
	union() {
		// Top Board
		translate([0,0,TvAreaHeight+ShelfTotalHeight+(ThinBoard*2)]) {
			cube([BedWidth,CabinetDepth,ThinBoard]);
		}
		// TV Backing
		translate([ThinBoard,0,ShelfTotalHeight+(ThinBoard*2)]) {
			cube([BedWidth-(ThinBoard*2),ThinBoard,TvAreaHeight]);
		}
		// TV Right Panel
		translate([0,0,ShelfTotalHeight+(ThinBoard*2)]) {
			cube([ThinBoard,CabinetDepth,TvAreaHeight]);
		}
		// TV Left Panel
		translate([BedWidth-ThinBoard,0,ShelfTotalHeight+(ThinBoard*2)]) {
			cube([ThinBoard,CabinetDepth,TvAreaHeight]);
		}
		// TV Base Board
		translate([0,0,ShelfTotalHeight+ThinBoard]) {
			cube([BedWidth,CabinetDepth,ThinBoard]);
		}
		// Foot Board
		translate([0,CabinetDepth-ThinBoard,ThinBoard]) {
			cube([BedWidth,ThinBoard,ShelfTotalHeight]);
		}
		// Left Panel
		translate([0,ThinBoard,ThickBoard]) {
			cube([ThinBoard,CabinetDepth-(ThinBoard*2),ShelfTotalHeight]);
		}
		// Right Panel
		translate([BedWidth-ThinBoard,ThinBoard,ThickBoard]) {
			cube([ThinBoard,CabinetDepth-(ThinBoard*2),ShelfTotalHeight]);
		}
		// Mid Divider
		translate([(BedWidth-ThickBoard)/2,0,ThickBoard]) {
			cube([ThickBoard,CabinetDepth-ThinBoard,ShelfTotalHeight]);
		}
		// Shelves
		translate([ThinBoard,ThinBoard,ShelfSpacing]) {
			cube([ShelfWidth,CabinetDepth-(ThinBoard*2),ThinBoard]);
		}
		translate([ShelfWidth+ThinBoard,ThinBoard,ShelfSpacing]) {
			cube([ShelfWidth,CabinetDepth-(ThinBoard*2),ThinBoard]);
		}
		translate([ThinBoard,ThinBoard,(ShelfSpacing*2)+(ThinBoard)]) {
			cube([ShelfWidth,CabinetDepth-(ThinBoard*2),ThinBoard]);
		}
		translate([ShelfWidth+ThinBoard,ThinBoard,(ShelfSpacing*2)+(ThinBoard)]) {
			cube([ShelfWidth,CabinetDepth-(ThinBoard*2),ThinBoard]);
		}
		translate([ThinBoard,ThinBoard,(ShelfSpacing*3)+(ThinBoard*2)]) {
			cube([ShelfWidth,CabinetDepth-(ThinBoard*2),ThinBoard]);
		}
		translate([ShelfWidth+ThinBoard,ThinBoard,(ShelfSpacing*3)+(ThinBoard*2)]) {
			cube([ShelfWidth,CabinetDepth-(ThinBoard*2),ThinBoard]);
		}
		//Bottom Board
		translate([0,0,0]) {
			cube([BedWidth,CabinetDepth,ThickBoard]);
		}
	}
}

module tv_stand_support() {
	union() {
		translate([ThickBoard,CabinetDepth+ThickerBedBoard,0]) {
			cube([BedWidth,ThickBoard,SupportHeight]);
		}
		translate([0,0,0]) {
			cube([ThickBoard,CabinetDepth+ThickerBedBoard+ThickBoard,ThickBoard]);
		}
		translate([BedWidth+ThickBoard,0,0]) {
			cube([ThickBoard,CabinetDepth+ThickerBedBoard+ThickBoard,ThickBoard]);
		}
	}
}

translate([5,35,0]) {
	color("Brown", 0.6) {
		bed_frame();
	}
}
translate([5,0,0]) {
	color("Green", 0.4) {
		tv_stand();
	}
}
translate([0,0,0]) {
	color("Blue", 0.4) {
		tv_stand_support();
	}
}