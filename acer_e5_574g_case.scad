// Acer E5-574G-54XQ Laptop Motherboard Case
// Generated from QUANTA ZRT DA0ZRTMB6D0 schematic
// 
// ASSEMBLY ORDER (upside-down assembly, then flip):
// 1. Attach motherboard to TOP part (which has standoffs and grilles)
// 2. Attach edge pieces to TOP part
// 3. Place BOTTOM part on top (which has power button cutout and feet mounting)
// 4. Attach feet to BOTTOM part
// 5. FLIP the entire assembly upside down
//
// FINAL ORIENTATION (after flip):
// - Motherboard is upside down (components face down toward grilles)
// - Fan pulls air from BOTTOM through grilles
// - Power button on TOP (accessible)
// - Feet on BOTTOM for airflow clearance
//
// SATA EXTENSION:
// - 130mm extension for 2.5" drives
// - Standard 2.5" screw positions for both HDD/SSD and optical caddy adapter
// - Both drives need screw mounting holes

/* [Render Options] */
render_part = "all"; // ["top_with_standoffs", "bottom_with_button", "edge_front", "edge_back", "edge_left", "edge_right", "feet", "all", "preview"]

/* [Board Dimensions] */
board_length = 231;      // ~231mm (X direction)
board_width = 195;       // ~195mm (Y direction)
board_thickness = 1.6;   // Standard PCB thickness

/* [Case Parameters] */
wall_thickness = 3.0;
side_height = 15;
edge_min_thickness = 4.0;
board_clearance = 0.5;
cable_clearance = 15;
sata_extension = 130;    // Extension for SATA drives
feet_height = 8;

/* [Ventilation Grille] */
grille_bar_width = 2.5;
grille_gap_width = 4;

/* [Fan Area] */
// Fan grille area - this is where the blower fan pulls air
fan_grille_start_x = 50;
fan_grille_start_y = 120;
fan_grille_length = 80;
fan_grille_width = 60;

// Fan screw positions (from schematic, 2 mounting holes)
// Note: These positions may need adjustment based on actual fan placement
// Standard laptop fan mounting uses M2.5 screws
fan_screw_1_x = 62;      // Position near fan grille area
fan_screw_1_y = 135;
fan_screw_2_x = 115;
fan_screw_2_y = 155;
fan_screw_dia = 2.5;     // M2.5 screws for fan

/* [Heatsink Cutout] */
heatsink_cutout_start_y = 115;
heatsink_cutout_length = 60;
heatsink_cutout_height = 15;

/* [CPU Ventilation] */
cpu_grille_start_x = 100;
cpu_grille_start_y = 80;
cpu_grille_length = 80;
cpu_grille_width = 70;

/* [Power Button - on BOTTOM part (top after flip)] */
cherry_mx_size = 14.0;
cherry_mx_tolerance = 0.1;
power_button_x = 180;    // Near RAM area
power_button_y = 40;

/* [Screw Parameters] */
screw_hole_diameter = 3.2;
standoff_outer_diameter = 8;
standoff_height = 5;
sata_screw_hole_diameter = 3.2;

/* [Calculated Dimensions] */
case_length = board_length + 2*cable_clearance + sata_extension;
case_width = board_width + 2*cable_clearance;
case_height = side_height + board_thickness + standoff_height;
board_offset_x = cable_clearance;
board_offset_y = cable_clearance;

/* [Motherboard Support] */
// Extra support ribs to keep motherboard steady
support_rib_width = 3;
support_rib_height = standoff_height - 1;  // Just below board level

/* [Screw Standoff Positions from Schematic] */
function mils_to_mm(x) = x * 0.0254;

schematic_origin_x = 1200;
schematic_origin_y = 440;

function schem_to_board_x(x) = mils_to_mm(x - schematic_origin_x);
function schem_to_board_y(y) = board_width - mils_to_mm(y - schematic_origin_y);

// Motherboard screw standoff positions
screw_holes = [
    [schem_to_board_x(4042.130), schem_to_board_y(440.940), "M3", 3.4],
    [schem_to_board_x(1358.270), schem_to_board_y(440.950), "M3", 3.4],
    [schem_to_board_x(9685.040), schem_to_board_y(440.950), "M3", 3.4],
    [schem_to_board_x(1610.190), schem_to_board_y(472.400), "M3", 3.0],
    [schem_to_board_x(9685.000), schem_to_board_y(1275.650), "M3", 3.5],
    [schem_to_board_x(1786.540), schem_to_board_y(2548.030), "M3", 3.4],
    [schem_to_board_x(10207.000), schem_to_board_y(3582.390), "M3", 3.5],
    [schem_to_board_x(9980.320), schem_to_board_y(3582.670), "M3", 3.5],
    [schem_to_board_x(3937.010), schem_to_board_y(3582.680), "M3", 3.5],
    [schem_to_board_x(1314.910), schem_to_board_y(4153.500), "M3", 3.5],
    [schem_to_board_x(7502.760), schem_to_board_y(4241.340), "M3", 4.0],
    [schem_to_board_x(5457.090), schem_to_board_y(4241.340), "M3", 4.0],
    [schem_to_board_x(1539.370), schem_to_board_y(4960.630), "M3", 3.5],
    [schem_to_board_x(9960.630), schem_to_board_y(5413.390), "M3", 3.5],
    [schem_to_board_x(6479.920), schem_to_board_y(6012.990), "M3", 4.0],
    [schem_to_board_x(5905.510), schem_to_board_y(7244.100), "M3", 3.4],
    [schem_to_board_x(10137.800), schem_to_board_y(7787.400), "M3", 5.5],
    [schem_to_board_x(9496.060), schem_to_board_y(4156.300), "M3", 3.6],
    [schem_to_board_x(9115.350), schem_to_board_y(5599.610), "M3", 3.5],
    [schem_to_board_x(7453.540), schem_to_board_y(7261.020), "M3", 3.5],
    [schem_to_board_x(1553.150), schem_to_board_y(4153.540), "M3", 3.4],
    [schem_to_board_x(8395.680), schem_to_board_y(856.310), "M2.5", 2.5],
    [schem_to_board_x(8454.740), schem_to_board_y(1665.360), "M2.5", 2.5],
];

/* [Port Positions] */
usb3_1_y = schem_to_board_y(2118.110);
usb3_2_y = schem_to_board_y(1409.440);
usb_width = 15;
usb_height = 7;

hdmi_y = schem_to_board_y(2905.510);
hdmi_width = 18;
hdmi_height = 6;

lan_y = schem_to_board_y(3656.920);
lan_width = 16;
lan_height = 14;

vga_y = schem_to_board_y(4700.790);
vga_width = 32;
vga_height = 12;

sd_x = schem_to_board_x(2440.750);
sd_width = 30;
sd_height = 3;

usb2_x = sd_x + sd_width + 25;
usb2_width = 15;
usb2_height = 7;

power_connector_x = 130;  // ~13cm from SATA side
power_width = 15;
power_height = 8;

/* [SATA Drive Mounting - Standard 2.5" positions] */
// Standard 2.5" HDD/SSD screw positions (bottom mounting)
// Holes are at 14mm and 90.6mm from front, 3mm from each side edge
sata_25_screw_positions = [
    [14, 3],           // Front left
    [14, 69.85-3],     // Front right
    [90.6, 3],         // Rear left
    [90.6, 69.85-3]    // Rear right
];

// SATA area positioning constants
sata_area_x_offset = 5;  // Gap from board edge
sata_drive_spacing = 80; // Vertical spacing between drives

// SATA area for first drive (HDD position)
sata_drive1_start_x = board_length + cable_clearance + sata_area_x_offset;
sata_drive1_start_y = cable_clearance + 20;

// SATA area for optical caddy adapter (below first drive)
sata_drive2_start_x = sata_drive1_start_x;
sata_drive2_start_y = sata_drive1_start_y + sata_drive_spacing;

/* ============================== */
/*        MODULES                 */
/* ============================== */

module screw_standoff(height, outer_dia, hole_dia) {
    difference() {
        cylinder(h=height, d=outer_dia, $fn=32);
        translate([0, 0, -0.1])
            cylinder(h=height+0.2, d=hole_dia, $fn=24);
    }
}

module ventilation_grille_holes(length, width, bar_w, gap_w, thickness) {
    num_bars_y = floor(width / (bar_w + gap_w));
    for (i = [0:num_bars_y-1]) {
        y_pos = i * (bar_w + gap_w) + gap_w/2;
        if (y_pos + gap_w <= width) {
            translate([-0.1, y_pos, -0.1])
                cube([length + 0.2, gap_w, thickness + 0.2]);
        }
    }
}

module rounded_rect(length, width, height, radius) {
    hull() {
        translate([radius, radius, 0])
            cylinder(h=height, r=radius, $fn=32);
        translate([length-radius, radius, 0])
            cylinder(h=height, r=radius, $fn=32);
        translate([radius, width-radius, 0])
            cylinder(h=height, r=radius, $fn=32);
        translate([length-radius, width-radius, 0])
            cylinder(h=height, r=radius, $fn=32);
    }
}

module cherry_mx_cutout(size, tolerance) {
    cutout_size = size + tolerance;
    translate([-cutout_size/2, -cutout_size/2, 0])
        cube([cutout_size, cutout_size, 10]);
}

module attachable_foot() {
    foot_base_dia = 15;
    foot_top_dia = 12;
    mount_hole_dia = 3.2;
    
    difference() {
        union() {
            cylinder(h=feet_height, d1=foot_base_dia, d2=foot_top_dia, $fn=32);
            translate([0, 0, feet_height])
                cylinder(h=3, d=foot_base_dia + 4, $fn=32);
        }
        translate([0, 0, -0.1])
            cylinder(h=feet_height + 3.2, d=mount_hole_dia, $fn=24);
        translate([0, 0, -0.1])
            cylinder(h=2.1, d=6, $fn=24);
    }
}

module support_rib(length) {
    cube([length, support_rib_width, support_rib_height]);
}

/* ============================== */
/*   TOP PART (with standoffs)    */
/*   Motherboard mounts here      */
/*   Has grilles for airflow      */
/* ============================== */

module top_with_standoffs() {
    difference() {
        union() {
            // Main plate with grilles
            rounded_rect(case_length, case_width, wall_thickness, 5);
            
            // Raised lip for edge connection
            difference() {
                rounded_rect(case_length, case_width, wall_thickness + 3, 5);
                translate([edge_min_thickness, edge_min_thickness, wall_thickness])
                    rounded_rect(case_length - 2*edge_min_thickness, 
                                case_width - 2*edge_min_thickness, 
                                5, 3);
            }
            
            // Motherboard screw standoffs
            for (hole = screw_holes) {
                translate([board_offset_x + hole[0], 
                          board_offset_y + hole[1], 
                          wall_thickness]) {
                    screw_standoff(standoff_height, standoff_outer_diameter, hole[3]);
                }
            }
            
            // Fan screw standoffs (2 positions)
            translate([board_offset_x + fan_screw_1_x, 
                      board_offset_y + fan_screw_1_y, 
                      wall_thickness]) {
                screw_standoff(standoff_height, 6, fan_screw_dia);
            }
            translate([board_offset_x + fan_screw_2_x, 
                      board_offset_y + fan_screw_2_y, 
                      wall_thickness]) {
                screw_standoff(standoff_height, 6, fan_screw_dia);
            }
            
            // SATA drive 1 standoffs (2.5" mounting)
            for (pos = sata_25_screw_positions) {
                translate([sata_drive1_start_x + pos[0], 
                          sata_drive1_start_y + pos[1], 
                          wall_thickness]) {
                    screw_standoff(standoff_height + 3, 7, sata_screw_hole_diameter);
                }
            }
            
            // SATA drive 2 (optical caddy) standoffs (2.5" mounting)
            for (pos = sata_25_screw_positions) {
                translate([sata_drive2_start_x + pos[0], 
                          sata_drive2_start_y + pos[1], 
                          wall_thickness]) {
                    screw_standoff(standoff_height + 3, 7, sata_screw_hole_diameter);
                }
            }
            
            // Support ribs for motherboard stability
            // Rib along X direction (front)
            translate([board_offset_x + 20, board_offset_y + 10, wall_thickness])
                support_rib(board_length - 40);
            // Rib along X direction (back)
            translate([board_offset_x + 20, board_offset_y + board_width - 15, wall_thickness])
                support_rib(board_length - 40);
            // Rib along Y direction (left side)
            translate([board_offset_x + 10, board_offset_y + 20, wall_thickness])
                rotate([0, 0, 90])
                    support_rib(board_width - 40);
            // Rib along Y direction (right side)
            translate([board_offset_x + board_length - 10, board_offset_y + 20, wall_thickness])
                rotate([0, 0, 90])
                    support_rib(board_width - 40);
        }
        
        // Fan grille holes
        translate([board_offset_x + fan_grille_start_x, 
                  board_offset_y + fan_grille_start_y, 
                  -0.1]) {
            ventilation_grille_holes(fan_grille_length, fan_grille_width, 
                                     grille_bar_width, grille_gap_width, wall_thickness + 0.2);
        }
        
        // CPU grille holes
        translate([board_offset_x + cpu_grille_start_x, 
                  board_offset_y + cpu_grille_start_y, 
                  -0.1]) {
            ventilation_grille_holes(cpu_grille_length, cpu_grille_width, 
                                     grille_bar_width, grille_gap_width, wall_thickness + 0.2);
        }
    }
}

/* ============================== */
/*   BOTTOM PART (with button)    */
/*   Has power button cutout      */
/*   Feet mount here              */
/* ============================== */

module bottom_with_button() {
    cover_height = wall_thickness + 3;
    
    difference() {
        // Main cover plate
        rounded_rect(case_length + 2, case_width + 2, cover_height, 5);
        
        // Recess to fit over edges
        translate([1, 1, wall_thickness])
            rounded_rect(case_length, case_width, cover_height, 4);
        
        // Cherry MX power button cutout (snug fit)
        translate([board_offset_x + power_button_x + 1, 
                  board_offset_y + power_button_y + 1, 
                  -0.1]) {
            cherry_mx_cutout(cherry_mx_size, cherry_mx_tolerance);
        }
        
        // Foot mounting holes
        foot_positions = [
            [26, 26],
            [case_length - 24, 26],
            [26, case_width - 24],
            [case_length - 24, case_width - 24],
            [case_length/2 + 1, 26],
            [case_length/2 + 1, case_width - 24],
        ];
        
        for (pos = foot_positions) {
            translate([pos[0], pos[1], -0.1])
                cylinder(h=cover_height + 0.2, d=3.2, $fn=24);
        }
        
        // Edge engagement slots
        for (x = [case_length/4, case_length/2, 3*case_length/4]) {
            translate([x - 5, -0.1, wall_thickness])
                cube([10, 3, 4]);
            translate([x - 5, case_width - 1, wall_thickness])
                cube([10, 3, 4]);
        }
        for (y = [case_width/4, case_width/2, 3*case_width/4]) {
            translate([-0.1, y - 5, wall_thickness])
                cube([3, 10, 4]);
            translate([case_length - 1, y - 5, wall_thickness])
                cube([3, 10, 4]);
        }
    }
}

/* ============================== */
/*      EDGE PIECES               */
/* ============================== */

// Front edge (Y = 0 side) - SD card and USB2
module edge_front() {
    edge_length = case_length - 2*edge_min_thickness;
    edge_height = case_height - wall_thickness;
    
    difference() {
        cube([edge_length, edge_min_thickness, edge_height]);
        
        // SD Card cutout
        translate([board_offset_x + sd_x - sd_width/2 - edge_min_thickness, -0.5, standoff_height])
            cube([sd_width, edge_min_thickness + 1, sd_height + 2]);
        
        // USB 2.0 cutout
        translate([board_offset_x + usb2_x - usb2_width/2 - edge_min_thickness, -0.5, standoff_height])
            cube([usb2_width, edge_min_thickness + 1, usb2_height + 2]);
    }
}

// Back edge (Y = max side) - Power connector
module edge_back() {
    edge_length = case_length - 2*edge_min_thickness;
    edge_height = case_height - wall_thickness;
    
    difference() {
        cube([edge_length, edge_min_thickness, edge_height]);
        
        // Power connector cutout
        translate([board_offset_x + power_connector_x - power_width/2 - edge_min_thickness, 
                  -0.5, standoff_height])
            cube([power_width, edge_min_thickness + 1, power_height + 2]);
    }
}

// Left edge (X = 0 side) - All main ports
module edge_left() {
    edge_length = case_width - 2*edge_min_thickness;
    edge_height = case_height - wall_thickness;
    
    difference() {
        cube([edge_min_thickness, edge_length, edge_height]);
        
        // USB 3.0 #1
        translate([-0.5, board_offset_y + usb3_1_y - usb_width/2 - edge_min_thickness, standoff_height])
            cube([edge_min_thickness + 1, usb_width, usb_height + 2]);
        
        // USB 3.0 #2
        translate([-0.5, board_offset_y + usb3_2_y - usb_width/2 - edge_min_thickness, standoff_height])
            cube([edge_min_thickness + 1, usb_width, usb_height + 2]);
        
        // HDMI
        translate([-0.5, board_offset_y + hdmi_y - hdmi_width/2 - edge_min_thickness, standoff_height])
            cube([edge_min_thickness + 1, hdmi_width, hdmi_height + 2]);
        
        // Ethernet
        translate([-0.5, board_offset_y + lan_y - lan_width/2 - edge_min_thickness, standoff_height])
            cube([edge_min_thickness + 1, lan_width, lan_height + 2]);
        
        // VGA
        translate([-0.5, board_offset_y + vga_y - vga_width/2 - edge_min_thickness, standoff_height])
            cube([edge_min_thickness + 1, vga_width, vga_height + 2]);
        
        // Heatsink cutout
        translate([-0.5, board_offset_y + heatsink_cutout_start_y - edge_min_thickness, 0])
            cube([edge_min_thickness + 1, heatsink_cutout_length, heatsink_cutout_height]);
    }
}

// Right edge (X = max side) - Solid, no SATA cutouts
module edge_right() {
    edge_length = case_width - 2*edge_min_thickness;
    edge_height = case_height - wall_thickness;
    
    cube([edge_min_thickness, edge_length, edge_height]);
}

/* ============================== */
/*      FEET SET                  */
/* ============================== */

module feet_set() {
    for (i = [0:5]) {
        translate([i * 22, 0, 0])
            attachable_foot();
    }
}

/* ============================== */
/*      PREVIEW/ASSEMBLY          */
/* ============================== */

module assembly_preview() {
    // TOP part (with standoffs) - motherboard mounts here
    color("DarkSlateGray", 0.8)
        top_with_standoffs();
    
    // Edge pieces
    color("SlateGray", 0.9) {
        translate([edge_min_thickness, 0, wall_thickness])
            edge_front();
        translate([edge_min_thickness, case_width - edge_min_thickness, wall_thickness])
            edge_back();
        translate([0, edge_min_thickness, wall_thickness])
            edge_left();
        translate([case_length - edge_min_thickness, edge_min_thickness, wall_thickness])
            edge_right();
    }
    
    // BOTTOM part (with power button) - positioned above
    color("LightGray", 0.6)
        translate([-1, -1, case_height + 5])
            bottom_with_button();
    
    // Board representation
    color("DarkGreen", 0.5)
        translate([board_offset_x, board_offset_y, wall_thickness + standoff_height])
            cube([board_length, board_width, board_thickness]);
    
    // SATA drive 1 representation
    color("Silver", 0.5)
        translate([sata_drive1_start_x, sata_drive1_start_y, wall_thickness + standoff_height + 3])
            cube([100, 69.85, 9.5]);
    
    // SATA drive 2 (optical caddy) representation
    color("DarkGray", 0.5)
        translate([sata_drive2_start_x, sata_drive2_start_y, wall_thickness + standoff_height + 3])
            cube([100, 69.85, 9.5]);
    
    // Feet (on bottom part)
    foot_positions = [
        [26, 26],
        [case_length - 24, 26],
        [26, case_width - 24],
        [case_length - 24, case_width - 24],
        [case_length/2 + 1, 26],
        [case_length/2 + 1, case_width - 24],
    ];
    
    color("Black", 0.8)
        for (pos = foot_positions) {
            translate([pos[0] - 1, pos[1] - 1, case_height + 8])
                attachable_foot();
        }
}

/* ============================== */
/*      MAIN RENDER               */
/* ============================== */

if (render_part == "top_with_standoffs") {
    top_with_standoffs();
} else if (render_part == "bottom_with_button") {
    bottom_with_button();
} else if (render_part == "edge_front") {
    edge_front();
} else if (render_part == "edge_back") {
    edge_back();
} else if (render_part == "edge_left") {
    edge_left();
} else if (render_part == "edge_right") {
    edge_right();
} else if (render_part == "feet") {
    feet_set();
} else if (render_part == "preview") {
    assembly_preview();
} else {
    // All parts for printing
    top_with_standoffs();
    
    translate([0, case_width + 20, 0])
        bottom_with_button();
    
    translate([0, 2*case_width + 50, 0])
        edge_front();
    
    translate([0, 2*case_width + 60 + edge_min_thickness, 0])
        edge_back();
    
    translate([case_length + 20, 2*case_width + 50, 0])
        rotate([0, 0, 90])
            edge_left();
    
    translate([case_length + 30 + edge_min_thickness, 2*case_width + 50, 0])
        rotate([0, 0, 90])
            edge_right();
    
    translate([0, 2*case_width + 100, 0])
        feet_set();
}

// Information
echo("===== Acer E5-574G Case =====");
echo(str("Case: ", case_length, " x ", case_width, " x ", case_height, " mm"));
echo(str("SATA extension: ", sata_extension, " mm"));
echo("===========================");
echo("ASSEMBLY ORDER:");
echo("1. Attach motherboard to TOP part (standoffs/grilles)");
echo("2. Attach edge pieces to TOP part");
echo("3. Place BOTTOM part on top (power button)");
echo("4. Attach feet to BOTTOM part");
echo("5. FLIP entire assembly upside down");
echo("===========================");
echo("PARTS:");
echo("- top_with_standoffs: Motherboard mounts here, has grilles");
echo("- bottom_with_button: Power button cutout, feet mount here");
echo("- edge_front: SD card, USB 2.0 cutouts");
echo("- edge_back: Power connector cutout");
echo("- edge_left: USB3, HDMI, LAN, VGA, heatsink cutouts");
echo("- edge_right: Solid");
echo("- feet: 6 pieces for airflow");
echo("===========================");
echo("SATA DRIVES:");
echo("- 2x 2.5\" mounting positions");
echo("- Standard screw holes at 14mm and 90.6mm from front");
echo("===========================");
