# Acer E5-574G two-piece case (OpenSCAD)

This folder contains a parametric OpenSCAD model for a two-piece, snap-fit case based on the GENCAD placement data in this repository.

## What the model includes
- Bottom shell with snap-posts through six motherboard holes (no screws required).
- Mesh intake under the fan area, plus clip tabs to retain the fan/heatsink region.
- Cutouts for RJ45, USB, HDMI, SD card, and a rear power port (moved from the original side location).
- Tool-less drive bays for the 2.5" SSD and optical-bay HDD adapter.
- Top shell with latch slots, alignment features, and stackable feet/recesses.

## Coordinate system and assumptions
- Units are millimeters; coordinates are derived from `da0zrtmb6d0.cad` (GENCAD `UNITS USER 1000`, converted from mils).
- The board outline is approximated using component extents because no explicit board outline polygon is defined in the CAD data.
- Fan/heatsink, drive bay positions, and optional audio/DC ports are adjustable parameters.

## Exporting STLs
OpenSCAD is required to generate STL files:

```bash
openscad -o acer_e5_case_bottom.stl -D 'part="bottom"' acer_e5_case.scad
openscad -o acer_e5_case_top.stl -D 'part="top"' acer_e5_case.scad
```

## Adjustments to review before printing
- `fan_center`, `fan_diameter`, `heatsink_size`, `heatsink_extra_height`
- `ports_right` for audio/headphone or other side ports
- `hdd_bay_pos`, `odd_bay_pos` for drive placement
- `case_margin`, `wall`, `lip_clearance` to match printer tolerances
