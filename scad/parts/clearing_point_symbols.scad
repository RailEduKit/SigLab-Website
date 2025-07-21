/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: clearing_point_symbols
 */

// Include configuration file
include <../config/global_variables.scad>

module route_clearing_symbol() {
	union() {
		difference() {
			cylinder(h = engraving_height, d = cp_symbol_size);
			cylinder(h = engraving_height, d = cp_symbol_size - 2 * engraving_thickness);
		}
	}
}

module block_clearing_symbol() {
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

