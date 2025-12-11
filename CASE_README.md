# Acer E5-574G-54XQ Motherboard Case - OpenSCAD Design

This repository contains an OpenSCAD file for creating a 3D-printable case for the Acer E5-574G-54XQ laptop motherboard, designed based on the QUANTA ZRT DA0ZRTMB6D0 schematic.

## File: `acer_e5_574g_case.scad`

## Orientation Notes

**IMPORTANT**: The schematic shows the TOP view (keyboard side facing up).
- Screws insert from the TOP (schematic view) into the bottom case standoffs
- The fan pulls air from the TOP side, so ventilation grilles are on the top cover
- The heatsink is located after the VGA port area and needs a cutout on the side
- The power connector is on the opposite side from SATA, approximately 13cm from the SATA side

### Features

1. **Bottom Case (Main Tray)**
   - Screw standoffs positioned according to the schematic (23 mounting holes)
   - Board sits on standoffs, screws insert from top through board
   - 15mm cable clearance on both sides of the board
   - Port cutouts on appropriate edges
   - Heatsink cutout on left side after VGA port
   - Foot mounting holes in floor

2. **Top Case (Cover/Lid)**
   - Ventilation grille for fan area (blower-style fan pulls air from top)
   - Ventilation grille for CPU cooling area
   - Grille pattern with 2.5mm bars and 4mm gaps (3D-printable)
   - Rim fits over bottom case walls

3. **Separate Attachable Feet**
   - 6 feet for airflow (prevents fan choking)
   - Attach to bottom case floor with screws
   - 8mm height for adequate airflow

4. **Separate Attachable Clips**
   - 4 clips for securing top to bottom case
   - Printed separately to avoid overhang issues
   - Attach to case walls with screws

5. **Port Cutouts**
   - USB 3.0 ports (left side)
   - HDMI port (left side)
   - Ethernet RJ45 (left side)
   - VGA port (left side)
   - Heatsink cutout (left side, after VGA)
   - SD Card slot (front/bottom edge)
   - USB 2.0 port (front edge, near SD card/RAM area)
   - Power connector (back edge, ~13cm from SATA side)
   - SATA HDD and ODD connector clearances (right side)

6. **SATA Extension Area**
   - 130mm extension on the SATA connector side
   - Screw standoffs for standard 2.5" SATA drive mounting
   - Space for optical drive to SSD adapter caddy (5.25" to 2.5" SATA)

### Usage

#### OpenSCAD Customizer

The file includes Customizer parameters that can be adjusted:

- **Render Options**: Select what to render (`top`, `bottom`, `feet`, `clips`, `all`, `preview`)
- **Case Parameters**: Adjust wall thickness, side height, clearances
- **Fan/Heatsink Parameters**: Adjust grille positions and sizes
- **Screw Parameters**: Modify screw hole dimensions
- **Grille Parameters**: Customize ventilation pattern

#### Rendering Options

To render specific parts, change the `render_part` variable:

```scad
render_part = "top";      // Render only top cover
render_part = "bottom";   // Render only bottom tray
render_part = "feet";     // Render attachable feet (6 pieces)
render_part = "clips";    // Render attachable clips (4 pieces)
render_part = "all";      // Render all parts laid out for printing
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
| Case Height | ~22mm |
| Cable Clearance | 15mm each side |
| SATA Extension | 130mm |
| Feet Height | 8mm |

### Screw Standoff Positions

The 23 mounting holes are positioned exactly according to the CAD schematic:
- Hole sizes range from M2.5 to M3
- Drill diameters extracted from schematic DRILL specifications
- All positions converted from mils to millimeters
- **Standoffs are on the BOTTOM case** (screws insert from top)

### 3D Printing Recommendations

- **Material**: PLA or PETG recommended
- **Layer Height**: 0.2mm for strength, 0.1mm for finer details
- **Infill**: 20-30% for adequate strength
- **Supports**: Generally not needed with this design
- **Print Orientation**: 
  - Bottom case: Print with open side facing up
  - Top cover: Print with grille side facing up
  - Feet: Print standing up (tapered end down)
  - Clips: Print flat

### Assembly

1. Print bottom case, top cover, 6 feet, and 4 clips
2. Attach feet to bottom case using M3 screws through floor holes
3. Place motherboard on standoffs
4. Secure board with screws from top (through board holes into standoffs)
5. Attach clips to case walls
6. Place top cover and secure with clips

### Modifications

The design can be customized by modifying:

1. `wall_thickness` - Case wall thickness (default 3mm)
2. `side_height` - Height of elevated sides
3. `cable_clearance` - Space for cables on each side
4. `fan_grille_*` - Fan area grille position and size
5. `cpu_grille_*` - CPU cooling grille position and size
6. `grille_bar_width` and `grille_gap_width` - Ventilation grille dimensions
7. Port cutout positions and sizes in the corresponding sections

### License

This design is provided for personal use with the Acer E5-574G-54XQ laptop motherboard.
