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

module joystick(cyl_height, cyl_d_bottom, cyl_d_top, sphere_d){
    intersect_height = sphere_d/2 - sqrt(pow(sphere_d/2,2)-pow(cyl_d_top/2,2));
    diff()
    cyl(h=cyl_height, d1 = cyl_d_bottom, d2= cyl_d_top, anchor = BOTTOM){
        tag("remove") attach(BOTTOM) cyl(d= magnet_diameter, h=magnet_height);
        down(intersect_height) tag("keep") attach(TOP) sphere(d = sphere_d, anchor = BOTTOM);
    }
}


module speed_controller(diameter, height){
    difference(){
        cylinder(d=diameter, h=height);
        cylinder(d= magnet_diameter, h=magnet_height);
    }
    
}

/* speed_controller(15, 25);
right(30) speed_controller(15, 30);
right(60) speed_controller(20, 25);
right(90) speed_controller(20, 30);
right(120) speed_controller(25, 25);
right(150) speed_controller(25, 30); */

joystick(cyl_height = 30, cyl_d_bottom = 10, cyl_d_top = 10*1, sphere_d = 10*3);
right(30) joystick(cyl_height = 20, cyl_d_bottom = 8, cyl_d_top = 8*1, sphere_d = 10*2.5);
//right(60) joystick(cyl_height = 20, cyl_d_bottom = 10, cyl_d_top = 10*1, sphere_d = 10*2);
right(90) joystick(cyl_height = 20, cyl_d_bottom = 8, cyl_d_top = 8*1.5, sphere_d = 10*2.5);
right(120) joystick(cyl_height = 30, cyl_d_bottom = 8, cyl_d_top = 10*1.5, sphere_d = 10*3);