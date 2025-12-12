# Acer E5-574G-54XQ Motherboard Case - OpenSCAD Design

This repository contains an OpenSCAD file for creating a 3D-printable case for the Acer E5-574G-54XQ laptop motherboard, designed based on the QUANTA ZRT DA0ZRTMB6D0 schematic.

## File: `acer_e5_574g_case.scad`

## Assembly Order (Upside-Down Assembly)

**IMPORTANT**: This case uses an upside-down assembly method, then flips for final orientation.

### Assembly Steps:
1. **Attach motherboard** to TOP part (which has standoffs and ventilation grilles)
2. **Attach edge pieces** to TOP part
3. **Place BOTTOM part** on top (which has power button cutout and feet mounting holes)
4. **Attach feet** to BOTTOM part
5. **FLIP entire assembly** upside down

### Final Orientation (After Flip):
- Motherboard is upside down (components face down toward grilles)
- Fan pulls air from BOTTOM through ventilation grilles
- Power button is on TOP (accessible)
- Feet are on BOTTOM for airflow clearance

## Parts Overview

The case is designed as **modular separate parts** for better 3D printability:

### 1. Top Part with Standoffs (`render_part = "top_with_standoffs"`)
- Motherboard mounts here with 23 screw standoffs
- Fan screw standoffs (2 positions for blower fan mounting)
- Ventilation grille for fan area
- Ventilation grille for CPU cooling area
- SATA drive standoffs (2x 2.5" drives with standard screw positions)
- Support ribs to keep motherboard steady
- Raised lip for edge pieces to slot into

### 2. Bottom Part with Button (`render_part = "bottom_with_button"`)
- **Cherry MX power button cutout** (14mm x 14mm, snug fit)
- Foot mounting holes (6 positions)
- Snap-fit slots to engage with edge pieces

### 3. Separate Edge Pieces (4 pieces)
Each edge is printed separately (minimum 4mm thickness):

- **Front Edge** (`render_part = "edge_front"`): SD card and USB 2.0 cutouts
- **Back Edge** (`render_part = "edge_back"`): Power connector cutout
- **Left Edge** (`render_part = "edge_left"`): USB 3.0, HDMI, Ethernet, VGA, heatsink cutouts
- **Right Edge** (`render_part = "edge_right"`): Solid (no cutouts needed)

### 4. Attachable Feet (`render_part = "feet"`)
- 6 feet for airflow clearance
- Attach to bottom part with M3 screws
- 8mm height for adequate airflow

## Rendering Options

```scad
render_part = "top_with_standoffs";  // Motherboard mounts here, has grilles
render_part = "bottom_with_button";  // Power button, feet mount here
render_part = "edge_front";          // Front edge (SD, USB2)
render_part = "edge_back";           // Back edge (power connector)
render_part = "edge_left";           // Left edge (all main ports)
render_part = "edge_right";          // Right edge (solid)
render_part = "feet";                // Attachable feet (6 pieces)
render_part = "all";                 // All parts laid out for printing
render_part = "preview";             // Assembly preview
```

## Dimensions

| Parameter | Value |
|-----------|-------|
| Board Length | 231mm |
| Board Width | 195mm |
| Case Length (with SATA extension) | 391mm |
| Case Width | 225mm |
| Case Height | ~22mm |
| Edge Minimum Thickness | 4mm |
| Cable Clearance | 15mm each side |
| SATA Extension | 130mm |
| Feet Height | 8mm |
| Cherry MX Cutout | 14mm x 14mm |

## SATA Drive Mounting

The SATA extension area includes mounting for **two 2.5" drives**:
- Position 1: For standard 2.5" HDD/SSD
- Position 2: For optical drive to SSD caddy adapter

Both use standard 2.5" screw positions:
- Front screws at 14mm from drive front edge
- Rear screws at 90.6mm from drive front edge
- Side screws at 3mm from drive side edges

## Fan Mounting

The fan has 2 screw standoffs for proper mounting:
- Fan screw positions are included in the top part
- M2.5 screws for fan attachment

## Motherboard Support

Support ribs are included to keep the motherboard steady:
- Ribs along front and back edges
- Ribs along left and right sides
- Height is just below board level for support without interference

## Screw Standoff Positions

The 23 motherboard mounting holes are positioned exactly according to the CAD schematic:
- Hole sizes range from M2.5 to M3
- All positions converted from mils to millimeters
- Standoffs are on the top part (where motherboard mounts)

## 3D Printing Recommendations

- **Material**: PLA or PETG recommended
- **Layer Height**: 0.2mm for strength
- **Infill**: 20-30% for adequate strength
- **Supports**: Not needed - all parts designed for printability
- **Print Orientation**: 
  - Top part: Print flat (grille side up)
  - Bottom part: Print flat
  - Edge pieces: Print standing on their long edge
  - Feet: Print standing up (tapered end down)

## Power Button

The power button cutout is designed for a **Cherry MX style keyswitch**:
- Standard 14mm x 14mm plate cutout
- Snug fit (0.1mm tolerance) - no glue needed
- Located on bottom part (which becomes top after flip)
- Wire keyswitch to motherboard power button header

## Customization

Key parameters that can be adjusted:

1. `wall_thickness` - Base/cover thickness (default 3mm)
2. `edge_min_thickness` - Edge piece thickness (default 4mm)
3. `side_height` - Height of edges
4. `cable_clearance` - Space for cables on each side
5. `fan_grille_*` - Fan area grille position and size
6. `cpu_grille_*` - CPU cooling grille position and size
7. `power_button_x/y` - Power button position
8. `cherry_mx_size` - Keyswitch cutout size (default 14mm)
9. `fan_screw_*` - Fan screw positions

## License

This design is provided for personal use with the Acer E5-574G-54XQ laptop motherboard.
