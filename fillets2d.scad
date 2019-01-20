/*
Modified by Kevin Gravier
https://www.thingiverse.com/mrkmg/about

Originally from: https://github.com/OskarLinde/scad-utils/blob/master/morphology.scad



Modules:

rounding2d(r)
r = radius of rounding

fillet2d(r)
r = radius of rounding

*/

$fa = 0.1;
$fs = 0.1;


module fillet2d(r) {
    offset(r = -r) offset(delta = r) children(0);
}

module rounding2d(r) {
    offset(r = r) offset(delta = -r) children(0);
}