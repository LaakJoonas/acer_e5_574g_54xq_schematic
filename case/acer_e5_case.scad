$fn = 64; // Circle resolution for curved surfaces.

board_corner_min = [30.550, 9.019];
board_corner_max = [261.580, 207.137];

case_margin = 6;
wall = 2.4;
base = 2.4;
lid = 2.0;
corner_r = 6;

board_thickness = 1.6;
standoff_h = 6;
clearance = 1.0;

bottom_internal = standoff_h + board_thickness + clearance;
top_internal = 18;

lip_clearance = 0.4;

inner_min = [board_corner_min[0] - case_margin, board_corner_min[1] - case_margin];
inner_max = [board_corner_max[0] + case_margin, board_corner_max[1] + case_margin];
inner_size = [inner_max[0] - inner_min[0], inner_max[1] - inner_min[1]];

outer_min = [inner_min[0] - wall, inner_min[1] - wall];
outer_max = [inner_max[0] + wall, inner_max[1] + wall];
outer_size = [outer_max[0] - outer_min[0], outer_max[1] - outer_min[1]];

board_z = base + standoff_h;
post_extra_height = 0.4;
snap_head_drop = 0.2;
drive_bay_z_offset = 1.5;

holes = [
  [34.500, 11.200, 3.404],
  [246.000, 11.200, 3.404],
  [33.399, 105.499, 2.845],
  [149.999, 184.000, 3.404],
  [257.500, 197.800, 5.512],
  [189.320, 184.430, 3.556]
];

ports_left = [
  [35.800, 14, 7],
  [53.800, 14, 7],
  [73.800, 15, 6],
  [92.886, 16, 14]
];

ports_front = [
  [61.995, 28, 4]
];

ports_back = [
  [150, 12, 8]
];

ports_right = [
  [120, 12, 6],
  [140, 12, 6]
];

fan_center = [210, 170];
fan_diameter = 55;
fan_mesh_pitch = 6;
fan_clip_offset = 5;
fan_mesh_extra_depth = 0.6;
fan_mesh_hole_d = 3;

heatsink_center = fan_center;
heatsink_size = [70, 55];
heatsink_extra_height = 8;

foot_inset = 16;
latch_spacing = 40;

hdd_bay_pos = [90, 150];
hdd_bay_size = [100, 70, 7];

odd_bay_pos = [200, 140];
odd_bay_size = [100, 70, 7];

// Controls which part to render; override via -D on the OpenSCAD command line.
part = "bottom"; // bottom, top, both

module rounded_rect(size, r) {
  offset(r = r) square([size[0] - 2 * r, size[1] - 2 * r], center = false);
}

module shell_body(height) {
  translate(outer_min)
    linear_extrude(height = height)
      rounded_rect(outer_size, corner_r);
}

module shell_cavity(height) {
  translate(inner_min)
    linear_extrude(height = height)
      rounded_rect(inner_size, max(corner_r - wall, 0));
}

module snap_post(pos, drill) {
  post_clearance = 0.4;
  post_min_d = 2.4;
  head_clearance = 0.8;
  head_h = 1.2;
  post_d = max(drill - post_clearance, post_min_d);
  head_d = drill + head_clearance;
  translate([pos[0], pos[1], base]) {
    cylinder(h = standoff_h + board_thickness + post_extra_height, d = post_d);
    translate([0, 0, standoff_h + board_thickness - snap_head_drop])
      cylinder(h = head_h, d1 = post_d, d2 = head_d);
  }
}

module snap_posts() {
  for (h = holes)
    snap_post([h[0], h[1]], h[2]);
}

module fan_mesh_cut() {
  radius = fan_diameter / 2;
  radius_squared = radius * radius;
  for (x = [-radius : fan_mesh_pitch : radius])
    for (y = [-radius : fan_mesh_pitch : radius])
      if (x * x + y * y <= radius_squared)
        translate([fan_center[0] + x, fan_center[1] + y, 0])
          cylinder(h = base + fan_mesh_extra_depth, d = fan_mesh_hole_d);
}

module port_cutouts_left() {
  for (p = ports_left) {
    translate([outer_min[0] - 1, p[0] - p[1] / 2, board_z - 1])
      cube([wall + 2, p[1], p[2]]);
  }
}

module port_cutouts_right() {
  for (p = ports_right) {
    translate([outer_max[0] - wall - 1, p[0] - p[1] / 2, board_z - 1])
      cube([wall + 2, p[1], p[2]]);
  }
}

module port_cutouts_front() {
  for (p = ports_front) {
    translate([p[0] - p[1] / 2, outer_min[1] - 1, board_z - 1])
      cube([p[1], wall + 2, p[2]]);
  }
}

module port_cutouts_back() {
  for (p = ports_back) {
    translate([p[0] - p[1] / 2, outer_max[1] - wall - 1, board_z - 1])
      cube([p[1], wall + 2, p[2]]);
  }
}

module drive_bay(center, size) {
  bay_x = size[0];
  bay_y = size[1];
  bay_h = size[2];
  rail_t = 2;
  rail_h = bay_h + 3;
  z0 = base + drive_bay_z_offset;

  translate([center[0] - bay_x / 2, center[1] - bay_y / 2, z0]) {
    cube([bay_x, rail_t, rail_h]);
    translate([0, bay_y - rail_t, 0]) cube([bay_x, rail_t, rail_h]);
    cube([rail_t, bay_y, rail_h]);
    translate([bay_x - rail_t, 0, 0]) cube([rail_t, bay_y, rail_h]);
    translate([bay_x / 2 - 6, bay_y - rail_t, rail_h - 2])
      cube([12, rail_t + 1.2, 2]);
  }
}

module fan_clips() {
  clip_w = 6;
  clip_t = 2;
  clip_h = 8;
  fan_clip_span = fan_diameter / 2 + fan_clip_offset;
  offsets = [[fan_clip_span, 0], [-fan_clip_span, 0], [0, fan_clip_span], [0, -fan_clip_span]];
  for (o = offsets)
    translate([fan_center[0] + o[0] - clip_w / 2, fan_center[1] + o[1] - clip_t / 2, base])
      cube([clip_w, clip_t, clip_h]);
}

module feet() {
  foot_d = 10;
  foot_h = 3;
  offsets = corner_offsets(foot_inset);
  for (o = offsets)
    translate([outer_min[0] + o[0], outer_min[1] + o[1], 0])
      cylinder(h = foot_h, d = foot_d);
}

module top_recesses() {
  recess_d = 10.6;
  recess_h = 2.4;
  offsets = corner_offsets(foot_inset);
  for (o = offsets)
    translate([outer_min[0] + o[0], outer_min[1] + o[1], 0])
      cylinder(h = recess_h, d = recess_d);
}

function corner_offsets(inset) = [
  [inset, inset],
  [outer_size[0] - inset, inset],
  [inset, outer_size[1] - inset],
  [outer_size[0] - inset, outer_size[1] - inset]
];

function latch_positions() = [
  (outer_min[1] + outer_max[1]) / 2 - latch_spacing,
  (outer_min[1] + outer_max[1]) / 2 + latch_spacing
];

module latch_tabs() {
  tab_w = 10;
  tab_t = 1.6;
  tab_h = 8;
  tab_y = latch_positions();
  for (y = tab_y) {
    translate([outer_min[0] - tab_t, y - tab_w / 2, base + bottom_internal - tab_h])
      cube([tab_t, tab_w, tab_h]);
    translate([outer_max[0], y - tab_w / 2, base + bottom_internal - tab_h])
      cube([tab_t, tab_w, tab_h]);
  }
}

module latch_slots() {
  tab_w = 10;
  tab_t = 1.8;
  tab_h = 8.5;
  tab_y = latch_positions();
  for (y = tab_y) {
    translate([outer_min[0] - tab_t - 0.2, y - tab_w / 2 - 0.2, lid])
      cube([tab_t + 0.6, tab_w + 0.4, tab_h]);
    translate([outer_max[0] - 0.2, y - tab_w / 2 - 0.2, lid])
      cube([tab_t + 0.6, tab_w + 0.4, tab_h]);
  }
}

module bottom_shell() {
  union() {
    difference() {
      shell_body(base + bottom_internal);
      translate([0, 0, base]) shell_cavity(bottom_internal + 1);
      port_cutouts_left();
      port_cutouts_right();
      port_cutouts_front();
      port_cutouts_back();
      fan_mesh_cut();
    }
    snap_posts();
    fan_clips();
    drive_bay(hdd_bay_pos, hdd_bay_size);
    drive_bay(odd_bay_pos, odd_bay_size);
    feet();
    latch_tabs();
  }
}

module top_shell() {
  union() {
    difference() {
      shell_body(lid + top_internal);
      translate([0, 0, lid]) shell_cavity(top_internal + 1);
      translate([heatsink_center[0] - heatsink_size[0] / 2, heatsink_center[1] - heatsink_size[1] / 2, lid])
        cube([heatsink_size[0], heatsink_size[1], top_internal + heatsink_extra_height]);
      latch_slots();
      top_recesses();
    }
  }
}

if (part == "bottom") {
  bottom_shell();
}
if (part == "top") {
  top_shell();
}
if (part == "both") {
  bottom_shell();
  translate([0, 0, base + bottom_internal + 5]) top_shell();
}
