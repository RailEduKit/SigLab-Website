// Include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git
include <BOSL2/joiners.scad> // Import joiners from dependency BelfrySCAD/BOSL2.git

include <config/global_variables.scad>

use <assemblies/overlap_straight.scad>

overlap_straight();
zrot(180) overlap_straight();
//fwd(straight_length) overlap_straight();

