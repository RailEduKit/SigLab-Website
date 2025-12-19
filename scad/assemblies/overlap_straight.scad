/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: overlap_straigth
 */

 /* 
uses code from:
Customizable toy train tracks
by atartanian (www.thingiverse.com/atartanian)
license CC-BY-SA
 */

// Include configuration file
include <../config/global_variables.scad>
include <../config/colors.scad>

// Include external libraries
include <BOSL2/std.scad> // Import std from dependency BelfrySCAD/BOSL2.git
include <BOSL2/joiners.scad> // Import joiners from dependency BelfrySCAD/BOSL2.git


// Include common parts
use <track_indicator_straight.scad>

/*[Track Settings]*/
// length of track piece, in mm
// length = straight_length - om_dovetail_depth; //[30:10:400] //inklusive the male pin

// only one preset... for now
// track_type = 0; //[1:brio,0:custom]

// in order to print perfectly, set your printers extrusion width
extrusion_width = .4; //[.1:.05:1]

// track line thickness, in multiples of extrusion width
thin_line = 4; //[2:2:10]

// spacing between male and female connectors, in mm
connector_tolerance = .3; //[.1:.05:1]

/*[Custom Dimensions]*/
use_custom_settings = 1; //[0:No,1:Yes]
custom_width_base = rail_well_spacing + 2 * om_track_guidance_width + move_tolerance -5;
custom_width_middle = custom_width_base;
custom_height_base = 3;
custom_height_middle = 0.6;
custom_connector_length = 0; // 17.5;

/*[Hidden]*/
track_type = use_custom_settings ? 0 : 1;

/***************/
/*     CODE    */
/***************/
module endproduct(length) {
	color(INDICATOR_COLOR) union(){
		translate([ -track_type_params()[track_type][1] / 2, 0 ])
		intersection(convexity = 20) {
			rotate([ -90, 0, 0 ])
			linear_extrude(height = length, convexity = 20) scale([ 1, -1 ])
				track_profile_2D(track_type_params()[track_type][1], track_type_params()[track_type][2],
								track_type_params()[track_type][3], track_type_params()[track_type][4], 1);

			linear_extrude(height = track_type_params()[track_type][4], convexity = 20) union() {
				translate([ 0, track_type_params()[track_type][5] + thin_line * extrusion_width ])
				{
					flex_track_pattern_2D(length - track_type_params()[track_type][5] * 2 - thin_line * extrusion_width * 2,
										track_type_params()[track_type][1], track_type_params()[track_type][2],
										thin_line * extrusion_width, thin_line * extrusion_width,
										thin_line * extrusion_width, // this defines the gap_thickness
										true);
				}
			}
		}

	}
	
}

/***************/
/*  FUNCTIONS  */
/***************/

function track_type_params() = 
[   
    [   //[0] template
        "custom",   //[0] name
        custom_width_base,         //[1] width base
        custom_width_middle,         //[2] width middle
        custom_height_base,         //[3] height base
        custom_height_middle,         //[4] height middle
        custom_connector_length
    ], 
    [   //[1] brio
        "brio",     //[0] name
        40,         //[1] width base
        20,         //[2] width middle
        8.9,        //[3] height base
        12,         //[4] height middle
        17.5        //[5] connector length
    ], 
];

/***************/
/*   MODULES   */
/***************/


module track_profile_2D(width_base = 40, width_middle = 20, height_base = 10, height_middle = 15, bevel_radius = 1) {
	difference() {
		translate([ bevel_radius, 0 ])
		{
			union() {
				offset(d = bevel_radius) {
					square([ width_base - bevel_radius * 2, height_base - bevel_radius ]);
				}
				offset(d = bevel_radius) {
					translate([ (width_base - width_middle) / 2, bevel_radius ])
					square([ width_middle - bevel_radius * 2, height_middle - bevel_radius * 2 ]);
				}
			}
		}
		translate([ -width_base / 2, -width_base * 2 ])
		square(width_base * 2);
	}
}
module flex_track_pattern_2D(length = 100, width_base = 40, width_middle = 20, thin_line = 1.6,
                             connector_thickness = 1.6, gap_thickness = 1.6, inclusive_bars = true) {
	epsilon = .1;

	slice_thickness = thin_line + gap_thickness;
	slices = floor(length / slice_thickness);
	leftover = length - (slice_thickness * slices) + gap_thickness;

	module bars(even = true, odd = true, cutter = false) {
		for (i = [0:slices - 1]) {
			if (even == true && !(i % 2)) {
				if (cutter == true) {
					translate([ -epsilon / 2, slice_thickness * i ])
					{
						square([ width_base + epsilon, thin_line ]);
					}
				} else {
					translate([ 0, slice_thickness * i ])
					{
						square([ width_base, thin_line ]);
					}
				}
			}
			if (odd == true && (i % 2)) {
				if (cutter == true) {
					translate([ -epsilon / 2, slice_thickness * i ])
					{
						square([ width_base + epsilon, thin_line ]);
					}
				} else {
					translate([ 0, slice_thickness * i ])
					{
						square([ width_base, thin_line ]);
					}
				}
			}
		}
	}

	module bars_holes(even = true, odd = true, cutter = true) {
		for (i = [0:slices - 2]) {
			if (even == true && !(i % 2)) {
				if (cutter == true) {
					translate([ -epsilon / 2, slice_thickness * i + thin_line ])
					{
						square([ width_base + epsilon, gap_thickness ]);
					}
				} else {
					translate([ 0, slice_thickness * i + thin_line ])
					{
						square([ width_base, gap_thickness ]);
					}
				}
			}
			if (odd == true && (i % 2)) {
				if (cutter == true) {
					translate([ -epsilon / 2, slice_thickness * i + thin_line ])
					{
						square([ width_base + epsilon, gap_thickness ]);
					}
				} else {
					translate([ 0, slice_thickness * i + thin_line ])
					{
						square([ width_base, gap_thickness ]);
					}
				}
			}
		}
	}
	if (inclusive_bars == true) {
		translate([ 0, leftover / 2 ])
		bars();
	}

	difference() {
		translate([ (width_base - width_middle) / 2, thin_line ])
		square([ connector_thickness, length - 2*thin_line ]);

		translate([ 0, leftover / 2 ])
		bars_holes(false, true);
	}

	difference() {
		translate([ (width_base - width_middle) / 2 + width_middle - connector_thickness, thin_line ])
		square([ connector_thickness, length - 2* thin_line ]);

		translate([ 0, leftover / 2 ])
		bars_holes(true, false);
	}
    bars_holes(false, true);
}
// track_profile_2D();
// flex_track_pattern_2D();
difference(){
	translate([0,straight_length/2-om_dovetail_depth/2,0])
	color(ROUTE_COLOR) track_indicator_straight();
	translate([0,0,om_thickness/2-number_height])
	endproduct(straight_length - om_dovetail_depth);
}
	translate([0,0,om_thickness/2-number_height])
	endproduct(straight_length - om_dovetail_depth)




translate([custom_width_base+10, 0 ,0])
endproduct(curve_length_middle_radius - straight_length - om_dovetail_depth);
translate([custom_width_base+30, 0 ,0])
flex_track_pattern_2D(straight_length);

// TODO with a length of straight_length - om_dovetail_depth everything looks great. With a length of straight_length it looks bad


//endproduct();

echo("custom_width_base", custom_width_base);