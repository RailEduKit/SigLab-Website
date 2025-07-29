include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
diff()
  cuboid([50,30,10]){
    attach(BACK) dovetail("male", slide=10, width=15, height=5, angle = 25);
    tag("remove")attach(FRONT) dovetail("female", slide=10, width=15, height=8);
  }