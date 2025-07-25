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


//xflip() 
yrot(90) 
cylinder(d1=10, d2=0, h=20);
//color("blue", 0.25) cube([0.01,15,15], center=true);
//color("red", 0.333) yrot(90) cylinder(d1=10, d2=0, h=20);