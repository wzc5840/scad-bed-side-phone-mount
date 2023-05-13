$fa = 1;
$fs = 0.4;

module light_remote_mount() {
  THICKNESS = 1.5;
  MOUNT_WIDTH = 45;
  MOUNT_THICKNESS = 12;
  MOUNT_HEIGHT = 45;

  difference() {
    cube(size = [ MOUNT_WIDTH, MOUNT_THICKNESS, MOUNT_HEIGHT ]);
    translate([ THICKNESS, THICKNESS, THICKNESS ])
        cube(size = [ MOUNT_WIDTH - 2 * THICKNESS, MOUNT_THICKNESS - 2 * THICKNESS, MOUNT_HEIGHT ]);
    translate([ 5, -1, 15 ]) cube(size = [ MOUNT_WIDTH - 2 * 5, THICKNESS + 2, MOUNT_HEIGHT - 10 ]);
  }
}

union() { light_remote_mount(); }