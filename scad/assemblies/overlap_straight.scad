/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: overlap_straigth
 */

 /* 
uses code from:
Customizable toy train tracks
by atartanian (www.thingiverse.com/atartanian)
license CC-BY-SA
 */

// Include configuration file
include <../config/global_variables.scad>
include <../config/colors.scad>

// Include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git
include <BOSL2/joiners.scad> // Import joiners from dependency BelfrySCAD/BOSL2.git


// Include common parts
use <track_indicator_straight.scad>
include <../parts/overlap_pattern.scad>




track_indicator_straight();
up(om_thickness/2) bar_master();


echo("custom_width_base", custom_width_base);