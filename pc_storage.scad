$fa = 1;
$fs = 0.4;

PC_MOUNT_WIDTH = 20;
PC_MOUNT_LEN = 150;
BASE_HEIGHT = 3;
SIDE_WIDTH = 3;

module base() {
  color("#6a5acd") { cube(size = [ 70, PC_MOUNT_LEN, BASE_HEIGHT ], center = false); }
}

module side() {
  color("#54FF9F") { cube(size = [ SIDE_WIDTH, PC_MOUNT_LEN, 50 ], center = false); }
}

module triangle() {
  points = [ [ 0, 0 ], [ 15, 0 ], [ 0, 30 ] ]; // 三角形的三个顶点坐标
  thickness = 2;                               // 多边形的厚度
  color("#EEEE00") { linear_extrude(height = thickness) polygon(points); }
}

module left_side() {
  side();
  translate([ 0.001, 40, -0.001 ]) rotate([ 90, 0, 180 ]) { triangle(); }
  translate([ 0.001, PC_MOUNT_LEN - 40 - 4, -0.001 ]) rotate([ 90, 0, 180 ]) {
    triangle();
  }
}

module right_side() {
  side();
  translate([ SIDE_WIDTH - 0.001, 40 + 4, -0.001 ]) rotate([ 90, 0, 0 ]) { triangle(); }
  translate([ SIDE_WIDTH - 0.001, PC_MOUNT_LEN - 40, -0.001 ]) rotate([ 90, 0, 0 ]) {
    triangle();
  }
}

module vertical_wall(spacing = 0) {
  translate([ 70 / 2 - (spacing / 2) - SIDE_WIDTH, 0, BASE_HEIGHT - 0.001 ]) left_side();
  translate([ 70 / 2 + spacing / 2, 0, BASE_HEIGHT - 0.001 ]) right_side();
}

union() {
  base();
  vertical_wall(PC_MOUNT_WIDTH);
}