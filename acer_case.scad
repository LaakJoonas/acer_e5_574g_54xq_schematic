// 3D-Printable Case for Acer E5-574G Laptop Motherboard
// Based on DA0ZRTMB6D0 schematic
// Units: millimeters

// ===== CONFIGURATION PARAMETERS =====

// Board dimensions (approximate from standard laptop board)
board_length = 254;  // ~10 inches
board_width = 203;   // ~8 inches
board_thickness = 1.6; // Standard PCB thickness

// Case parameters
wall_thickness = 3;
base_thickness = 2;
top_lip_height = 8;
clearance_above_board = 15; // Height clearance for components
clearance_below_board = 5;

// SATA extension
sata_extension = 130; // 13cm extension for SATA/Optical drives

// Peripheral clearance
side_clearance = 15; // 15mm on both sides for cabling

// Screw parameters
screw_hole_diameter = 3.5;
screw_post_diameter = 7;
screw_post_height = clearance_below_board - base_thickness;

// Mounting hole positions (corners, approximate)
mounting_holes = [
    [10, 10],
    [board_length - 10, 10],
    [board_length - 10, board_width - 10],
    [10, board_width - 10]
];

// Port cutout positions (approximate based on typical laptop layout)
// Format: [x_position, y_position, width, height, side]
// side: 0=front(USB), 1=right, 2=back, 3=left(power/SATA)

// USB ports on front side
usb_cutouts = [
    [50, 0, 15, 8, 0],   // USB port 1
    [75, 0, 15, 8, 0],   // USB port 2
    [100, 0, 15, 8, 0],  // USB port 3
];

// Ethernet port on front
ethernet_cutout = [25, 0, 16, 14, 0];

// HDMI/Display ports on right side
hdmi_cutout = [board_length, 50, 16, 8, 1];

// SD card reader on front
sd_card_cutout = [130, 0, 25, 3, 0];

// Power port on left side (at fan location)
power_cutout = [0, board_width/2, 12, 6, 3];

// Fan cutout on left side
fan_cutout = [0, board_width/2 + 30, 40, 40, 3];

// SATA connector clearance area on left side
sata_area_y_start = board_width * 0.3;
sata_area_y_end = board_width * 0.7;

// ===== HELPER MODULES =====

// Module to create ventilation grille
module ventilation_grille(length, width, bar_width=2, spacing=5) {
    num_bars_x = floor(length / (bar_width + spacing));
    num_bars_y = floor(width / (bar_width + spacing));
    
    union() {
        // Horizontal bars
        for (i = [0:num_bars_y-1]) {
            translate([0, i * (bar_width + spacing), 0])
                cube([length, bar_width, base_thickness]);
        }
        // Vertical bars
        for (i = [0:num_bars_x-1]) {
            translate([i * (bar_width + spacing), 0, 0])
                cube([bar_width, width, base_thickness]);
        }
    }
}

// Module to create elevated feet
module foot(diameter=10, height=3) {
    cylinder(d=diameter, h=height, $fn=32);
}

// Module for screw post
module screw_post(height) {
    difference() {
        cylinder(d=screw_post_diameter, h=height, $fn=32);
        translate([0, 0, -0.1])
            cylinder(d=screw_hole_diameter, h=height + 0.2, $fn=32);
    }
}

// Module to create standoffs for SATA drives
module sata_standoff(height=5) {
    difference() {
        cylinder(d=6, h=height, $fn=32);
        translate([0, 0, -0.1])
            cylinder(d=2.5, h=height + 0.2, $fn=32); // M2.5 screw hole
    }
}

// ===== CASE BOTTOM PART =====

module case_bottom() {
    difference() {
        union() {
            // Main base with SATA extension
            cube([board_length + 2*wall_thickness + sata_extension, 
                  board_width + 2*wall_thickness + 2*side_clearance, 
                  base_thickness]);
            
            // Side walls
            // Front wall
            translate([0, 0, base_thickness])
                cube([board_length + 2*wall_thickness + sata_extension, 
                      wall_thickness, 
                      clearance_below_board]);
            
            // Back wall
            translate([0, board_width + wall_thickness + 2*side_clearance, base_thickness])
                cube([board_length + 2*wall_thickness + sata_extension, 
                      wall_thickness, 
                      clearance_below_board]);
            
            // Right wall (with cutout considerations)
            translate([board_length + wall_thickness, 0, base_thickness])
                cube([wall_thickness, 
                      board_width + 2*wall_thickness + 2*side_clearance, 
                      clearance_below_board]);
            
            // Left wall (SATA extension side)
            translate([0, 0, base_thickness])
                cube([wall_thickness, 
                      board_width + 2*wall_thickness + 2*side_clearance, 
                      clearance_below_board]);
            
            // Screw posts at mounting holes
            for (hole = mounting_holes) {
                translate([hole[0] + wall_thickness, 
                          hole[1] + wall_thickness + side_clearance, 
                          base_thickness])
                    screw_post(screw_post_height);
            }
            
            // SATA drive standoffs in extended area
            // Positions for 2.5" SATA drive (100mm x 69.85mm standard)
            sata_drive_mounting_offset_x = board_length + wall_thickness + 15;
            sata_drive_mounting_offset_y = wall_thickness + side_clearance + 40;
            
            // 2.5" drive mounting holes (standard pattern)
            sata_2_5_holes = [
                [0, 0],
                [61.72, 0],
                [0, 76.6],
                [61.72, 76.6]
            ];
            
            for (hole = sata_2_5_holes) {
                translate([sata_drive_mounting_offset_x + hole[0], 
                          sata_drive_mounting_offset_y + hole[1], 
                          base_thickness])
                    sata_standoff(screw_post_height);
            }
            
            // Elevated feet at corners
            foot_positions = [
                [5, 5],
                [board_length + 2*wall_thickness + sata_extension - 5, 5],
                [board_length + 2*wall_thickness + sata_extension - 5, 
                 board_width + 2*wall_thickness + 2*side_clearance - 5],
                [5, board_width + 2*wall_thickness + 2*side_clearance - 5]
            ];
            
            for (pos = foot_positions) {
                translate([pos[0], pos[1], 0])
                    foot();
            }
        }
        
        // Ventilation grille in base (leaving borders)
        translate([wall_thickness + 5, wall_thickness + side_clearance + 5, -0.1])
            ventilation_grille(board_length - 10, board_width - 10);
        
        // USB port cutouts on front
        for (cutout = usb_cutouts) {
            translate([cutout[0] + wall_thickness, -0.1, base_thickness + 2])
                cube([cutout[2], wall_thickness + 0.2, cutout[3]]);
        }
        
        // Ethernet cutout on front
        translate([ethernet_cutout[0] + wall_thickness, -0.1, base_thickness + 2])
            cube([ethernet_cutout[2], wall_thickness + 0.2, ethernet_cutout[3]]);
        
        // SD card reader cutout on front
        translate([sd_card_cutout[0] + wall_thickness, -0.1, base_thickness + 1])
            cube([sd_card_cutout[2], wall_thickness + 0.2, sd_card_cutout[3]]);
        
        // HDMI cutout on right
        translate([board_length + wall_thickness - 0.1, 
                   hdmi_cutout[1] + wall_thickness + side_clearance, 
                   base_thickness + 2])
            cube([wall_thickness + 0.2, hdmi_cutout[2], hdmi_cutout[3]]);
        
        // Power port cutout on left
        translate([-0.1, 
                   power_cutout[1] + wall_thickness + side_clearance, 
                   base_thickness + 2])
            cube([wall_thickness + 0.2, power_cutout[2], power_cutout[3]]);
        
        // Fan cutout on left
        translate([-0.1, 
                   fan_cutout[1] + wall_thickness + side_clearance, 
                   base_thickness + 2])
            cube([wall_thickness + 0.2, fan_cutout[2], fan_cutout[3]]);
    }
}

// ===== CASE TOP PART =====

module case_top() {
    difference() {
        union() {
            // Top plate
            cube([board_length + 2*wall_thickness + sata_extension, 
                  board_width + 2*wall_thickness + 2*side_clearance, 
                  base_thickness]);
            
            // Elevated sides (lips that fit around bottom)
            lip_offset = 0.5; // Tolerance for fit
            
            // Front lip
            translate([lip_offset, lip_offset, -top_lip_height])
                cube([board_length + 2*wall_thickness + sata_extension - 2*lip_offset, 
                      wall_thickness, 
                      top_lip_height]);
            
            // Back lip
            translate([lip_offset, 
                       board_width + wall_thickness + 2*side_clearance - lip_offset, 
                       -top_lip_height])
                cube([board_length + 2*wall_thickness + sata_extension - 2*lip_offset, 
                      wall_thickness, 
                      top_lip_height]);
            
            // Right lip
            translate([board_length + wall_thickness - lip_offset, 
                       lip_offset, 
                       -top_lip_height])
                cube([wall_thickness, 
                      board_width + 2*wall_thickness + 2*side_clearance - 2*lip_offset, 
                      top_lip_height]);
            
            // Left lip
            translate([lip_offset, lip_offset, -top_lip_height])
                cube([wall_thickness, 
                      board_width + 2*wall_thickness + 2*side_clearance - 2*lip_offset, 
                      top_lip_height]);
        }
        
        // Screw holes at corners for attachment
        for (hole = mounting_holes) {
            translate([hole[0] + wall_thickness, 
                      hole[1] + wall_thickness + side_clearance, 
                      -0.1])
                cylinder(d=screw_hole_diameter + 0.5, h=base_thickness + 0.2, $fn=32);
        }
        
        // Small ventilation holes in top
        vent_hole_spacing = 20;
        vent_hole_diameter = 3;
        
        for (x = [20:vent_hole_spacing:board_length]) {
            for (y = [20:vent_hole_spacing:board_width]) {
                translate([x + wall_thickness, 
                          y + wall_thickness + side_clearance, 
                          -0.1])
                    cylinder(d=vent_hole_diameter, h=base_thickness + 0.2, $fn=16);
            }
        }
    }
}

// ===== RENDER PARTS =====

// Render bottom part
case_bottom();

// Render top part (positioned above for visualization)
// Uncomment to render top separately or for printing
// translate([0, 0, 30])
//     case_top();

// To print, render each part separately:
// - Uncomment the part you want to print
// - Comment out the other part
// - Export to STL

echo("Case dimensions:");
echo(str("Total length (with SATA extension): ", 
         board_length + 2*wall_thickness + sata_extension, "mm"));
echo(str("Total width (with clearance): ", 
         board_width + 2*wall_thickness + 2*side_clearance, "mm"));
echo(str("Bottom height: ", clearance_below_board + base_thickness, "mm"));
echo(str("Top height: ", top_lip_height + base_thickness, "mm"));
