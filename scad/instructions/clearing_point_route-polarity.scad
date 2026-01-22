/* RailEduKit/InteractiveSignallingLaboratory © 2025 by Martin Scheidt and contributors
 * License: CC-BY 4.0 - https://creativecommons.org/licenses/by/4.0/
 * Project description: The Interactive Signalling Laboratory is a tool for training in Rail
 * Applications to enhance the knowledge of control and signalling principles for rail transport systems.
 *
 * Module: clearing_point_route-polarity
 */

// Include configuration file
include <../config/global_variables.scad>
include <../parts/clearing_point_body.scad>


// use common parts
use <../assemblies/clearing_point_route.scad>
use <polarity_indicator.scad>

module clearing_point_route_polarity(){
    translate([0,zs_width,0]) rotate([0,0,-90])
    union(){
        clearing_point_route();
        polarity_bars_clearing_point();
    }
    
}

clearing_point_route_polarity();