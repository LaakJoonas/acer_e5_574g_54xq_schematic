// Acer E5-574G-54XQ Laptop Motherboard Case
// Generated from QUANTA ZRT DA0ZRTMB6D0 schematic
// 
// This OpenSCAD file creates a 3D-printable case with:
// - Top part with elevated sides and screw holes
// - Bottom part with ventilation grille and feet
// - Port cutouts for USB, Ethernet, SD Card, Power, SATA
// - Screw standoffs positioned according to schematic
// - SATA extension area (130mm) for 2.5" SATA drive and optical drive caddy

/* [Render Options] */
// What to render
render_part = "all"; // ["top", "bottom", "all", "preview"]

/* [Board Dimensions] */
// Board dimensions (converted from mils to mm)
// Original coordinates are in 1/1000 inch (mils)
// Conversion: 1 mil = 0.0254 mm

// Board dimensions calculated from schematic
board_length = 231;      // ~9100 mils = ~231mm (X direction)
board_width = 195;       // ~7660 mils = ~195mm (Y direction)
board_thickness = 1.6;   // Standard PCB thickness

/* [Case Parameters] */
// Wall thickness for 3D printing strength
wall_thickness = 2.5;

// Height of elevated sides
side_height = 15;

// Clearance around board edges
board_clearance = 0.5;

// Cable clearance on sides (15mm as specified)
cable_clearance = 15;

// SATA extension length (130mm as specified)
sata_extension = 130;

// Bottom case feet height
feet_height = 5;

// Ventilation grille parameters
grille_bar_width = 2.5;      // Width of each grille bar (printable with consumer printers)
grille_gap_width = 4;        // Gap between bars for airflow
grille_margin = 10;          // Margin from edges for structural strength

/* [Screw Parameters] */
// M3 screw parameters (typical laptop screws)
screw_hole_diameter = 3.2;   // Slightly larger for easy fit
screw_head_diameter = 6;
screw_head_depth = 2;
standoff_outer_diameter = 8;
standoff_height = 5;         // Height above board level

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
// Drill diameters from schematic: DRILL_XXX where XXX is diameter in mils * 10

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

// USB 3.0 ports (left side of board)
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

// SD Card slot (bottom edge, left area)
sd_x = schem_to_board_x(2440.750);      // CN1
sd_y = schem_to_board_y(1062.990);
sd_width = 30;
sd_height = 3;

// USB 2.0 (right side, near bottom)
usb2_y = schem_to_board_y(976.380);     // CN6
usb2_width = 15;
usb2_height = 7;

// SATA HDD connector (right edge)
sata_hdd_y = schem_to_board_y(2114.170);  // CN10

// SATA ODD connector (right edge)
sata_odd_y = schem_to_board_y(4315.300);  // CN15

// Power connector (right side, near top - placed at fan cutout start as specified)
power_y = board_width - 20;  // Near fan area, adjusted for non-schematic position
power_width = 15;
power_height = 8;

// Fan area (for power connector placement reference)
fan_x = schem_to_board_x(3636.800);     // CN16
fan_y = schem_to_board_y(4643.710);

/* [2.5" SATA Drive Mounting] */
// Standard 2.5" SATA drive dimensions
sata_drive_width = 69.85;
sata_drive_length = 100.2;
sata_drive_height = 9.5;  // 9.5mm height variant

// SATA drive screw positions (standard 2.5" form factor)
// Side mounting holes at 14mm and 90.6mm from connector end
sata_drive_screw_positions = [
    [14, 3],        // Front left
    [14, 69.85-3],  // Front right
    [90.6, 3],      // Rear left
    [90.6, 69.85-3] // Rear right
];

/* ============================== */
/*        MODULES                 */
/* ============================== */

// Module: Screw standoff with hole
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

// Module: Clip/snap-fit attachment point (alternative to screws)
module snap_clip(width=10, depth=5, height=10) {
    // Create a flexible clip that can snap onto the bottom case
    difference() {
        union() {
            cube([width, depth, height]);
            // Snap ridge
            translate([0, depth-1, height-2])
                rotate([0, 90, 0])
                    cylinder(h=width, d=2, $fn=16);
        }
        // Slot for flexibility
        translate([width/2 - 1, -0.1, height/3])
            cube([2, depth+0.2, height/2]);
    }
}

// Module: Ventilation grille (3D-printable friendly)
module ventilation_grille(length, width, bar_w, gap_w, thickness) {
    // Creates a printable grille pattern with bars running in one direction
    num_bars = floor((width - bar_w) / (bar_w + gap_w));
    
    for (i = [0:num_bars]) {
        y_pos = bar_w/2 + i * (bar_w + gap_w);
        if (y_pos + bar_w/2 <= width) {
            translate([0, y_pos - bar_w/2, 0])
                cube([length, bar_w, thickness]);
        }
    }
}

// Module: Port cutout
module port_cutout(width, height, depth=wall_thickness+1, extra_clearance=0.5) {
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

/* ============================== */
/*        TOP CASE                */
/* ============================== */

module case_top() {
    difference() {
        union() {
            // Main case shell
            difference() {
                // Outer shell with rounded corners
                rounded_rect(case_length, case_width, case_height, 5);
                
                // Inner cavity
                translate([wall_thickness, wall_thickness, wall_thickness])
                    rounded_rect(case_length - 2*wall_thickness, 
                                case_width - 2*wall_thickness, 
                                case_height, 3);
            }
            
            // Screw standoffs from schematic positions
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
            
            // Corner snap-fit attachment structures
            corner_inset = 10;
            clip_width = 15;
            clip_height = 8;
            
            // Front-left corner
            translate([corner_inset, corner_inset, wall_thickness])
                snap_clip(clip_width, 6, clip_height);
            
            // Front-right corner
            translate([case_length - corner_inset - clip_width, corner_inset, wall_thickness])
                snap_clip(clip_width, 6, clip_height);
            
            // Rear-left corner
            translate([corner_inset, case_width - corner_inset - 6, wall_thickness])
                snap_clip(clip_width, 6, clip_height);
            
            // Rear-right corner
            translate([case_length - corner_inset - clip_width, case_width - corner_inset - 6, wall_thickness])
                snap_clip(clip_width, 6, clip_height);
                
            // SATA extension area screw standoffs
            // Standard 2.5" SATA drive mounting holes
            sata_area_start_x = board_offset_x + board_length + 5;
            sata_area_start_y = board_offset_y + sata_hdd_y - 35;
            
            for (pos = sata_drive_screw_positions) {
                translate([sata_area_start_x + pos[0], 
                          sata_area_start_y + pos[1], 
                          wall_thickness]) {
                    screw_standoff(
                        height = standoff_height + 3,  // Slightly taller for drive
                        outer_dia = 7,
                        hole_dia = sata_screw_hole_diameter
                    );
                }
            }
        }
        
        // Port cutouts on LEFT side (Y = 0 face)
        // USB 3.0 #1
        translate([-0.5, board_offset_y + usb3_1_y - usb_width/2, wall_thickness + standoff_height])
            port_cutout(usb_width, usb_height);
            
        // USB 3.0 #2
        translate([-0.5, board_offset_y + usb3_2_y - usb_width/2, wall_thickness + standoff_height])
            port_cutout(usb_width, usb_height);
        
        // HDMI
        translate([-0.5, board_offset_y + hdmi_y - hdmi_width/2, wall_thickness + standoff_height])
            port_cutout(hdmi_width, hdmi_height);
        
        // Ethernet RJ45
        translate([-0.5, board_offset_y + lan_y - lan_width/2, wall_thickness + standoff_height])
            port_cutout(lan_width, lan_height);
        
        // VGA
        translate([-0.5, board_offset_y + vga_y - vga_width/2, wall_thickness + standoff_height])
            port_cutout(vga_width, vga_height);
        
        // Port cutouts on RIGHT side
        // USB 2.0
        translate([case_length - wall_thickness - 0.5, board_offset_y + usb2_y - usb2_width/2, wall_thickness + standoff_height])
            port_cutout(usb2_width, usb2_height);
        
        // SATA HDD opening (large cutout for cable/connector)
        translate([case_length - wall_thickness - 0.5, board_offset_y + sata_hdd_y - 20, wall_thickness + standoff_height - 5])
            cube([wall_thickness + 1, 40, 15]);
        
        // SATA ODD opening
        translate([case_length - wall_thickness - 0.5, board_offset_y + sata_odd_y - 20, wall_thickness + standoff_height - 5])
            cube([wall_thickness + 1, 40, 15]);
        
        // Power connector (at fan cutout start on longer side as specified)
        // Positioned on the right side where fan area starts
        translate([case_length - wall_thickness - 0.5, case_width - board_offset_y - power_width - 10, wall_thickness + standoff_height])
            port_cutout(power_width, power_height);
        
        // SD Card slot (on bottom edge)
        translate([board_offset_x + sd_x - sd_width/2, -0.5, wall_thickness + standoff_height])
            rotate([0, 0, 90])
                port_cutout(sd_width, sd_height);
    }
}

/* ============================== */
/*        BOTTOM CASE             */
/* ============================== */

module case_bottom() {
    bottom_height = feet_height + wall_thickness;
    grille_thickness = wall_thickness;
    
    difference() {
        union() {
            // Outer rim that slots into top case
            difference() {
                rounded_rect(case_length - wall_thickness*2 - board_clearance*2, 
                            case_width - wall_thickness*2 - board_clearance*2, 
                            bottom_height, 3);
                
                // Inner cutout for grille area
                translate([grille_margin, grille_margin, wall_thickness])
                    rounded_rect(case_length - wall_thickness*2 - board_clearance*2 - grille_margin*2, 
                                case_width - wall_thickness*2 - board_clearance*2 - grille_margin*2, 
                                bottom_height, 2);
            }
            
            // Ventilation grille
            translate([grille_margin, grille_margin, 0])
                ventilation_grille(
                    case_length - wall_thickness*2 - board_clearance*2 - grille_margin*2,
                    case_width - wall_thickness*2 - board_clearance*2 - grille_margin*2,
                    grille_bar_width,
                    grille_gap_width,
                    wall_thickness
                );
            
            // Cross-bars for structural support (perpendicular to main grille)
            num_cross_bars = 5;
            cross_bar_width = grille_bar_width * 1.5;
            grille_length = case_length - wall_thickness*2 - board_clearance*2 - grille_margin*2;
            grille_width_area = case_width - wall_thickness*2 - board_clearance*2 - grille_margin*2;
            
            for (i = [1:num_cross_bars]) {
                x_pos = grille_margin + (grille_length / (num_cross_bars + 1)) * i - cross_bar_width/2;
                translate([x_pos, grille_margin, 0])
                    cube([cross_bar_width, grille_width_area, wall_thickness]);
            }
            
            // Feet at corners
            foot_inset = 15;
            foot_diameter = 12;
            
            // Front-left foot
            translate([foot_inset, foot_inset, 0])
                cylinder(h=feet_height + wall_thickness, d=foot_diameter, $fn=32);
            
            // Front-right foot
            translate([case_length - wall_thickness*2 - board_clearance*2 - foot_inset, foot_inset, 0])
                cylinder(h=feet_height + wall_thickness, d=foot_diameter, $fn=32);
            
            // Rear-left foot
            translate([foot_inset, case_width - wall_thickness*2 - board_clearance*2 - foot_inset, 0])
                cylinder(h=feet_height + wall_thickness, d=foot_diameter, $fn=32);
            
            // Rear-right foot
            translate([case_length - wall_thickness*2 - board_clearance*2 - foot_inset, 
                      case_width - wall_thickness*2 - board_clearance*2 - foot_inset, 0])
                cylinder(h=feet_height + wall_thickness, d=foot_diameter, $fn=32);
            
            // Additional center feet for support
            translate([(case_length - wall_thickness*2 - board_clearance*2)/2, foot_inset, 0])
                cylinder(h=feet_height + wall_thickness, d=foot_diameter, $fn=32);
            
            translate([(case_length - wall_thickness*2 - board_clearance*2)/2, 
                      case_width - wall_thickness*2 - board_clearance*2 - foot_inset, 0])
                cylinder(h=feet_height + wall_thickness, d=foot_diameter, $fn=32);
            
            // Snap-fit receivers (slots for clips from top case)
            corner_inset = 10 - wall_thickness - board_clearance;
            slot_width = 16;
            slot_depth = 7;
            slot_height = 10;
            
            // Create raised edges for snap-fit
            translate([corner_inset, corner_inset, wall_thickness])
                difference() {
                    cube([slot_width + 4, slot_depth + 4, slot_height]);
                    translate([2, 2, -0.1])
                        cube([slot_width, slot_depth, slot_height + 0.2]);
                }
            
            translate([case_length - wall_thickness*2 - board_clearance*2 - corner_inset - slot_width - 4, 
                      corner_inset, wall_thickness])
                difference() {
                    cube([slot_width + 4, slot_depth + 4, slot_height]);
                    translate([2, 2, -0.1])
                        cube([slot_width, slot_depth, slot_height + 0.2]);
                }
            
            translate([corner_inset, 
                      case_width - wall_thickness*2 - board_clearance*2 - corner_inset - slot_depth - 4, 
                      wall_thickness])
                difference() {
                    cube([slot_width + 4, slot_depth + 4, slot_height]);
                    translate([2, 2, -0.1])
                        cube([slot_width, slot_depth, slot_height + 0.2]);
                }
            
            translate([case_length - wall_thickness*2 - board_clearance*2 - corner_inset - slot_width - 4, 
                      case_width - wall_thickness*2 - board_clearance*2 - corner_inset - slot_depth - 4, 
                      wall_thickness])
                difference() {
                    cube([slot_width + 4, slot_depth + 4, slot_height]);
                    translate([2, 2, -0.1])
                        cube([slot_width, slot_depth, slot_height + 0.2]);
                }
        }
        
        // Rubber foot indents at the feet locations
        foot_inset = 15;
        rubber_foot_dia = 8;
        rubber_foot_depth = 2;
        
        translate([foot_inset, foot_inset, -0.1])
            cylinder(h=rubber_foot_depth + 0.1, d=rubber_foot_dia, $fn=24);
        translate([case_length - wall_thickness*2 - board_clearance*2 - foot_inset, foot_inset, -0.1])
            cylinder(h=rubber_foot_depth + 0.1, d=rubber_foot_dia, $fn=24);
        translate([foot_inset, case_width - wall_thickness*2 - board_clearance*2 - foot_inset, -0.1])
            cylinder(h=rubber_foot_depth + 0.1, d=rubber_foot_dia, $fn=24);
        translate([case_length - wall_thickness*2 - board_clearance*2 - foot_inset, 
                  case_width - wall_thickness*2 - board_clearance*2 - foot_inset, -0.1])
            cylinder(h=rubber_foot_depth + 0.1, d=rubber_foot_dia, $fn=24);
        translate([(case_length - wall_thickness*2 - board_clearance*2)/2, foot_inset, -0.1])
            cylinder(h=rubber_foot_depth + 0.1, d=rubber_foot_dia, $fn=24);
        translate([(case_length - wall_thickness*2 - board_clearance*2)/2, 
                  case_width - wall_thickness*2 - board_clearance*2 - foot_inset, -0.1])
            cylinder(h=rubber_foot_depth + 0.1, d=rubber_foot_dia, $fn=24);
    }
}

/* ============================== */
/*        PREVIEW/ASSEMBLY        */
/* ============================== */

module assembly_preview() {
    // Top case
    color("DarkSlateGray", 0.7)
        case_top();
    
    // Bottom case (positioned to show how it slots in)
    color("SlateGray", 0.7)
        translate([wall_thickness + board_clearance, 
                  wall_thickness + board_clearance, 
                  -feet_height - wall_thickness - 5])
            case_bottom();
    
    // Board representation (for reference)
    color("DarkGreen", 0.5)
        translate([board_offset_x, board_offset_y, wall_thickness + standoff_height])
            cube([board_length, board_width, board_thickness]);
    
    // 2.5" SATA drive representation
    color("Silver", 0.5)
        translate([board_offset_x + board_length + 10, 
                  board_offset_y + schem_to_board_y(2114.170) - 35, 
                  wall_thickness + standoff_height + 3])
            cube([sata_drive_length, sata_drive_width, sata_drive_height]);
}

/* ============================== */
/*        MAIN RENDER             */
/* ============================== */

if (render_part == "top") {
    case_top();
} else if (render_part == "bottom") {
    case_bottom();
} else if (render_part == "preview") {
    assembly_preview();
} else {
    // Render all parts side by side for printing
    case_top();
    
    translate([0, case_width + 20, 0])
        case_bottom();
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
