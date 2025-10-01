include <BOSL2/std.scad>


/* union(){
    rotate_extrude(angle=45)
    right(30) rect([20, 1], anchor = LEFT+FRONT);
    //xflip_copy() position(FRONT + LEFT) rect([1,2], anchor = BACK+LEFT);
} */


/* diff() 
    rotate_extrude(angle=45)
    right(30) rect([20, 1], anchor = LEFT+FRONT){
        tag("remove") rect([5,1]);
    } */

/* diff()
    #tag("remove") cuboid(5)
        tag("") position(RIGHT+BACK) cuboid(10); */

diff()
    tag("remove") cuboid([40,5,1], anchor = LEFT+BOTTOM);
        tag("") rotate_extrude(angle=45)
    right(30) rect([20, 1], anchor = LEFT+FRONT);

//parent_object();      