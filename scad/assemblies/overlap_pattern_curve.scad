/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: overlap_pattern_curve
 */

 // Include configuration file
include <../config/global_variables.scad>
include <../config/colors.scad>

// Include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git
include <BOSL2/joiners.scad> // Import joiners from dependency BelfrySCAD/BOSL2.git

// Include common parts
include <../parts/symmetrical_connector.scad>
include <../parts/overlap_bar.scad>


module negative_curve_indicator(frame){
    difference(){
        cuboid([2*ric_inner_radius + 6*ris_width, 2*ric_inner_radius + 6*ris_width, om_thickness], anchor = BOTTOM);
        union(){
                rotate_extrude(angle=curve_angle)
                right(ric_inner_radius + frame) rect([ris_width - 2*frame, om_thickness], anchor = LEFT+FRONT);
                right(ric_inner_radius+ris_width/2) up(om_thickness/2) xrot(90)
                symmetrical_connector("male");
                zrot(curve_angle) right(ric_inner_radius+ris_width/2) up(om_thickness/2) zrot(180) xrot(90) 
                symmetrical_connector("male");

            }
    }
    right(ric_inner_radius+ris_width/2) up(om_thickness/2) xrot(90)
    symmetrical_connector("female");
    zrot(curve_angle) right(ric_inner_radius+ris_width/2) up(om_thickness/2) zrot(180) xrot(90)
    symmetrical_connector("female"); // Dont't worry, after rendering, the track guidance shouldn't overlap with the connector! Otherwise change the slope.
}

module overlap_pattern_curve(){
    bar_gap = sqrt(2*pow(bar_width,2));
    bar_rot = (bar_gap*360) / (2*PI*ric_inner_radius); 
    x = round(curve_angle/bar_rot);
    right(ric_inner_radius) cuboid([2,200,2], anchor = RIGHT);
    module bar_setup(){
        for(i=[0:2:x]){
            zrot(i*bar_rot) up(om_thickness) right(ric_inner_radius) bar_for_curve();
        }
        back(-2*sqrt(2*pow(bar_width,2))) up(om_thickness) right(ric_inner_radius) bar_for_curve();
        back(-4*sqrt(2*pow(bar_width,2))) up(om_thickness) right(ric_inner_radius) bar_for_curve(); //warum deckt der Balken nicht wie bei dem geraden den kompletten bereich ab?
        back(-6*sqrt(2*pow(bar_width,2))) up(om_thickness) right(ric_inner_radius) bar_for_curve();
    }
    up(0.011) difference(){
        bar_setup();
        negative_curve_indicator(bar_frame);
    }
    
}

overlap_pattern_curve();

//negative_curve_indicator(bar_frame);