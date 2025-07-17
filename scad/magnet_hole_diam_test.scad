/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: magnet_hole_diam_test
 */

// this locker can be combined with the mechanical switch of BRIO https://www.brio.co.uk/en-GB/products/railway-toys/train-tracks/mechanical-switches-63334400

// Include configuration file
include <config/global_variables.scad>


difference(){
    translate([0,-45,-5]) cube([6,50,10]);
    translate([0,-3,0]) test_hole(1);
    translate([0,-10,0]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter + 0.1);
    translate([0,-17,0]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter + 0.2);
    translate([0,-24,0]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter + 0.3);
    translate([0,-31,0]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter + 0.4);
    translate([0,-38,0]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter + move_tolerance);
    translate([0.5,3,4]) rotate([0,0,-90]) linear_extrude(h=1) text("round 0.0 - 0.5", size = 5);
}

translate([-10,0,0]) difference(){
    translate([0,-60,-5]) cube([6,60,10]);
    translate([0,-3,0]) scale([1,1,5/5]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter);
    translate([0,-10,0]) scale([1,1,5.1/5]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter);
    translate([0,-17,0]) scale([1,1,5.2/5]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter);
    translate([0,-24,0]) scale([1,1,5.3/5]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter);
    translate([0,-31,0]) scale([1,1,5.4/5]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter);
    translate([0,-38,0]) scale([1,1,5.5/5]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter);
    translate([0,-45,0]) scale([1,1,5.6/5]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter);
    translate([0,-52,0]) scale([1,1,5.7/5]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter);
    translate([0.5,-1,4]) rotate([0,0,-90]) linear_extrude(h=1) text("oval 5 x 5 - 5.7", size = 5);
}
translate([-20,0,0]) difference(){
    translate([0,-60,-5]) cube([6,60,10]);
    translate([0,-10,0]) scale([1,1,5.1/5.1]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter + 0.1);
    translate([0,-17,0]) scale([1,1,5.2/5.1]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter + 0.1);
    translate([0,-24,0]) scale([1,1,5.3/5.1]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter + 0.1);
    translate([0,-31,0]) scale([1,1,5.4/5.1]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter + 0.1);
    translate([0,-38,0]) scale([1,1,5.5/5.1]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter + 0.1);
    translate([0,-45,0]) scale([1,1,5.6/5.1]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter + 0.1);
    translate([0,-52,0]) scale([1,1,5.7/5.1]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter + 0.1);
    translate([0.5,-1,4]) rotate([0,0,-90]) linear_extrude(h=1) text("oval 5.1 x 5.1 - 5.7", size = 5);

}


module test_hole(scale = 1) {
	scale([1,1,scale]) rotate([0,90,0]) cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter);
}

/* 
The magnet has a diameter of 5mm and is 3mm thick
If you print the hole vertically the hole is 0.5 flatter than it schould be.
That means in y 3 mm deep, in x 5.5mm width, but in z only 5mm height

 */
