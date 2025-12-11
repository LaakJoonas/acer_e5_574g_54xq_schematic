# Acer E5-574G-54XQ Motherboard Case - OpenSCAD Design

This repository contains an OpenSCAD file for creating a 3D-printable case for the Acer E5-574G-54XQ laptop motherboard, designed based on the QUANTA ZRT DA0ZRTMB6D0 schematic.

## File: `acer_e5_574g_case.scad`

### Features

1. **Top Case with Elevated Sides**
   - Screw standoffs positioned according to the schematic (23 mounting holes)
   - Snap-fit attachment structures at corners (alternative to screws)
   - 15mm cable clearance on both sides of the board

2. **Bottom Case with Ventilation**
   - 3D-printable grille pattern for airflow (2.5mm bars, 4mm gaps)
   - Cross-bars for structural reinforcement
   - Elevated feet with rubber foot recesses
   - Slots for snap-fit clips from top case

3. **Port Cutouts**
   - USB 3.0 ports (left side)
   - HDMI port (left side)
   - Ethernet RJ45 (left side)
   - VGA port (left side)
   - USB 2.0 port (right side)
   - SD Card slot (bottom edge)
   - Power connector (positioned at fan cutout area as specified)
   - SATA HDD and ODD connector clearances

4. **SATA Extension Area**
   - 130mm extension on the SATA connector side
   - Screw standoffs for standard 2.5" SATA drive mounting
   - Space for optical drive to SSD adapter caddy (5.25" to 2.5" SATA)

### Usage

#### OpenSCAD Customizer

The file includes Customizer parameters that can be adjusted:

- **Render Options**: Select what to render (`top`, `bottom`, `all`, `preview`)
- **Case Parameters**: Adjust wall thickness, side height, clearances
- **Screw Parameters**: Modify screw hole dimensions
- **Grille Parameters**: Customize ventilation pattern

#### Rendering Options

To render specific parts, change the `render_part` variable:

```scad
render_part = "top";      // Render only top case
render_part = "bottom";   // Render only bottom case
render_part = "all";      // Render both parts side-by-side for printing
render_part = "preview";  // Show assembly preview with board representation
```

### Dimensions

Based on the schematic analysis:

| Parameter | Value |
|-----------|-------|
| Board Length | 231mm |
| Board Width | 195mm |
| Case Length (with SATA extension) | 391mm |
| Case Width | 225mm |
| Case Height | 21.6mm |
| Cable Clearance | 15mm each side |
| SATA Extension | 130mm |

### Screw Standoff Positions

The 23 mounting holes are positioned exactly according to the CAD schematic:
- Hole sizes range from M2.5 to M3
- Drill diameters extracted from schematic DRILL specifications
- All positions converted from mils to millimeters

### 3D Printing Recommendations

- **Material**: PLA or PETG recommended
- **Layer Height**: 0.2mm for strength, 0.1mm for finer details
- **Infill**: 20-30% for adequate strength
- **Supports**: May be needed for port cutouts
- **Print Orientation**: Print flat with the open side facing up

### Modifications

The design can be customized by modifying:

1. `wall_thickness` - Case wall thickness
2. `side_height` - Height of elevated sides
3. `cable_clearance` - Space for cables on each side
4. `grille_bar_width` and `grille_gap_width` - Ventilation grille dimensions
5. Port cutout positions and sizes in the corresponding sections

### License

This design is provided for personal use with the Acer E5-574G-54XQ laptop motherboard.
