/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: switch_locker
 */

// this locker can be combined with the mechanical switch of BRIO https://www.brio.co.uk/en-GB/products/railway-toys/train-tracks/mechanical-switches-63334400

// Include configuration file
include <../config/global_variables.scad>

module wedge() {
    hull(){
        translate([0,sl_depth,-sl_wedge_height+nozzle_diameter/2])
        rotate([90,0,0])
        cylinder(d=nozzle_diameter, h= sl_wedge_depth);
        translate([-sl_wedge_width/2, sl_depth-sl_wedge_depth, -0.2])
        cube([sl_wedge_width, sl_wedge_depth, 0.2]);
    }
}

module half_circle(diameter) {
    difference() {
        sphere(d = diameter);
        translate([0, diameter/2, 0])
        cube([diameter, diameter, diameter],center=true);
    }
}

module brio_switch_handle() {
    curve_h = 2;
    translate([0, curve_h, 0])
    cube([brio_handle_diameter + move_tolerance, brio_handle_depth-curve_h, brio_handle_diameter + move_tolerance]);
    translate([(brio_handle_diameter + move_tolerance)/2, curve_h, (brio_handle_diameter + move_tolerance)/2]) scale([1,curve_h/((brio_handle_diameter + move_tolerance)/2),1])
    half_circle(brio_handle_diameter + move_tolerance);

}

module barrier() {
    difference(){
        cube([sl_barrier_width, sl_barrier_depth, sl_barrier_height]);
        //TODO cut the cube to gain more flexibilaty while installation
        translate([wall_thickness,wall_thickness,0])
        brio_switch_handle();
    }

}

module switch_locker() {
/*     hull(){
        translate([-sl_width/2 + nozzle_diameter/2, nozzle_diameter/2, 0])
        cylinder(d = nozzle_diameter, h=sl_height);
        translate([sl_width/2-nozzle_diameter/2, nozzle_diameter/2, 0])
        cylinder(d = nozzle_diameter, h=sl_height);
        translate([0, sl_depth - nozzle_diameter/2, 0])
        cylinder(d = 5*nozzle_diameter, h=sl_height);
    } */
    translate([-sl_width/2,0,0])
    cube([sl_width, sl_depth, sl_height]);
    translate([-sl_barrier_width/2, 0, -sl_barrier_height])
    barrier();
    wedge();
}

//brio_switch_handle();
//barrier();
switch_locker();
//wedge();