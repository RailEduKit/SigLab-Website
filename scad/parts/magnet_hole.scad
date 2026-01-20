/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: parts/magnet_hole
 */

module magnet_hole() {
	cylinder(h = magnet_thickness + move_tolerance, d = magnet_diameter + 0.1);
	/*
	Test with magnet_hole_diam_test shows, that the magnet sits tight in d = 5.1. You have to press the magnet a bit into the hole, but it can't be removed, even without glue.
	 */
}
