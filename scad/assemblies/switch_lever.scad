/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: switch_lever
 */

// Include configuration file
include <../config/global_variables.scad>

module switch_lever(){
    // switch_lever = swl
    swl_handle_height = 15;
    cylinder(d=rail_height, h=swl_handle_height);
    translate([0,0,swl_handle_height])
    cylinder(d=4, h=35);

}

switch_lever();