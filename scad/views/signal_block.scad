/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: signal_block
 */

// Include configuration file
include <../config/global_variables.scad>

// include other parts
use <../assemblies/locking_pin.scad> // used in visualize_colorBlock_in_body("block", "y");
use <../assemblies/signal_box_block.scad>
use <../assemblies/signal_lever_block.scad>




module visualize_colorBlock_in_body(state) {
	translate([ 0, -body_depth / 2, -z_pos_axis ])
	signal_box_block(); // z=-block_height/2-wall_thickness_z
	if (state == "-y") {
		rotate([ 0, 0, 0 ])
		translate([
			wall_thickness_x + move_tolerance, -body_depth / 2 + wall_thickness_y + 3 * move_tolerance,
			-block_height / 2 - wall_thickness_z +
			wall_thickness_z
		])
		signal_lever_block();
	}
	if (state == "y") {
		rotate([ -180, 0, 0 ])
		translate([
			wall_thickness_x + move_tolerance, -body_depth / 2 + wall_thickness_y + 3 * move_tolerance,
			-block_height / 2 - wall_thickness_z +
			wall_thickness_z
		])
		signal_lever_block();
		translate([ body_width / 2, (body_depth - wall_thickness_y) / 2, locker_height - 0.5 - z_pos_axis ])
		rotate([ 180, 0, 90 ])
		locking_pin();
	}
}


visualize_colorBlock_in_body("y");
