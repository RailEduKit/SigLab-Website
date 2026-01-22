/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: checkbox_route
 */

// Include configuration file
include <../config/global_variables.scad>

// use common parts
use <../assemblies/checkbox_route.scad>
use <polarity_indicator.scad>

module checkbox_route_polarity(){
    translate([ body_width, body_depth / 2, -z_pos_axis ])
    rotate([0,0,180])
    checkbox_route();
    polarity_bars_signal_box();
}

checkbox_route_polarity();