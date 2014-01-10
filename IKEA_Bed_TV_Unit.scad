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

module tv_stand() {
	union() {
		translate([0,0,0]) {
			cube([156.7,25,3]);
		}
		translate([0,22,3]) {
			cube([156.7,3,80]);
		}
		translate([0,3,3]) {
			cube([3,19,80]);
		}
		translate([153.7,3,3]) {
			cube([3,19,80]);
		}
		translate([0,0,83]) {
			cube([156.7,25,3]);
		}
		translate([75.85,0,3]) {
			cube([5,22,80]);
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
