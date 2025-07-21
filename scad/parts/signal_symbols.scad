/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: signal_symbol
 */

 // Include configuration file
include <../config/global_variables.scad>

module symbol_block() {
	difference() {
		cube([ signal_symbol_size, signal_symbol_size, engraving_height ]);
		translate([ engraving_thickness, engraving_thickness, 0 ])
		cube([
			signal_symbol_size - 2 * engraving_thickness, signal_symbol_size - 2 * engraving_thickness,
			engraving_height
		]);
	}
}

symbol_block();