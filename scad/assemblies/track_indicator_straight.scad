/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: track indicator straight
 */

// Include configuration file
include <../config/global_variables.scad>

// Include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git
include <BOSL2/joiners.scad> // Import joiners from dependency BelfrySCAD/BOSL2.git

/* module track_indicator_straight() {
    diff()
        cuboid([ris_width, ris_length, om_thickness], rounding = ris_rounding, edges = [TOP+LEFT, TOP+RIGHT, FRONT+LEFT, FRONT+RIGHT, BACK+LEFT, BACK+RIGHT]){
            xflip_copy() position(BOTTOM+LEFT+FRONT) cuboid([om_track_guidance_width, ris_length, om_track_guidance_height], anchor= LEFT+TOP+FRONT, rounding= ris_rounding, edges = [LEFT+FRONT, LEFT+BACK]);
            attach(FRONT) dovetail("male", w = om_dovetail_width, h = om_dovetail_depth, slide = om_thickness);
            tag("remove") attach(BACK) dovetail("female", w = om_dovetail_width, h = om_dovetail_depth, slide = om_thickness);
        }
    

    
} */

//ris_length = 15;

module half_dovetail(){
    diff()
    dovetail("male", w = ris_width+dovetail_overhang, h = om_dovetail_depth, slide = om_thickness){
        tag("remove") cuboid([(ris_width+dovetail_overhang)/2, om_thickness+1, om_dovetail_depth+1], anchor = LEFT);
    }
}


module track_indicator_straight() {
    diff()
        cuboid([ris_width, ris_length-om_dovetail_depth, om_thickness], rounding = ris_rounding, edges = [TOP+LEFT, TOP+RIGHT, FRONT+LEFT, BACK+RIGHT]){
            position(BOTTOM+LEFT+FRONT) cuboid([om_track_guidance_width, ris_length, om_track_guidance_height], anchor= LEFT+TOP+FRONT, rounding= ris_rounding, edges = [LEFT+FRONT, LEFT+BACK]);
            position(BOTTOM+RIGHT+BACK) cuboid([om_track_guidance_width, ris_length, om_track_guidance_height], anchor= RIGHT+TOP+BACK, rounding= ris_rounding, edges = [RIGHT+FRONT, RIGHT+BACK]);
            position(FRONT+RIGHT) right(dovetail_overhang*(1/4)) xrot(90) dovetail("male", w = ris_width+dovetail_overhang, h = om_dovetail_depth, slide = om_thickness);
            position(BACK+LEFT) left(dovetail_overhang*(1/4)) xrot(-90) dovetail("male", w = ris_width+dovetail_overhang, h = om_dovetail_depth, slide = om_thickness);
            tag("remove") position(RIGHT+FRONT) back(0.5) cuboid([(ris_width+dovetail_overhang), om_dovetail_depth+1, om_thickness+1], anchor = LEFT+BACK);
            tag("remove") position(BACK+LEFT) fwd(0.5) cuboid([(ris_width+dovetail_overhang), om_dovetail_depth+1, om_thickness+1], anchor = RIGHT+FRONT);
            //tag("remove") translate([-3,-3,-om_thickness+1]) linear_extrude(h=1) text("3/4", size=6);
            //tag("remove") attach(BACK) dovetail("female", w = om_dovetail_width, h = om_dovetail_depth, slide = om_thickness);
        }
    

    
}

//half_dovetail();
track_indicator_straight();