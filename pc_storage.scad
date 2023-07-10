$fa = 1;
$fs = 0.4;

PC_MOUNT_WIDTH = 23;
PC_MOUNT_LEN = 150;

module base() {
  color("#6a5acd") { cube(size = [ 70, PC_MOUNT_LEN, 5 ], center = false); }
}

module side() {
  color("#54FF9F") { cube(size = [ 5, PC_MOUNT_LEN, 50 ], center = false); }
}

module triangle() {
  points = [ [ 0, 0 ], [ 10, 0 ], [ 0, 20 ] ]; // 三角形的三个顶点坐标
  thickness = 4;                               // 多边形的厚度
  color("#EEEE00") { linear_extrude(height = thickness) polygon(points); }
}

module left_side() {
  side();
  translate([ 0.001, 10, -0.001 ]) rotate([ 90, 0, 180 ]) { triangle(); }
  translate([ 0.001, PC_MOUNT_LEN - 10 - 4, -0.001 ]) rotate([ 90, 0, 180 ]) {
    triangle();
  }
}

module right_side() {
  side();
  translate([ 5 - 0.001, 10 + 4, -0.001 ]) rotate([ 90, 0, 0 ]) { triangle(); }
  translate([ 5 - 0.001, PC_MOUNT_LEN - 10, -0.001 ]) rotate([ 90, 0, 0 ]) {
    triangle();
  }
}

module vertical_wall(spacing = 0) {
  translate([ 70 / 2 - (spacing / 2) - 5, 0, 5 - 0.001 ]) left_side();
  translate([ 70 / 2 + spacing / 2, 0, 5 - 0.001 ]) right_side();
}

union() {
  base();
  vertical_wall(PC_MOUNT_WIDTH);
}