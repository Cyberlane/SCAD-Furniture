module bed_frame() {
	union() {
		translate([0,0,0]) {
			cube([156.7,5.2,30]);
		}
		translate([149.2,5.2,25]) {
			cube([7.5,201,5]);
		}
		translate([0,5.2,25]) {
			cube([7.5,201,5]);
		}
		translate([3,5.2,12.5]) {
			cube([4.5,201,17.5]);
		}
		translate([149.2,5.2,12.5]){
			cube([4.5,201,17.5]);
		}
		translate([0,206.2,0]) {
			cube([156.7,5,78]);
		}
	}
}
// TV needs 60 height

BedWidth = 156.7;
CabinetDepth = 25;
ThinBoard = 3;
ThickBoard = 5;
ShelfSpacing = 20;
ShelfWidth = 75;
TvAreaHeight = 60;
ShelfTotalHeight = 80;

module tv_stand() {
	union() {
		translate([ThinBoard,0,ShelfTotalHeight+(ThinBoard*2)]) {
			cube([BedWidth-(ThinBoard*2),ThinBoard,TvAreaHeight]);
		}
		translate([0,0,ShelfTotalHeight+(ThinBoard*2)]) {
			cube([ThinBoard,CabinetDepth,TvAreaHeight]);
		}
		translate([BedWidth-ThinBoard,0,ShelfTotalHeight+(ThinBoard*2)]) {
			cube([ThinBoard,CabinetDepth,TvAreaHeight]);
		}
		translate([0,0,TvAreaHeight+ShelfTotalHeight+(ThinBoard*2)]) {
			cube([BedWidth,CabinetDepth,ThinBoard]);
		}
		translate([0,0,0]) {
			cube([BedWidth,CabinetDepth,ThinBoard]);
		}
		translate([0,CabinetDepth-ThinBoard,ThinBoard]) {
			cube([BedWidth,ThinBoard,ShelfTotalHeight]);
		}
		translate([0,ThinBoard,ThinBoard]) {
			cube([ThinBoard,CabinetDepth-(ThinBoard*2),ShelfTotalHeight]);
		}
		translate([BedWidth-ThinBoard,ThinBoard,ThinBoard]) {
			cube([ThinBoard,CabinetDepth-(ThinBoard*2),ShelfTotalHeight]);
		}
		translate([0,0,ShelfTotalHeight+ThinBoard]) {
			cube([BedWidth,CabinetDepth,ThinBoard]);
		}
		translate([(BedWidth-ThickBoard)/2,0,ThinBoard]) {
			cube([ThickBoard,CabinetDepth-ThinBoard,ShelfTotalHeight]);
		}
		translate([ThinBoard,ThinBoard,ShelfSpacing]) {
			cube([ShelfWidth,CabinetDepth-(ThinBoard*2),ThinBoard]);
		}
		translate([ShelfWidth+ThinBoard,ThinBoard,ShelfSpacing]) {
			cube([ShelfWidth,CabinetDepth-(ThinBoard*2),ThinBoard]);
		}
		translate([ThinBoard,ThinBoard,(ShelfSpacing*2)+ThinBoard]) {
			cube([ShelfWidth,CabinetDepth-(ThinBoard*2),ThinBoard]);
		}
		translate([ShelfWidth+ThinBoard,ThinBoard,(ShelfSpacing*2)+ThinBoard]) {
			cube([ShelfWidth,CabinetDepth-(ThinBoard*2),ThinBoard]);
		}
		translate([ThinBoard,ThinBoard,(ShelfSpacing*3)+(ThinBoard*2)]) {
			cube([ShelfWidth,CabinetDepth-(ThinBoard*2),ThinBoard]);
		}
		translate([ShelfWidth+ThinBoard,ThinBoard,(ShelfSpacing*3)+(ThinBoard*2)]) {
			cube([ShelfWidth,CabinetDepth-(ThinBoard*2),ThinBoard]);
		}
	}
}

translate([0,25,0]) {
	color("Brown", 0.6) {
		bed_frame();
	}
}
translate([0,0,0]) {
	color("Green", 0.4) {
		tv_stand();
	}
}