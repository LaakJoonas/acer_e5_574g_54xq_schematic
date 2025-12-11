// Acer E5-574G-54XQ Laptop Motherboard Case
// Generated from QUANTA ZRT DA0ZRTMB6D0 schematic
// 
// ORIENTATION: The schematic shows the TOP view (keyboard side facing up).
// - Screws insert from the TOP (schematic view) into BOTTOM case standoffs
// - Fan pulls air from TOP side - needs grille in component-free area
// - Heatsink is after VGA port area - needs cutout on the side
// - Power connector is on opposite side from SATA, ~13cm from SATA side
//
// This OpenSCAD file creates a 3D-printable case with:
// - Bottom part with screw standoffs (board mounts here, screws from top)
// - Top part (cover) with ventilation grille for fan and CPU cooling
// - Port cutouts for USB, Ethernet, SD Card, Power, SATA
// - SATA extension area (130mm) for 2.5" SATA drive and optical drive caddy
// - Separate attachable feet for airflow
// - Separate clip attachments for assembly (printed separately)

/* [Render Options] */
// What to render
render_part = "all"; // ["top", "bottom", "feet", "clips", "all", "preview"]

/* [Board Dimensions] */
// Board dimensions (converted from mils to mm)
// Original coordinates are in 1/1000 inch (mils)
// Conversion: 1 mil = 0.0254 mm

// Board dimensions calculated from schematic
board_length = 231;      // ~9100 mils = ~231mm (X direction)
board_width = 195;       // ~7660 mils = ~195mm (Y direction)
board_thickness = 1.6;   // Standard PCB thickness

/* [Case Parameters] */
// Wall thickness for 3D printing strength (3mm recommended for durability)
wall_thickness = 3.0;

// Height of elevated sides
side_height = 15;

// Clearance around board edges
board_clearance = 0.5;

// Cable clearance on sides (15mm as specified)
cable_clearance = 15;

// SATA extension length (130mm as specified)
sata_extension = 130;

// Attachable feet height for airflow
feet_height = 8;

// Ventilation grille parameters
grille_bar_width = 2.5;      // Width of each grille bar (printable with consumer printers)
grille_gap_width = 4;        // Gap between bars for airflow
grille_margin = 8;           // Margin from grille edges for structural strength

/* [Fan and Heatsink Area] */
// Fan area - Fan is a blower style near VGA port
// Fan connector at CN16: (3636.800, 4643.710) in schematic coords
// Heatsink is between VGA port and board edge - needs cutout on side
fan_grille_start_x = 50;     // Start of fan grille area X (mm from board origin)
fan_grille_start_y = 120;    // Start of fan grille area Y (mm from board origin)
fan_grille_length = 80;      // Length of fan grille in X
fan_grille_width = 60;       // Width of fan grille in Y

// Heatsink cutout dimensions (on the side, after VGA port)
heatsink_cutout_start_y = 115;  // mm from board origin (after VGA port)
heatsink_cutout_length = 60;    // Length along the board edge
heatsink_cutout_height = 15;    // Height of cutout

// CPU area ventilation (center of board for CPU cooling)
cpu_grille_start_x = 100;    // Start X position (mm from board origin)
cpu_grille_start_y = 80;     // Start Y position
cpu_grille_length = 80;      // Length of CPU grille in X
cpu_grille_width = 70;       // Width of CPU grille in Y

/* [Screw Parameters] */
// M3 screw parameters (typical laptop screws)
screw_hole_diameter = 3.2;   // Slightly larger for easy fit
screw_head_diameter = 6;
screw_head_depth = 2;
standoff_outer_diameter = 8;
standoff_height = 5;         // Height above case floor for board to sit on

// SATA screw parameters (2.5" drive standard M3 screws)
sata_screw_hole_diameter = 3.2;

/* [Calculated Dimensions] */
// Total case dimensions
case_length = board_length + 2*cable_clearance + sata_extension;
case_width = board_width + 2*cable_clearance;
case_height = side_height + board_thickness + standoff_height;

// Board offset from case origin (accounting for cable clearance)
board_offset_x = cable_clearance;
board_offset_y = cable_clearance;

/* [Screw Standoff Positions from Schematic] */
// Positions converted from mils to mm, adjusted relative to board origin
// Original schematic origin is approximately at (1200, 440) in mils
// Conversion factor: mils_to_mm = 0.0254

function mils_to_mm(x) = x * 0.0254;

// Schematic board origin offset (minimum coordinates in schematic)
schematic_origin_x = 1200;  // mils
schematic_origin_y = 440;   // mils

// Convert schematic coordinates to board-relative mm
function schem_to_board_x(x) = mils_to_mm(x - schematic_origin_x);
function schem_to_board_y(y) = mils_to_mm(y - schematic_origin_y);

// Screw standoff positions from schematic (converted to board-relative mm)
// Format: [x, y, hole_type, drill_diameter_mm]
// NOTE: These standoffs are on the BOTTOM case since screws insert from TOP (schematic view)

screw_holes = [
    // Main motherboard mounting holes
    [schem_to_board_x(4042.130), schem_to_board_y(440.940), "M3", 3.4],     // HOLE1
    [schem_to_board_x(1358.270), schem_to_board_y(440.950), "M3", 3.4],     // HOLE2 (near edge)
    [schem_to_board_x(9685.040), schem_to_board_y(440.950), "M3", 3.4],     // HOLE3
    [schem_to_board_x(1610.190), schem_to_board_y(472.400), "M3", 3.0],     // HOLE4
    [schem_to_board_x(9685.000), schem_to_board_y(1275.650), "M3", 3.5],    // HOLE5
    [schem_to_board_x(1786.540), schem_to_board_y(2548.030), "M3", 3.4],    // HOLE6
    [schem_to_board_x(10207.000), schem_to_board_y(3582.390), "M3", 3.5],   // HOLE7
    [schem_to_board_x(9980.320), schem_to_board_y(3582.670), "M3", 3.5],    // HOLE8
    [schem_to_board_x(3937.010), schem_to_board_y(3582.680), "M3", 3.5],    // HOLE9
    [schem_to_board_x(1314.910), schem_to_board_y(4153.500), "M3", 3.5],    // HOLE10
    [schem_to_board_x(7502.760), schem_to_board_y(4241.340), "M3", 4.0],    // HOLE11
    [schem_to_board_x(5457.090), schem_to_board_y(4241.340), "M3", 4.0],    // HOLE12
    [schem_to_board_x(1539.370), schem_to_board_y(4960.630), "M3", 3.5],    // HOLE13
    [schem_to_board_x(9960.630), schem_to_board_y(5413.390), "M3", 3.5],    // HOLE14
    [schem_to_board_x(6479.920), schem_to_board_y(6012.990), "M3", 4.0],    // HOLE15
    [schem_to_board_x(5905.510), schem_to_board_y(7244.100), "M3", 3.4],    // HOLE16
    [schem_to_board_x(10137.800), schem_to_board_y(7787.400), "M3", 5.5],   // HOLE17
    [schem_to_board_x(9496.060), schem_to_board_y(4156.300), "M3", 3.6],    // HOLE18
    [schem_to_board_x(9115.350), schem_to_board_y(5599.610), "M3", 3.5],    // HOLE19
    [schem_to_board_x(7453.540), schem_to_board_y(7261.020), "M3", 3.5],    // HOLE20
    [schem_to_board_x(1553.150), schem_to_board_y(4153.540), "M3", 3.4],    // HOLE21
    [schem_to_board_x(8395.680), schem_to_board_y(856.310), "M2.5", 2.5],   // HOLE22
    [schem_to_board_x(8454.740), schem_to_board_y(1665.360), "M2.5", 2.5],  // HOLE23
];

/* [Port Positions from Schematic] */
// All port positions converted from schematic coordinates to board-relative mm
// Ports are on the LEFT side (low X in schematic) for USB3, HDMI, LAN, VGA

// USB 3.0 ports (left side of board - low X coordinates)
usb3_1_y = schem_to_board_y(2118.110);  // CN11
usb3_2_y = schem_to_board_y(1409.440);  // CN8
usb_width = 15;
usb_height = 7;

// HDMI port (left side)
hdmi_y = schem_to_board_y(2905.510);    // CN12
hdmi_width = 18;
hdmi_height = 6;

// Ethernet RJ45 (left side)
lan_y = schem_to_board_y(3656.920);     // CN13
lan_width = 16;
lan_height = 14;

// VGA port (left side)
vga_y = schem_to_board_y(4700.790);     // CN17
vga_width = 32;
vga_height = 12;

// SD Card slot (front/bottom edge of board)
sd_x = schem_to_board_x(2440.750);      // CN1
sd_y = schem_to_board_y(1062.990);
sd_width = 30;
sd_height = 3;

// USB 2.0 - Repositioned near RAM sticks on SD card slot side (front edge)
// Per user: should be near RAM/SD card area
usb2_x = sd_x + sd_width + 25;          // Next to SD card slot
usb2_width = 15;
usb2_height = 7;

// SATA HDD connector (right edge - high X coordinates)
sata_hdd_y = schem_to_board_y(2114.170);  // CN10

// SATA ODD connector (right edge)
sata_odd_y = schem_to_board_y(4315.300);  // CN15

// Power connector - positioned on opposite side from SATA
// Per user: ~13cm from SATA side, on the back edge perpendicular to fan area
// The back edge is at Y = board_width, power is ~13cm from the SATA side
power_connector_x = 130;     // ~13cm from the SATA end (measured from left)
power_width = 15;
power_height = 8;

// Fan connector (for reference)
fan_x = schem_to_board_x(3636.800);     // CN16
fan_y = schem_to_board_y(4643.710);

/* [2.5" SATA Drive Mounting] */
// Standard 2.5" SATA drive dimensions
sata_drive_width = 69.85;
sata_drive_length = 100.2;
sata_drive_height = 9.5;  // 9.5mm height variant

// SATA area positioning parameters
sata_area_offset_x = 5;   // Gap between board edge and SATA area
sata_hdd_center_offset = 35;  // Offset from SATA connector to drive center positioning
sata_standoff_extra_height = 3;  // Additional height for SATA drive standoffs

// SATA connector cutout dimensions
sata_connector_cutout_half_width = 20;
sata_connector_cutout_width = 40;
sata_connector_cutout_height = 15;

// SATA drive screw positions (standard 2.5" form factor)
sata_drive_screw_positions = [
    [14, 3],        // Front left
    [14, 69.85-3],  // Front right
    [90.6, 3],      // Rear left
    [90.6, 69.85-3] // Rear right
];

/* ============================== */
/*        MODULES                 */
/* ============================== */

// Module: Screw standoff with hole (for bottom case)
module screw_standoff(height, outer_dia, hole_dia, head_dia=0, head_depth=0) {
    difference() {
        cylinder(h=height, d=outer_dia, $fn=32);
        translate([0, 0, -0.1])
            cylinder(h=height+0.2, d=hole_dia, $fn=24);
        if (head_dia > 0 && head_depth > 0) {
            translate([0, 0, height - head_depth])
                cylinder(h=head_depth+0.1, d=head_dia, $fn=24);
        }
    }
}

// Module: Ventilation grille (actual holes for airflow)
module ventilation_grille_holes(length, width, bar_w, gap_w, thickness) {
    // Creates actual holes in the material for airflow
    num_bars_y = floor(width / (bar_w + gap_w));
    
    // Create horizontal slots
    for (i = [0:num_bars_y-1]) {
        y_pos = i * (bar_w + gap_w) + gap_w/2;
        if (y_pos + gap_w <= width) {
            translate([-0.1, y_pos, -0.1])
                cube([length + 0.2, gap_w, thickness + 0.2]);
        }
    }
}

// Module: Rectangular grille pattern (printable)
// Note: This module creates a standalone grille piece if needed separately
module printable_grille(length, width, bar_w, gap_w, thickness) {
    // Creates a grille with bars - the solid parts that remain after cutting
    difference() {
        cube([length, width, thickness]);
        ventilation_grille_holes(length, width, bar_w, gap_w, thickness);
    }
}

// Module: Port cutout
module port_cutout(width, height, depth, extra_clearance=0.5) {
    cube([depth, width + extra_clearance*2, height + extra_clearance*2]);
}

// Module: Rounded rectangle
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

// Module: Attachable foot (printed separately)
module attachable_foot() {
    foot_base_dia = 15;
    foot_top_dia = 12;
    foot_total_height = feet_height;
    mount_hole_dia = 3.2;  // For M3 screw
    
    difference() {
        union() {
            // Tapered foot
            cylinder(h=foot_total_height, d1=foot_base_dia, d2=foot_top_dia, $fn=32);
            // Mounting flange
            translate([0, 0, foot_total_height])
                cylinder(h=3, d=foot_base_dia + 4, $fn=32);
        }
        // Mounting hole through center
        translate([0, 0, -0.1])
            cylinder(h=foot_total_height + 3.2, d=mount_hole_dia, $fn=24);
        // Countersink for screw head
        translate([0, 0, -0.1])
            cylinder(h=2.1, d=6, $fn=24);
    }
}

// Module: Attachable clip (printed separately)
module attachable_clip() {
    clip_length = 20;
    clip_width = 8;
    clip_height = 12;
    mount_hole_dia = 3.2;
    
    difference() {
        union() {
            // Base plate with mounting hole
            cube([clip_length, clip_width, 3]);
            // Vertical clip part
            translate([clip_length/2 - 2, 0, 3])
                cube([4, clip_width, clip_height - 3]);
            // Hook at top
            translate([clip_length/2 - 3, 0, clip_height - 2])
                cube([6, clip_width, 2]);
        }
        // Mounting hole
        translate([clip_length/4, clip_width/2, -0.1])
            cylinder(h=3.2, d=mount_hole_dia, $fn=24);
        translate([3*clip_length/4, clip_width/2, -0.1])
            cylinder(h=3.2, d=mount_hole_dia, $fn=24);
    }
}

/* ============================== */
/*      BOTTOM CASE (Main Tray)   */
/* ============================== */

module case_bottom() {
    // Bottom case holds the motherboard with standoffs
    // Screws insert from TOP through board into these standoffs
    
    difference() {
        union() {
            // Main tray with walls
            difference() {
                // Outer shell
                rounded_rect(case_length, case_width, case_height, 5);
                
                // Inner cavity (leave floor)
                translate([wall_thickness, wall_thickness, wall_thickness])
                    rounded_rect(case_length - 2*wall_thickness, 
                                case_width - 2*wall_thickness, 
                                case_height, 3);
            }
            
            // Screw standoffs from schematic positions (ON BOTTOM CASE)
            for (hole = screw_holes) {
                translate([board_offset_x + hole[0], 
                          board_offset_y + hole[1], 
                          wall_thickness]) {
                    screw_standoff(
                        height = standoff_height,
                        outer_dia = standoff_outer_diameter,
                        hole_dia = hole[3]
                    );
                }
            }
            
            // SATA extension area screw standoffs
            sata_area_start_x = board_offset_x + board_length + sata_area_offset_x;
            sata_area_start_y = board_offset_y + sata_hdd_y - sata_hdd_center_offset;
            
            for (pos = sata_drive_screw_positions) {
                translate([sata_area_start_x + pos[0], 
                          sata_area_start_y + pos[1], 
                          wall_thickness]) {
                    screw_standoff(
                        height = standoff_height + sata_standoff_extra_height,
                        outer_dia = 7,
                        hole_dia = sata_screw_hole_diameter
                    );
                }
            }
        }
        
        // Port cutouts on LEFT side (X = 0 face) - ports face outward
        // USB 3.0 #1
        translate([-0.5, board_offset_y + usb3_1_y - usb_width/2, wall_thickness + standoff_height])
            port_cutout(usb_width, usb_height, wall_thickness + 1);
            
        // USB 3.0 #2
        translate([-0.5, board_offset_y + usb3_2_y - usb_width/2, wall_thickness + standoff_height])
            port_cutout(usb_width, usb_height, wall_thickness + 1);
        
        // HDMI
        translate([-0.5, board_offset_y + hdmi_y - hdmi_width/2, wall_thickness + standoff_height])
            port_cutout(hdmi_width, hdmi_height, wall_thickness + 1);
        
        // Ethernet RJ45
        translate([-0.5, board_offset_y + lan_y - lan_width/2, wall_thickness + standoff_height])
            port_cutout(lan_width, lan_height, wall_thickness + 1);
        
        // VGA
        translate([-0.5, board_offset_y + vga_y - vga_width/2, wall_thickness + standoff_height])
            port_cutout(vga_width, vga_height, wall_thickness + 1);
        
        // Heatsink cutout (on left side, after VGA port)
        translate([-0.5, board_offset_y + heatsink_cutout_start_y, wall_thickness])
            cube([wall_thickness + 1, heatsink_cutout_length, heatsink_cutout_height + standoff_height]);
        
        // Port cutouts on FRONT edge (Y = 0 face)
        // SD Card slot
        translate([board_offset_x + sd_x - sd_width/2, -0.5, wall_thickness + standoff_height])
            cube([sd_width, wall_thickness + 1, sd_height + 1]);
        
        // USB 2.0 (next to SD card)
        translate([board_offset_x + usb2_x - usb2_width/2, -0.5, wall_thickness + standoff_height])
            cube([usb2_width, wall_thickness + 1, usb2_height + 1]);
        
        // Port cutouts on RIGHT side (high X face) - SATA connectors
        // SATA HDD opening
        translate([case_length - wall_thickness - 0.5, 
                  board_offset_y + sata_hdd_y - sata_connector_cutout_half_width, 
                  wall_thickness])
            cube([wall_thickness + 1, sata_connector_cutout_width, sata_connector_cutout_height]);
        
        // SATA ODD opening
        translate([case_length - wall_thickness - 0.5, 
                  board_offset_y + sata_odd_y - sata_connector_cutout_half_width, 
                  wall_thickness])
            cube([wall_thickness + 1, sata_connector_cutout_width, sata_connector_cutout_height]);
        
        // Power connector on BACK edge (Y = case_width face)
        // Positioned at ~13cm from SATA side = at power_connector_x from left
        translate([board_offset_x + power_connector_x - power_width/2, 
                  case_width - wall_thickness - 0.5, 
                  wall_thickness + standoff_height])
            cube([power_width, wall_thickness + 1, power_height + 1]);
        
        // Foot mounting holes (in floor of case)
        foot_positions = [
            [25, 25],
            [case_length - 25, 25],
            [25, case_width - 25],
            [case_length - 25, case_width - 25],
            [case_length/2, 25],
            [case_length/2, case_width - 25],
        ];
        
        for (pos = foot_positions) {
            translate([pos[0], pos[1], -0.1])
                cylinder(h=wall_thickness + 0.2, d=3.2, $fn=24);
        }
        
        // Clip mounting holes (on walls)
        // Front wall clips
        translate([case_length/3, wall_thickness/2, case_height - 8])
            rotate([90, 0, 0])
                cylinder(h=wall_thickness + 1, d=3.2, center=true, $fn=24);
        translate([2*case_length/3, wall_thickness/2, case_height - 8])
            rotate([90, 0, 0])
                cylinder(h=wall_thickness + 1, d=3.2, center=true, $fn=24);
        
        // Back wall clips
        translate([case_length/3, case_width - wall_thickness/2, case_height - 8])
            rotate([90, 0, 0])
                cylinder(h=wall_thickness + 1, d=3.2, center=true, $fn=24);
        translate([2*case_length/3, case_width - wall_thickness/2, case_height - 8])
            rotate([90, 0, 0])
                cylinder(h=wall_thickness + 1, d=3.2, center=true, $fn=24);
    }
}

/* ============================== */
/*      TOP CASE (Cover/Lid)      */
/* ============================== */

module case_top() {
    // Top case is a cover with ventilation grilles
    // Fan pulls air from this side, so grilles are here
    
    cover_height = wall_thickness + 5;  // Just a lid, not deep
    
    difference() {
        union() {
            // Lid with slight rim to fit over bottom case walls
            difference() {
                rounded_rect(case_length + 2, case_width + 2, cover_height, 5);
                
                // Recess to fit over bottom case
                translate([1, 1, wall_thickness])
                    rounded_rect(case_length, case_width, cover_height, 4);
            }
        }
        
        // Fan area grille (after VGA port area)
        translate([board_offset_x + fan_grille_start_x + 1, 
                  board_offset_y + fan_grille_start_y + 1, 
                  -0.1]) {
            ventilation_grille_holes(fan_grille_length, fan_grille_width, 
                                     grille_bar_width, grille_gap_width, wall_thickness + 0.2);
        }
        
        // CPU area grille (center of board)
        translate([board_offset_x + cpu_grille_start_x + 1, 
                  board_offset_y + cpu_grille_start_y + 1, 
                  -0.1]) {
            ventilation_grille_holes(cpu_grille_length, cpu_grille_width, 
                                     grille_bar_width, grille_gap_width, wall_thickness + 0.2);
        }
        
        // Clip receiver slots on rim
        // Front edge
        translate([case_length/3 - 3, -0.1, wall_thickness])
            cube([6, 3, cover_height]);
        translate([2*case_length/3 - 3, -0.1, wall_thickness])
            cube([6, 3, cover_height]);
        
        // Back edge
        translate([case_length/3 - 3, case_width - 1, wall_thickness])
            cube([6, 3, cover_height]);
        translate([2*case_length/3 - 3, case_width - 1, wall_thickness])
            cube([6, 3, cover_height]);
    }
}

/* ============================== */
/*      SEPARATE FEET             */
/* ============================== */

module feet_set() {
    // Render 6 feet for printing
    for (i = [0:5]) {
        translate([i * 22, 0, 0])
            attachable_foot();
    }
}

/* ============================== */
/*      SEPARATE CLIPS            */
/* ============================== */

module clips_set() {
    // Render 4 clips for printing
    for (i = [0:3]) {
        translate([i * 25, 0, 0])
            attachable_clip();
    }
}

/* ============================== */
/*        PREVIEW/ASSEMBLY        */
/* ============================== */

module assembly_preview() {
    // Bottom case (main tray)
    color("DarkSlateGray", 0.8)
        case_bottom();
    
    // Top case (cover) - positioned above
    color("SlateGray", 0.6)
        translate([-1, -1, case_height + 10])
            case_top();
    
    // Board representation (for reference)
    color("DarkGreen", 0.5)
        translate([board_offset_x, board_offset_y, wall_thickness + standoff_height])
            cube([board_length, board_width, board_thickness]);
    
    // 2.5" SATA drive representation
    color("Silver", 0.5)
        translate([board_offset_x + board_length + sata_area_offset_x + 10, 
                  board_offset_y + sata_hdd_y - sata_hdd_center_offset, 
                  wall_thickness + standoff_height + sata_standoff_extra_height])
            cube([sata_drive_length, sata_drive_width, sata_drive_height]);
    
    // Show feet positions
    foot_positions = [
        [25, 25],
        [case_length - 25, 25],
        [25, case_width - 25],
        [case_length - 25, case_width - 25],
        [case_length/2, 25],
        [case_length/2, case_width - 25],
    ];
    
    color("Black", 0.8)
        for (pos = foot_positions) {
            translate([pos[0], pos[1], -feet_height])
                attachable_foot();
        }
}

/* ============================== */
/*        MAIN RENDER             */
/* ============================== */

if (render_part == "top") {
    case_top();
} else if (render_part == "bottom") {
    case_bottom();
} else if (render_part == "feet") {
    feet_set();
} else if (render_part == "clips") {
    clips_set();
} else if (render_part == "preview") {
    assembly_preview();
} else {
    // Render all parts laid out for printing
    case_bottom();
    
    translate([0, case_width + 20, 0])
        case_top();
    
    translate([0, 2*case_width + 40, 0])
        feet_set();
    
    translate([150, 2*case_width + 40, 0])
        clips_set();
}

// Information echo
echo("===== Case Dimensions =====");
echo(str("Case Length: ", case_length, " mm (including ", sata_extension, "mm SATA extension)"));
echo(str("Case Width: ", case_width, " mm"));
echo(str("Case Height: ", case_height, " mm"));
echo(str("Board Area: ", board_length, " x ", board_width, " mm"));
echo(str("Cable Clearance: ", cable_clearance, " mm on each side"));
echo(str("Number of mounting holes: ", len(screw_holes)));
echo("===========================");
echo("ORIENTATION NOTES:");
echo("- Standoffs are on BOTTOM case (screws from top/keyboard side)");
echo("- Fan grille on TOP cover (fan pulls air from keyboard side)");
echo("- Heatsink cutout on LEFT side after VGA port");
echo("- Power connector on BACK edge, ~13cm from SATA side");
echo("- Feet and clips are separate printable parts");
echo("===========================");
