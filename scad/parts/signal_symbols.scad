/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: signal_symbol
 */

 // Include configuration file
include <../config/global_variables.scad>

module symbol_block() {
	difference() {
		cube([ signal_symbol_size, signal_symbol_size, engraving_height ]);
		translate([ engraving_thickness, engraving_thickness, 0 ])
		cube([
			signal_symbol_size - 2 * engraving_thickness, signal_symbol_size - 2 * engraving_thickness,
			engraving_height
		]);
	}
}

module symbol_distant() {
	// symbol_distant = sb
	cylinder_diameter = 0.4;
	sb_beta = atan(1 / 2);
	sb_gamma = 180 - 90 - sb_beta;
	sb_theta = 90 - sb_gamma;
	top_cyl_ydif = engraving_thickness / sin(sb_beta);
	bottom_cyl_xdif = engraving_thickness / sin(sb_gamma) + tan(sb_theta) * engraving_thickness;

	difference() {
		hull() {
			translate([ signal_symbol_size / 2, cylinder_diameter / 2, 0 ])
			cylinder(d = cylinder_diameter, h = engraving_height);
			translate([ cylinder_diameter / 2, signal_symbol_size - cylinder_diameter / 2, 0 ])
			cylinder(d = cylinder_diameter, h = engraving_height);
			translate([ signal_symbol_size - cylinder_diameter / 2, signal_symbol_size - cylinder_diameter / 2, 0 ])
			cylinder(d = cylinder_diameter, h = engraving_height);
		}
		hull() {
			translate([ signal_symbol_size / 2, top_cyl_ydif + cylinder_diameter / 2, 0 ])
			cylinder(d = cylinder_diameter, h = engraving_height);
			translate([
				bottom_cyl_xdif + cylinder_diameter / 2,
				signal_symbol_size - engraving_thickness - cylinder_diameter / 2, 0
			])
			cylinder(d = cylinder_diameter, h = engraving_height);
			translate([
				signal_symbol_size - bottom_cyl_xdif - cylinder_diameter / 2,
				signal_symbol_size - engraving_thickness - cylinder_diameter / 2, 0
			])
			cylinder(d = cylinder_diameter, h = engraving_height);
		}
	}
}

//symbol_block();
//symbol_distant();