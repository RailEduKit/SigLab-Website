/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: clearing_point_route
 */

// Include configuration file
include <../config/global_variables.scad>

// Include common parts
include <../parts/clearing_point_body.scad>
include <../parts/clearing_point_symbols.scad>

module clearing_point_route() {
    clearing_point_body();
    translate([ zs_with / 2, zs_depth / 2, zs_height ])
    route_clearing_symbol();
}

clearing_point_route();