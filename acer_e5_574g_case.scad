// Acer E5-574G-54XQ Laptop Motherboard Case
// Generated from QUANTA ZRT DA0ZRTMB6D0 schematic
// 
// ORIENTATION: The schematic shows the TOP view (keyboard side facing up).
// The board is MIRRORED so that:
// - RAM and components face UP (visible from top)
// - Fan faces UP into the grille area for proper airflow
// - Screws insert from TOP (schematic view) into BOTTOM case standoffs
//
// This OpenSCAD file creates a 3D-printable case with:
// - Base plate with screw standoffs (board mounts here)
// - Separate edge/wall pieces (printed individually for printability)
// - Top cover with ventilation grilles for fan and CPU cooling
// - Port cutouts for USB, Ethernet, SD Card, Power, SATA
// - SATA extension area (130mm) for 2.5" SATA drive
// - Power button cutout for Cherry MX style keyswitch
// - Separate attachable feet for airflow

/* [Render Options] */
// What to render
render_part = "all"; // ["base", "top", "edge_front", "edge_back", "edge_left", "edge_right", "feet", "all", "preview"]

/* [Board Dimensions] */
// Board dimensions (converted from mils to mm)
board_length = 231;      // ~9100 mils = ~231mm (X direction)
board_width = 195;       // ~7660 mils = ~195mm (Y direction)
board_thickness = 1.6;   // Standard PCB thickness

/* [Case Parameters] */
// Wall thickness for 3D printing strength
wall_thickness = 3.0;

// Height of elevated sides
side_height = 15;

// Edge piece minimum thickness (for printability)
edge_min_thickness = 4.0;

// Clearance around board edges
board_clearance = 0.5;

// Cable clearance on sides (15mm as specified)
cable_clearance = 15;

// SATA extension length (130mm as specified)
sata_extension = 130;

// Attachable feet height for airflow
feet_height = 8;

// Ventilation grille parameters
grille_bar_width = 2.5;      // Width of each grille bar
grille_gap_width = 4;        // Gap between bars for airflow

/* [Fan and Heatsink Area] */
// Fan grille area (fan faces UP in this orientation)
fan_grille_start_x = 50;     // Start of fan grille area X (mm from board origin)
fan_grille_start_y = 120;    // Start of fan grille area Y (mm from board origin)
fan_grille_length = 80;      // Length of fan grille in X
fan_grille_width = 60;       // Width of fan grille in Y

// Heatsink cutout dimensions (on the side, after VGA port)
heatsink_cutout_start_y = 115;  // mm from board origin (after VGA port)
heatsink_cutout_length = 60;    // Length along the board edge
heatsink_cutout_height = 15;    // Height of cutout

// CPU area ventilation
cpu_grille_start_x = 100;    // Start X position (mm from board origin)
cpu_grille_start_y = 80;     // Start Y position
cpu_grille_length = 80;      // Length of CPU grille in X
cpu_grille_width = 70;       // Width of CPU grille in Y

/* [Power Button] */
// Cherry MX keyswitch cutout (14mm x 14mm standard)
// Positioned on top cover near RAM area
cherry_mx_size = 14.0;       // Standard Cherry MX plate cutout
cherry_mx_tolerance = 0.1;   // Snug fit tolerance
power_button_x = 180;        // X position on board (near RAM area)
power_button_y = 40;         // Y position on board

/* [Screw Parameters] */
screw_hole_diameter = 3.2;
standoff_outer_diameter = 8;
standoff_height = 5;         // Height above base for board to sit on

// SATA screw parameters
sata_screw_hole_diameter = 3.2;

/* [Calculated Dimensions] */
// Total case dimensions
case_length = board_length + 2*cable_clearance + sata_extension;
case_width = board_width + 2*cable_clearance;
case_height = side_height + board_thickness + standoff_height;

// Board offset from case origin
board_offset_x = cable_clearance;
board_offset_y = cable_clearance;

/* [Edge Connection System] */
// Dovetail-style connection for edges to base
dovetail_width = 10;
dovetail_height = 5;
dovetail_depth = 3;
dovetail_spacing = 40;  // Distance between dovetails

/* [Screw Standoff Positions from Schematic] */
function mils_to_mm(x) = x * 0.0254;

// Schematic board origin offset
schematic_origin_x = 1200;  // mils
schematic_origin_y = 440;   // mils

// Convert schematic coordinates to board-relative mm
// MIRRORED in Y direction so fan faces up
function schem_to_board_x(x) = mils_to_mm(x - schematic_origin_x);
function schem_to_board_y(y) = board_width - mils_to_mm(y - schematic_origin_y);

// Screw standoff positions (MIRRORED for correct orientation)
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

/* [Port Positions - MIRRORED] */
// Ports are mirrored in Y direction
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

sata_hdd_y = schem_to_board_y(2114.170);
sata_odd_y = schem_to_board_y(4315.300);

// Power connector - ~13cm from SATA side, on back edge
power_connector_x = 130;
power_width = 15;
power_height = 8;

/* [SATA Drive Mounting] */
sata_drive_width = 69.85;
sata_drive_length = 100.2;
sata_drive_height = 9.5;
sata_area_offset_x = 5;
sata_hdd_center_offset = 35;
sata_standoff_extra_height = 3;

sata_drive_screw_positions = [
    [14, 3],
    [14, 69.85-3],
    [90.6, 3],
    [90.6, 69.85-3]
];

/* ============================== */
/*        MODULES                 */
/* ============================== */

// Screw standoff
module screw_standoff(height, outer_dia, hole_dia) {
    difference() {
        cylinder(h=height, d=outer_dia, $fn=32);
        translate([0, 0, -0.1])
            cylinder(h=height+0.2, d=hole_dia, $fn=24);
    }
}

// Ventilation grille holes
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

// Port cutout
module port_cutout(width, height, depth) {
    cube([depth, width + 1, height + 1]);
}

// Rounded rectangle
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

// Dovetail female slot (cut into base)
module dovetail_slot(width, height, depth) {
    hull() {
        translate([0, 0, 0])
            cube([width, depth, 0.1]);
        translate([width*0.1, 0, height])
            cube([width*0.8, depth, 0.1]);
    }
}

// Dovetail male tab (on edge piece)
module dovetail_tab(width, height, depth) {
    hull() {
        translate([0, 0, 0])
            cube([width-0.3, depth-0.3, 0.1]);
        translate([width*0.1, 0, height-0.1])
            cube([width*0.8-0.3, depth-0.3, 0.1]);
    }
}

// Cherry MX keyswitch cutout
module cherry_mx_cutout(size, tolerance) {
    cutout_size = size + tolerance;
    translate([-cutout_size/2, -cutout_size/2, 0])
        cube([cutout_size, cutout_size, 10]);
}

// Attachable foot
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

/* ============================== */
/*      BASE PLATE                */
/* ============================== */

module case_base() {
    // Flat base plate with standoffs and dovetail slots for edges
    
    difference() {
        union() {
            // Main base plate
            rounded_rect(case_length, case_width, wall_thickness, 5);
            
            // Screw standoffs for motherboard
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
            
            // SATA drive standoffs
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
            
            // Raised lip around edge for edge pieces to slot into
            difference() {
                translate([0, 0, 0])
                    rounded_rect(case_length, case_width, wall_thickness + 3, 5);
                translate([edge_min_thickness, edge_min_thickness, wall_thickness])
                    rounded_rect(case_length - 2*edge_min_thickness, 
                                case_width - 2*edge_min_thickness, 
                                5, 3);
            }
        }
        
        // Foot mounting holes
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
    }
}

/* ============================== */
/*      EDGE PIECES (SEPARATE)    */
/* ============================== */

// Front edge (Y = 0 side) - with SD card and USB2 cutouts
module edge_front() {
    edge_length = case_length - 2*edge_min_thickness;
    edge_height = case_height - wall_thickness;
    
    difference() {
        // Main edge piece
        cube([edge_length, edge_min_thickness, edge_height]);
        
        // SD Card cutout
        translate([board_offset_x + sd_x - sd_width/2 - edge_min_thickness, -0.5, standoff_height])
            cube([sd_width, edge_min_thickness + 1, sd_height + 2]);
        
        // USB 2.0 cutout
        translate([board_offset_x + usb2_x - usb2_width/2 - edge_min_thickness, -0.5, standoff_height])
            cube([usb2_width, edge_min_thickness + 1, usb2_height + 2]);
    }
}

// Back edge (Y = max side) - with power connector cutout
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

// Left edge (X = 0 side) - with USB3, HDMI, LAN, VGA, heatsink cutouts
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

// Right edge (X = max side) - SOLID (no SATA cutouts needed per user)
module edge_right() {
    edge_length = case_width - 2*edge_min_thickness;
    edge_height = case_height - wall_thickness;
    
    // Solid edge piece
    cube([edge_min_thickness, edge_length, edge_height]);
}

/* ============================== */
/*      TOP COVER                 */
/* ============================== */

module case_top() {
    cover_height = wall_thickness + 3;
    
    difference() {
        union() {
            // Main cover
            rounded_rect(case_length + 2, case_width + 2, cover_height, 5);
        }
        
        // Recess to fit over edges
        translate([1, 1, wall_thickness])
            rounded_rect(case_length, case_width, cover_height, 4);
        
        // Fan area grille
        translate([board_offset_x + fan_grille_start_x + 1, 
                  board_offset_y + fan_grille_start_y + 1, 
                  -0.1]) {
            ventilation_grille_holes(fan_grille_length, fan_grille_width, 
                                     grille_bar_width, grille_gap_width, wall_thickness + 0.2);
        }
        
        // CPU area grille
        translate([board_offset_x + cpu_grille_start_x + 1, 
                  board_offset_y + cpu_grille_start_y + 1, 
                  -0.1]) {
            ventilation_grille_holes(cpu_grille_length, cpu_grille_width, 
                                     grille_bar_width, grille_gap_width, wall_thickness + 0.2);
        }
        
        // Cherry MX power button cutout (snug fit)
        translate([board_offset_x + power_button_x + 1, 
                  board_offset_y + power_button_y + 1, 
                  -0.1]) {
            cherry_mx_cutout(cherry_mx_size, cherry_mx_tolerance);
        }
        
        // Lip engagement slots for snap-fit with edges
        // Front edge slots
        for (x = [case_length/4, case_length/2, 3*case_length/4]) {
            translate([x - 5, -0.1, wall_thickness])
                cube([10, 3, 4]);
        }
        // Back edge slots
        for (x = [case_length/4, case_length/2, 3*case_length/4]) {
            translate([x - 5, case_width - 1, wall_thickness])
                cube([10, 3, 4]);
        }
        // Left edge slots
        for (y = [case_width/4, case_width/2, 3*case_width/4]) {
            translate([-0.1, y - 5, wall_thickness])
                cube([3, 10, 4]);
        }
        // Right edge slots
        for (y = [case_width/4, case_width/2, 3*case_width/4]) {
            translate([case_length - 1, y - 5, wall_thickness])
                cube([3, 10, 4]);
        }
    }
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
    // Base plate
    color("DarkSlateGray", 0.8)
        case_base();
    
    // Edge pieces (positioned around base)
    color("SlateGray", 0.9) {
        // Front edge
        translate([edge_min_thickness, 0, wall_thickness])
            edge_front();
        
        // Back edge
        translate([edge_min_thickness, case_width - edge_min_thickness, wall_thickness])
            edge_back();
        
        // Left edge
        translate([0, edge_min_thickness, wall_thickness])
            edge_left();
        
        // Right edge
        translate([case_length - edge_min_thickness, edge_min_thickness, wall_thickness])
            edge_right();
    }
    
    // Top cover (positioned above)
    color("LightGray", 0.6)
        translate([-1, -1, case_height + 5])
            case_top();
    
    // Board representation
    color("DarkGreen", 0.5)
        translate([board_offset_x, board_offset_y, wall_thickness + standoff_height])
            cube([board_length, board_width, board_thickness]);
    
    // SATA drive representation
    color("Silver", 0.5)
        translate([board_offset_x + board_length + sata_area_offset_x + 10, 
                  board_offset_y + sata_hdd_y - sata_hdd_center_offset, 
                  wall_thickness + standoff_height + sata_standoff_extra_height])
            cube([sata_drive_length, sata_drive_width, sata_drive_height]);
    
    // Feet
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
/*      MAIN RENDER               */
/* ============================== */

if (render_part == "base") {
    case_base();
} else if (render_part == "top") {
    case_top();
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
    // Render all parts laid out for printing
    case_base();
    
    translate([0, case_width + 20, 0])
        case_top();
    
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

// Information echo
echo("===== Case Dimensions =====");
echo(str("Case Length: ", case_length, " mm (including ", sata_extension, "mm SATA extension)"));
echo(str("Case Width: ", case_width, " mm"));
echo(str("Case Height: ", case_height, " mm"));
echo(str("Edge Minimum Thickness: ", edge_min_thickness, " mm"));
echo(str("Number of mounting holes: ", len(screw_holes)));
echo("===========================");
echo("PARTS TO PRINT:");
echo("1. Base plate (render_part='base')");
echo("2. Top cover (render_part='top')");
echo("3. Front edge (render_part='edge_front')");
echo("4. Back edge (render_part='edge_back')");
echo("5. Left edge (render_part='edge_left')");
echo("6. Right edge (render_part='edge_right')");
echo("7. Feet x6 (render_part='feet')");
echo("===========================");
echo("ASSEMBLY:");
echo("- Place edge pieces on base plate lip");
echo("- Insert board and secure with screws from top");
echo("- Snap top cover onto edges");
echo("- Attach feet to bottom with M3 screws");
echo("===========================");
echo("ORIENTATION:");
echo("- Board is MIRRORED so RAM/fan face UP");
echo("- Fan grille on top cover for upward airflow");
echo("- Power button uses Cherry MX keyswitch (snug fit)");
echo("===========================");
