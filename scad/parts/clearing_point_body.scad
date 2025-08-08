/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: clearing_point_body
 */

// Include configuration file
include <../config/global_variables.scad>
include <../config/colors.scad>

// Include common parts
include <../parts/magnet_hole.scad>
include <../parts/driving_direction_arrow.scad>

module clearing_point_body() {
	color(BASE_COLOR)
	difference() {
		cube([ zs_width, zs_depth, zs_height ]);
		// Magnet holes
		translate([ zs_width / 2 - magnet_distance_to_middle, magnet_thickness + move_tolerance, magnet_z ])
		rotate([ 90, 0, 0 ])
		magnet_hole();
		translate([ zs_width / 2 + magnet_distance_to_middle, magnet_thickness + move_tolerance, magnet_z ])
		rotate([ 90, 0, 0 ])
		magnet_hole();
		translate([ zs_width / 2 - magnet_distance_to_middle, zs_depth, magnet_z ])
		rotate([ 90, 0, 0 ])
		magnet_hole();
		translate([ zs_width / 2 + magnet_distance_to_middle, zs_depth, magnet_z ])
		rotate([ 90, 0, 0 ])
		magnet_hole();
	}
}

//clearing_point_body();