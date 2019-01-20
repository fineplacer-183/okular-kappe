okularDiameter   = 43;
okularDistance   = 92;
okularDepth      = 18;
materialThickness = 1;
$fn=200;

use <fillets3d.scad>

module outer() {
    union() {
        cylinder(okularDepth,d=okularDiameter);
        translate([0,okularDistance-2*okularDiameter/2,0])
            cylinder(okularDepth,d=okularDiameter);
        translate([-okularDiameter/2,0,0])    
            cube([okularDiameter, okularDistance-2*okularDiameter/2,okularDepth]);
    }
}

module inner() {
    translate(0,0,materialThickness) {
        union() {
            cylinder(okularDepth-2*materialThickness,
                     d=okularDiameter-2*materialThickness);
            translate([0,okularDistance-2*okularDiameter/2,0])
                cylinder(okularDepth-2*materialThickness,
                         d=okularDiameter-2*materialThickness);
            translate([-okularDiameter/2+materialThickness,0,0])    
                cube([okularDiameter-2*materialThickness,
                      okularDistance-2*okularDiameter/2,
                      okularDepth-2*materialThickness]);
        }
    }    

}

rotate([0,180,0]) topBottomFillet(0,okularDepth,1,20,1)
difference() {
    outer();
    inner();
}
