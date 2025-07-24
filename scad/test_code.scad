include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <config/global_variables.scad>
/* diff()
  cuboid([50,30,10]){
    attach(BACK) dovetail("male",  slide = om_thickness, width = om_dovetail_width, height = om_dovetail_depth);
    tag("remove")attach(FRONT) dovetail("female", slide=10, width=15, height=8);
  } */


dovetail("male", w = om_dovetail_width, h = om_dovetail_depth, slide = om_thickness);