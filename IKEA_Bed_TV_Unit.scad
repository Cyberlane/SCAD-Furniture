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

translate([0,0,0]) {
	color("Brown", 0.6) {
		bed_frame();
	}
}