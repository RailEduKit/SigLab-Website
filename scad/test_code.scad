/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: route indicator straight
 */

// Include configuration file
include <config/global_variables.scad>

// Include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git
include <BOSL2/joiners.scad> // Import joiners from dependency BelfrySCAD/BOSL2.git

rotate_extrude(angle=45)
right(20) rect([ris_width, om_thickness], rounding = ris_rounding*[1,1,0,0], anchor = LEFT+FRONT)
xflip_copy() position(FRONT + LEFT) rect([om_track_guidance_width,om_track_guidance_height], anchor = BACK+LEFT);
/* rotate_extrude(angle=45)
square([10,5]); */