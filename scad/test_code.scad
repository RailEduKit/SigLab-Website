/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: checkbox_route
 */

// Include configuration file
include <config/global_variables.scad>

// include common components
include <parts/signal_box.scad>
include <parts/checkbox_symbols_route.scad>

rc_symbol_xpos = body_width - (body_width - (body_width*(1/3)+locker_width/2))/2;




	translate([ rc_symbol_xpos, body_depth * (1 / 6), body_height ])
	color(INDICATOR_COLOR) turnout_locking_symbol();
	translate([ rc_symbol_xpos, body_depth * (3 / 6), body_height ])
	color(INDICATOR_COLOR) flank_protection_symbol();
	translate([ rc_symbol_xpos, body_depth * (5 / 6), body_height ])
	color(INDICATOR_COLOR) overlap_symbol();
