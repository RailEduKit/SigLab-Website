/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: overlap pattern
 */

include <../config/global_variables.scad>
include <../config/colors.scad>

// Include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git
include <BOSL2/joiners.scad> // Import joiners from dependency BelfrySCAD/BOSL2.git

bar_width = 3;
bar_depth = sqrt(pow(ris_width, 2) + pow(ris_width, 2));


module bar_master(){
    difference() {
        zrot(-45) cuboid([bar_width, bar_depth, number_height], anchor = (TOP+FRONT+LEFT));
        cuboid([2*bar_width, 2*bar_width, number_height], anchor = (TOP+BACK+LEFT));
        translate([sqrt(pow(bar_depth,2)/2),sqrt(pow(bar_depth,2)/2),0])
        cuboid([2*bar_width, 3*bar_width, number_height], anchor = (TOP+LEFT));
    }

}



