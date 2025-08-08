include <BOSL2/std.scad>
include <BOSL2/std.scad>

cuboid([10,40,2]){
    zrot_copies(n=2)
    color([0.255, 0.412, 0.882]) position(BACK) cuboid([5,5,2], anchor = RIGHT+FRONT);
}