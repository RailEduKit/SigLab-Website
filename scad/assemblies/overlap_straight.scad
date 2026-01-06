/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: overlap_straight
 */

// Include configuration file
include <../config/global_variables.scad>
include <../config/colors.scad>

// Include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git
include <BOSL2/joiners.scad> // Import joiners from dependency BelfrySCAD/BOSL2.git


// Include common parts
use <track_indicator_straight.scad>
include <../parts/overlap_bar.scad>

module negative_track_indicator(){
    difference(){
        cuboid([ris_width+3, straight_length + 3*bar_depth, om_thickness]);
        track_indicator_straight();
    }
}

module overlap_pattern(){
    x = round(straight_length / sqrt(2*pow(bar_width,2)));
    for(i = [-6:2:x]){
        left(ris_width/2 - bar_frame) back(i*sqrt(2*pow(bar_width,2))+bar_frame) bar_master(); 
    }
}

module overlap_straight(){
    up(om_thickness/2 + 0.011) difference(){ // +0.011 to see it at the surface of the track indicator straigth
        overlap_pattern();
        back(straight_length/2) negative_track_indicator();
    }
    color(ROUTE_COLOR) back(straight_length/2) track_indicator_straight();
}
overlap_straight();
//negative_track_indicator();
//overlap_pattern();


/* left(ris_width/2 - bar_frame) up(om_thickness/2 + 0.011) back(bar_frame) bar_master();
left(ris_width/2 - bar_frame) up(om_thickness/2 + 0.011) back(-2*sqrt(2*pow(bar_width,2))+bar_frame) bar_master();
left(ris_width/2 - bar_frame) up(om_thickness/2 + 0.011) back(-4*sqrt(2*pow(bar_width,2))+bar_frame) bar_master(); */

