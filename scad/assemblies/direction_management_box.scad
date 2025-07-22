/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: direction_management_box
 */

// Include configuration file
include <../config/global_variables.scad>

// include common parts
include <../parts/signal_box.scad>
include <../parts/signal_lever.scad>

// include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git


// module T_axis() {
//     hull() {
//         translate([0, -overlap_cube_depth, 0])cylinder(h=body_width, d=axis_diameter+move_tolerance);
//         translate([0, overlap_cube_depth, 0])cylinder(h=body_width, d=axis_diameter+move_tolerance);
//     }
//     hull() {
//         cylinder(h=body_width, d=axis_diameter+move_tolerance);
//         translate([overlap_cube_depth-2*move_tolerance, 0, 0]) cylinder(h=body_width,
//         d=axis_diameter+move_tolerance);
//     }
// }
// module Y_axis() {
//     hull(){
//         fwd(overlap_cube_depth) cylinder(h=body_width, d=axis_diameter+move_tolerance);
//         right(overlap_cube_depth/2) cylinder(h=body_width, d=axis_diameter+move_tolerance);
//     }
//     hull(){
//         back(overlap_cube_depth) cylinder(h=body_width, d=axis_diameter+move_tolerance);
//         right(overlap_cube_depth/2) cylinder(h=body_width, d=axis_diameter+move_tolerance);
//     }
//     hull() {
//         right(overlap_cube_depth/2) cylinder(h=body_width, d=axis_diameter+move_tolerance);
//         right((3/2)*overlap_cube_depth) cylinder(h=body_width, d=axis_diameter+move_tolerance);
//     }
// }

module V_axis() {
	hull() {
		fwd(overlap_cube_depth) cylinder(h = body_width, d = axis_diameter + move_tolerance);
		right((3 / 2) * overlap_cube_depth) cylinder(h = body_width, d = axis_diameter + move_tolerance);
	}
	hull() {
		back(overlap_cube_depth) cylinder(h = body_width, d = axis_diameter + move_tolerance);
		right((3 / 2) * overlap_cube_depth) cylinder(h = body_width, d = axis_diameter + move_tolerance);
	}
	right((1 / 6) * overlap_cube_depth + 0.25) difference() {
		translate([ (axis_diameter + move_tolerance) / 2, 0, body_width / 2 ])
		cube([ (axis_diameter + move_tolerance), axis_diameter, body_width ], center = true);
		down(0.1) cylinder(h = body_width + 0.2, d = axis_diameter + move_tolerance);
	}
}

module I_axis(){
	hull(){
		cylinder(h = body_width, d = axis_diameter + move_tolerance);
		right((3 / 2) * overlap_cube_depth) cylinder(h = body_width, d = axis_diameter + move_tolerance);
	}
}

module cavity_cube_direction_management() {
	module guide_cube() {
		diff() cuboid(
		    [
			    body_width - 2 * wall_thickness_x + 0.1, arrow_block_depth + 2.5 * move_tolerance,
			    z_pos_axis - arrow_block_height / 2 - move_tolerance -
			    wall_thickness_z
		    ],
		    anchor = BOTTOM + LEFT + FWD, rounding = 2,
		    edges =
		        TOP + BACK) { // rounding = 2 because you can turn the block without neutral position with 3mm rounding
			// remove middle
			tag("remove") position(TOP) cuboid(
			    [
				    8, arrow_block_depth + 2.5 * move_tolerance, z_pos_axis - arrow_block_height / 2 - move_tolerance -
				    wall_thickness_z
			    ],
			    anchor = TOP);
			// add middle with rounding
			tag("keep") position(BOTTOM) cuboid(
			    [
				    8, arrow_block_depth - engraving_height - move_tolerance,
				    z_pos_axis - arrow_block_height / 2 - move_tolerance - wall_thickness_z -
				    engraving_height
			    ],
			    anchor = BOTTOM, rounding = 2, edges = TOP + BACK);
		}
	}

	translate([ wall_thickness_x, wall_thickness_y, wall_thickness_z ])
	difference() {
		cube([ body_width - 2 * wall_thickness_x, body_depth - 2 * wall_thickness_y, body_height - wall_thickness_z ]);
		guide_cube();
		translate([ body_width - 2 * wall_thickness_x, body_depth - 2 * wall_thickness_y, 0 ])
		zrot(180) guide_cube();
	}
}

// module direction_management_onePiece(){
//     difference(){
//         signal_box(); // import from basis_component-roundedBox
//         translate([body_width*(1/2),body_depth*(1/6),wall_thickness_z])cylinder(d=locker_width+move_tolerance,
//         h=body_height-wall_thickness_z);
//         translate([body_width*(1/2),body_depth*(5/6),wall_thickness_z])cylinder(d=locker_width+move_tolerance,
//         h=body_height-wall_thickness_z);
//     }
//     translate([body_width/2, body_depth/2, body_height])rotate([0,0,90]) bidirectional_arrow();
// }

module direction_management_box() {
	difference() {
		signal_box(); // import from basis_component-roundedBox
		cavity_cube_direction_management();
		// axis
		translate([ 0, body_depth / 2, z_pos_axis ])
		rotate([ 0, 90, 0 ])
		//V_axis(); // cylinder(h=body_width, d=axis_diameter+move_tolerance);
		I_axis();
		// handle space
		lever_space_cubes();
		// locker pin hole
		difference() {
			translate([ body_width / 2, body_depth - wall_thickness_y / 2, 0 ])
			cylinder(h = locker_height, d = locker_width + 2 * move_tolerance);
			translate([ wall_thickness_x + move_tolerance, body_depth - wall_thickness_y, 0 ])
			cube([ block_width, locker_width, locker_height ]);
		}
		difference() {
			translate([ body_width / 2, wall_thickness_y / 2, 0 ])
			cylinder(h = locker_height, d = locker_width + 2 * move_tolerance);
			translate([ wall_thickness_x + move_tolerance, -locker_width + wall_thickness_y, 0 ])
			cube([ block_width, locker_width, locker_height ]);
		}
	}
}

direction_management_box();
