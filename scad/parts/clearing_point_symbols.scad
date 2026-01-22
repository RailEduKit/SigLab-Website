/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: clearing_point_symbols
 */

// Include configuration file
include <../config/global_variables.scad>
include <../config/colors.scad>
include <../parts/clearing_point_body.scad>

// cp = clearing_point
cp_symbol_side_space = 2;
cp_symbol_size = zs_depth-2*cp_symbol_side_space;


module route_clearing_symbol() {
	color(ROUTE_COLOR)
	union() {
		difference() {
			cylinder(h = engraving_height, d = cp_symbol_size);
			cylinder(h = engraving_height, d = cp_symbol_size - 2 * engraving_thickness);
		}
	}
}

module block_clearing_symbol() {
	color(INDICATOR_COLOR)
	translate([ 0, 0, engraving_height / 2 ])
	union() {
		difference() {
			cube([ cp_symbol_size, cp_symbol_size, engraving_height ], center = true);
			cube(
			    [
				    cp_symbol_size - 2 * engraving_thickness, cp_symbol_size - 2 * engraving_thickness,
				    engraving_height
			    ],
			    center = true);
		}
	}
}

//route_clearing_symbol();
//block_clearing_symbol();

