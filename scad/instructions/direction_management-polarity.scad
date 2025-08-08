/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: direction_management
 */

// Include configuration file
include <../config/global_variables.scad>

// use common parts
use <../views/direction_management.scad>
use <polarity_indicator.scad>

// include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git

module direction_management_polarity(state){
    direction_management(state);
    polarity_bars_signal_box();
}

direction_management_polarity("y");