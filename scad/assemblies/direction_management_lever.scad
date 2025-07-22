/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: direction_management_lever
 */

// Include configuration file
include <../config/global_variables.scad>

// include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git


// module bidirectional_arrow(){
//     translate([-arrowline_length/2,-engraving_thickness/2,0])cube([arrowline_length,engraving_thickness,engraving_height]);

//     translate([arrow_depth*(3/8)+arrowline_length/2,0,0]) scale([3/4,(arrow_depth/(2*arrow_depth*sin(120))),1])
//     cylinder(engraving_height,arrow_depth,arrow_depth,$fn=3);

//     rotate([0,0,180]) translate([arrow_depth*(3/8)+arrowline_length/2,0,0])
//     scale([3/4,(arrow_depth/(2*arrow_depth*sin(120))),1]) cylinder(engraving_height,arrow_depth,arrow_depth,$fn=3);
// }

module onedirect_arrow() {
	translate([ -arrowline_length, -3 / 2, 0 ])
	cube([ arrowline_length, 3, engraving_height ]);
	translate([ arrow_depth * (3 / 8), 0, 0 ])
	scale([ 3 / 4, (arrow_depth / (2 * arrow_depth * sin(120))), 1 ])
	    cylinder(engraving_height, arrow_depth, arrow_depth, $fn = 3);
}


module direction_management_lever() {
	difference() {
		union() {
			// v axis
/* 			cube([ block_width, arrow_block_depth, arrow_block_height ]);
			translate([ 0, arrow_block_depth, 0 ])
			cube([ block_width, overlap_cube_depth, arrow_block_height ]); */

			// I axis
			cube([ block_width, block_depth, arrow_block_height ]);
			translate([ 0, block_depth, 0 ])
			cube([ block_width, overlap_cube_depth, arrow_block_height ]);

			// translate([0,arrow_block_depth+overlap_cube_depth,arrow_block_height/2]) scale([1,0.5,1])
			// rotate([0,90,0]) cylinder(h=block_width, r=arrow_block_height/2); // scale y:
			// (overhang)/(arrow_block_height/2) // curve is flat, because the printer can't make that much overhang
			// handle
			translate([ 0, -handle_depth, (arrow_block_height - handle_height) / 2 ])
			cube([ block_width, handle_depth, handle_height ]);
		}
		// axis
		// v axis
		// translate([ 0, arrow_block_depth, arrow_block_height / 2 ])
		// I axis
		translate([ 0, block_depth, arrow_block_height / 2 ])
		rotate([ 0, 90, 0 ])
		cylinder(h = block_width, d = axis_diameter);
		// locker pin hole
		translate([ block_width / 2, -wall_thickness_y / 2 - 3 * move_tolerance, 0 ])
		cylinder(h = locker_height, d = locker_width + 2 * move_tolerance);
	}
	// arrows
	translate([ block_width / 2, block_depth / 2 + (locker_width) / 2 - 4.5, arrow_block_height ])
	rotate([ 0, 0, -90 ])
	onedirect_arrow();
	translate([ block_width / 2, block_depth / 2 + (locker_width) / 2 - 4.5, -engraving_height ])
	rotate([ 0, 0, -90 ])
	onedirect_arrow();
}

direction_management_lever();