// Include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git
include <BOSL2/joiners.scad> // Import joiners from dependency BelfrySCAD/BOSL2.git

include <config/global_variables.scad>

use <assemblies/overlap_pattern_straight.scad>
use <assemblies/overlap_body_straight.scad>
use <assemblies/overlap_curve.scad>

/* fwd(straight_length) overlap_body_straight();
fwd(straight_length) overlap_pattern_straight(); */
left(ric_inner_radius + ris_width/2) overlap_body_curve();
right(ric_inner_radius + ris_width/2) zrot(180) overlap_body_curve();
//fwd(straight_length) overlap_straight();

