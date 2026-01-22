/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: overlap bar
 */

include <../config/global_variables.scad>
include <../config/colors.scad>

// Include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git
include <BOSL2/joiners.scad> // Import joiners from dependency BelfrySCAD/BOSL2.git

bar_width = 3;
additional_frame = 0; // can be used if the printer can't handle the rounding with the small normal frame
bar_frame = (sqrt(pow(bar_width,2)/2) + additional_frame)/2;
bar_depth = sqrt(pow(ris_width - additional_frame, 2) + pow(ris_width - additional_frame, 2));


module bar_master(length){
    zrot(-45) cuboid([bar_width, length, number_height], anchor = (TOP+FRONT+RIGHT));
}

module bar_for_curve(){
    color(INDICATOR_COLOR) bar_master(bar_depth);
}

module bar_long(){
    translate([-sqrt(pow(2*ric_inner_radius,2)/2), -sqrt(pow(2*ric_inner_radius,2)/2), 0]) color(INDICATOR_COLOR) bar_master(2*(2*ric_inner_radius));
}

module bar_for_straight(){
    color(INDICATOR_COLOR) difference() {
        bar_master(bar_depth);
        // flat left
        cuboid([2*bar_width, 2*bar_width, number_height], anchor = (TOP+FRONT+RIGHT));
        // flat right
        translate([sqrt(pow(bar_depth,2)/2) - sqrt(pow(bar_width,2)/2),sqrt(pow(bar_depth,2)/2),0])
        cuboid([2*bar_width, 3*bar_width, number_height], anchor = (TOP+LEFT));
    }

}

/* color(BASE_COLOR) bar_for_straight();
bar_long(); */


