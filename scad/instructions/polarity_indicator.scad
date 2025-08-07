/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: polarity_indicator
 */

// Include configuration file
include <../config/global_variables.scad>
include <../config/colors.scad>

polarity_width = 5;
polarity_height = 5;

polarity_gap = 10;

module polarity_track_straight(){
    color(ASPECT_STOP)
    translate([-polarity_gap-polarity_width,0,0])
    cube([polarity_width, straight_length, polarity_height]);
    color(ASPECT_STOP)
    translate([polarity_gap+rail_width,0,0])
    cube([polarity_width, straight_length, polarity_height]);
}

module polarity_signal_box(){
    color(ASPECT_CLEAR)
    translate([body_width+polarity_width/2+polarity_gap,0,0])
    cube([polarity_width, body_depth, polarity_height], center = true);
    color(ASPECT_STOP)
    translate([-polarity_width/2-polarity_gap,0,0])
    cube([polarity_width, body_depth, polarity_height], center = true);
}


polarity_signal_box();