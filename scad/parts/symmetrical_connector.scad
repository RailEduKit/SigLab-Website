/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: symmetrical_connector
 */

// Include configuration file
include <../config/global_variables.scad>



// Include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git
include <BOSL2/joiners.scad> // Import joiners from dependency BelfrySCAD/BOSL2.git

module symmetrical_connector(){
    right(ris_width*(1/4)) dovetail("male", w = om_dovetail_width, h = om_dovetail_depth, slide = om_thickness, radius = om_dovetail_depth/7,round = true, angle = om_dovetail_angle);
    left(ris_width*(1/4)) tag("remove") dovetail("female", w = om_dovetail_width, h = om_dovetail_depth, slide = om_thickness, radius = om_dovetail_depth/7, round = true, $slop = 0.1, angle=om_dovetail_angle);
}