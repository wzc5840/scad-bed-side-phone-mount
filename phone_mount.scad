// $fa = 1;
// $fs = 0.4;

// MOUNT_WIDTH = 85;
MOUNT_WIDTH = 110;
MOUNT_HEIGHT = 160;
MOUNT_THICKNESS = 14;
THICKNESS = 1.5;
WIRELESS_THICKNESS = 9;
WIRELESS_D = 96;
WIRELESS_R = WIRELESS_D / 2;

module phone_mount() {
  difference() {
    cube([ WIRELESS_D + 2 * 2, 2 + WIRELESS_THICKNESS, WIRELESS_D + 2 * 2 ]);
    translate([ WIRELESS_R + 1, WIRELESS_THICKNESS, WIRELESS_R + 2 ])
        rotate(a = [ 90, 0, 0 ]) cylinder(h = MOUNT_THICKNESS, r = WIRELESS_R);
    // translate(v = [THICKNESS, -1, 5])
    // cube(size = [ MOUNT_WIDTH - 2 * THICKNESS, MOUNT_THICKNESS, MOUNT_HEIGHT
    // ]); translate(v = [ 10, MOUNT_THICKNESS - 3, MOUNT_HEIGHT / 2 ]) rotate(a
    // = [ 90, 0, 0 ])
    //     cylinder(h = MOUNT_THICKNESS, r = WIRELESS_R);
  }
}

module round_mount() {
  difference() {
    cylinder(h = MOUNT_THICKNESS + 2, r = WIRELESS_R + 2);
    translate([ 0, 0, 2 + 0.01 ]) cylinder(h = MOUNT_THICKNESS, r = WIRELESS_R);
    translate([ 0 - (WIRELESS_R + 3 + 10), 10, -1 ])
        cube(size = [ WIRELESS_R + 3, WIRELESS_R + 3, MOUNT_THICKNESS + 4 ],
             center = false);
    translate([ 10, 10, -1 ])
        cube(size = [ WIRELESS_R + 3, WIRELESS_R + 3, MOUNT_THICKNESS + 4 ],
             center = false);
    // translate([ 0 - (WIRELESS_R + 3 + 10), 0 - (WIRELESS_R + 3 + 10), -1 ])
    //     cube(size = [ WIRELESS_R + 3, WIRELESS_R + 3, MOUNT_THICKNESS + 4 ],
    //          center = false);
    // translate([ 10, 0 - (WIRELESS_R + 3 + 10), -1 ])
    //     cube(size = [ WIRELESS_R + 3, WIRELESS_R + 3, MOUNT_THICKNESS + 4 ],
    //          center = false);
  }
}

module base() {
  color("#6a5acd") { cube(size = [ 20, 97, 3 ], center = true); }
  color("#4169e1") {
    translate([ 0, -47, 8 ]) cube(size = [ 20, 2, 18 ], center = true);
  }
}

union() {
  // rotate([ -10, 0, 0 ]) { phone_mount(); }
  // translate([ 0, 0, 8 ]) rotate([ -10, 0, 0 ]) { round_mount(); }
  // base();

  // cylinder(h = 20, r = 10, center = true);

  difference() {
    rotate_extrude(start_angle = 0, end_angle = 90)
        cylinder(h = 20, r = 10, center = true);
    cube([ 10, 10, 20 ], center = true);
  }
}