/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: route indicator straight
 */

// Include configuration file
include <../config/global_variables.scad>

// Include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git
include <BOSL2/joiners.scad> // Import joiners from dependency BelfrySCAD/BOSL2.git

module route_indicator_straight() {
    diff()
        cuboid([ris_width, ris_length, om_thickness], rounding = ris_rounding, edges = [TOP+LEFT, TOP+RIGHT, FRONT+LEFT, FRONT+RIGHT, BACK+LEFT, BACK+RIGHT]){
            xflip_copy() position(BOTTOM+LEFT+FRONT) cuboid([om_track_guidance_width, ris_length, om_track_guidance_height], anchor= LEFT+TOP+FRONT, rounding= ris_rounding, edges = [LEFT+FRONT, LEFT+BACK]);
            attach(FRONT) dovetail("male", w = om_dovetail_width, h = om_dovetail_depth, slide = om_thickness);
            tag("remove") attach(BACK) dovetail("female", w = om_dovetail_width, h = om_dovetail_depth, slide = om_thickness);
        }
    

    
}

route_indicator_straight();