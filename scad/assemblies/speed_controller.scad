/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: speed controller
 */

// Include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git

// Include configuration file
include <../config/global_variables.scad>
include <../config/colors.scad>

// sc = speed controller
sc_diameter = 20;
sc_height = 30;

magnet_height = 10;
magnet_diameter = 6;


module speed_controller(diameter, height){
    difference(){
        cylinder(d=diameter, h=height);
        cylinder(d= magnet_diameter, h=magnet_height);
    }
    
}

speed_controller(15, 25);
right(30) speed_controller(15, 30);
right(60) speed_controller(20, 25);
right(90) speed_controller(20, 30);
right(120) speed_controller(25, 25);
right(150) speed_controller(25, 30);


