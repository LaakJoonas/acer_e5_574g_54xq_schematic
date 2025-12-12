# Acer E5-574G-54XQ Motherboard Case - OpenSCAD Design

This repository contains an OpenSCAD file for creating a 3D-printable case for the Acer E5-574G-54XQ laptop motherboard, designed based on the QUANTA ZRT DA0ZRTMB6D0 schematic.

## File: `acer_e5_574g_case.scad`

## Orientation Notes

**IMPORTANT**: The schematic shows the TOP view (keyboard side facing up).
- The board is **MIRRORED** so that RAM and components face UP (visible)
- The fan faces UP into the grille area for proper airflow
- Screws insert from the TOP through the board into standoffs on the base plate
- The heatsink is located after the VGA port area with a cutout on the side
- The power connector is on the back edge, approximately 13cm from the SATA side

## Parts Overview

The case is designed as **modular separate parts** for better 3D printability:

### 1. Base Plate (`render_part = "base"`)
- Flat plate with screw standoffs for motherboard (23 mounting holes)
- Raised lip around edges for edge pieces to slot into
- SATA drive mounting standoffs in extension area
- Foot mounting holes in floor

### 2. Top Cover (`render_part = "top"`)
- Ventilation grille for fan area (blower-style fan pulls air from top)
- Ventilation grille for CPU cooling area
- **Cherry MX power button cutout** (14mm x 14mm, snug fit for keyswitch)
- Snap-fit slots to engage with edge pieces

### 3. Separate Edge Pieces (4 pieces)
Each edge is printed separately for better printability (minimum 4mm thickness):

- **Front Edge** (`render_part = "edge_front"`): SD card and USB 2.0 cutouts
- **Back Edge** (`render_part = "edge_back"`): Power connector cutout
- **Left Edge** (`render_part = "edge_left"`): USB 3.0, HDMI, Ethernet, VGA, heatsink cutouts
- **Right Edge** (`render_part = "edge_right"`): Solid (SATA area, no cutouts needed)

### 4. Attachable Feet (`render_part = "feet"`)
- 6 feet for airflow (prevents fan choking)
- Attach to base plate with M3 screws
- 8mm height for adequate airflow

## Rendering Options

```scad
render_part = "base";        // Base plate with standoffs
render_part = "top";         // Top cover with grilles and power button
render_part = "edge_front";  // Front edge piece
render_part = "edge_back";   // Back edge piece
render_part = "edge_left";   // Left edge piece (ports)
render_part = "edge_right";  // Right edge piece (solid)
render_part = "feet";        // Attachable feet (6 pieces)
render_part = "all";         // All parts laid out for printing
render_part = "preview";     // Assembly preview
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

## Screw Standoff Positions

The 23 mounting holes are positioned exactly according to the CAD schematic:
- Hole sizes range from M2.5 to M3
- Positions are **mirrored** so RAM/fan face upward
- All positions converted from mils to millimeters
- Standoffs are on the base plate

## 3D Printing Recommendations

- **Material**: PLA or PETG recommended
- **Layer Height**: 0.2mm for strength
- **Infill**: 20-30% for adequate strength
- **Supports**: Not needed - all parts designed for printability
- **Print Orientation**: 
  - Base plate: Print flat
  - Top cover: Print flat (grille side up)
  - Edge pieces: Print standing on their long edge
  - Feet: Print standing up (tapered end down)

## Assembly

1. Print all parts: base, top, 4 edge pieces, 6 feet
2. Attach feet to base plate using M3 screws through floor holes
3. Place edge pieces onto the raised lip of the base plate
4. Place motherboard on standoffs (fan facing UP)
5. Secure board with screws from top (through board holes into standoffs)
6. Install Cherry MX keyswitch in power button cutout (snug press-fit)
7. Snap top cover onto edge pieces

## Power Button

The power button cutout is designed for a **Cherry MX style keyswitch**:
- Standard 14mm x 14mm plate cutout
- Snug fit (0.1mm tolerance) - no glue needed
- Located on top cover near RAM area
- Wire keyswitch to motherboard power button header

## Customization

Key parameters that can be adjusted:

1. `wall_thickness` - Base/cover thickness (default 3mm)
2. `edge_min_thickness` - Edge piece thickness (default 4mm)
3. `side_height` - Height of edges
4. `cable_clearance` - Space for cables on each side
5. `fan_grille_*` - Fan area grille position and size
6. `cpu_grille_*` - CPU cooling grille position and size
7. `power_button_x/y` - Power button position on top cover
8. `cherry_mx_size` - Keyswitch cutout size (default 14mm)

## License

This design is provided for personal use with the Acer E5-574G-54XQ laptop motherboard.
