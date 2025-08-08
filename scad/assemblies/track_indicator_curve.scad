/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: track indicator straight
 */

// Include configuration file
include <../config/global_variables.scad>

// Include common parts
include <../parts/symmetrical_connector.scad>

// Include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git
include <BOSL2/joiners.scad> // Import joiners from dependency BelfrySCAD/BOSL2.git

module track_indicator_curve() {
    diff() union(){
            rotate_extrude(angle=curve_angle)
            right(ric_inner_radius) rect([ris_width, om_thickness], rounding = ris_rounding*[1,1,0,0], anchor = LEFT+FRONT)
            xflip_copy() position(FRONT + LEFT) rect([om_track_guidance_width,om_track_guidance_height], anchor = BACK+LEFT);
        }{
            // TODO: the female dovetail gets not removed right now
            right(ric_inner_radius+ris_width/2) up(om_thickness/2) xrot(90) symmetrical_connector();
        }
        //right(ric_inner_radius+ris_width/2) up(om_thickness/2) xrot(90) symmetrical_connector();
        right(ric_inner_radius+ris_width/2) up(om_thickness/2) xrot(90) dovetail("female", w = om_dovetail_width, h = om_dovetail_depth, slide = om_thickness);
    }
//    zrot(curve_angle) right(ric_inner_radius+ris_width/2) up(om_thickness/2) xrot(-90) dovetail("male", w = om_dovetail_width, h = om_dovetail_depth, slide = om_thickness);
//}

track_indicator_curve();