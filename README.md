# Acer E5-574G 3D-Printable Case

This repository contains a 3D-printable case design for the Acer E5-574G (Aspire E5-573G V3-574G) laptop motherboard based on the DA0ZRTMB6D0 schematic.

## Overview

The case is designed using OpenSCAD and consists of two main parts:
1. **Case Bottom** - Features ventilation grille, mounting posts, and SATA drive support
2. **Case Top** - Features elevated lip design for secure attachment

## Features

### Case Bottom Part
- **Ventilation Grille**: Predominantly grille structure in the base for optimal airflow and easy 3D printing
- **Elevated Feet**: Four corner feet for stability and airflow underneath
- **Screw Posts**: Mounting posts at PCB mounting hole locations with integrated screw holes
- **SATA Extension**: 130mm (13cm) extension area on the left side for:
  - Standard 2.5" SATA drives
  - Optical drive to SSD adapters (SATA 5.25" size)
- **SATA Standoffs**: Mounting standoffs with M2.5 screw holes for SATA drives

### Case Top Part
- **Elevated Sides**: Lip design that fits around the bottom case for secure attachment
- **Screw Holes**: Corner holes for screw-based attachment to the bottom
- **Ventilation**: Small ventilation holes throughout the top for heat dissipation

### Side Cutouts
- **USB Ports**: Three USB port cutouts on the front side
- **Ethernet Port**: RJ45 ethernet port cutout on the front side
- **SD Card Reader**: Low-profile cutout for SD card reader on the front side
- **HDMI/Display Port**: Display output cutout on the right side
- **Power Port**: DC power input cutout on the left side (at fan location)
- **Fan Cutout**: Large cutout for cooling fan on the left side

### Peripheral Clearance
- **15mm clearance** on both sides of the board for cable management
- **15mm clearance** above the board for components
- **5mm clearance** below the board for PCB traces and components

## Dimensions

- **Board Size**: Approximately 254mm x 203mm (10" x 8")
- **Total Case Length** (with SATA extension): 390mm
- **Total Case Width** (with side clearance): 239mm
- **Bottom Case Height**: 7mm (base + clearance)
- **Top Case Height**: 10mm (lip + top)
- **Wall Thickness**: 3mm
- **SATA Extension**: 130mm for drive compatibility

## Printing Instructions

### Requirements
- 3D Printer with build volume of at least 400mm x 250mm x 20mm (or print in sections)
- PLA, PETG, or ABS filament recommended
- Support material may be needed for overhangs

### Steps

1. **Install OpenSCAD**:
   ```bash
   # Ubuntu/Debian
   sudo apt-get install openscad
   
   # macOS
   brew install openscad
   
   # Windows: Download from https://openscad.org/
   ```

2. **Generate STL Files**:
   
   Use the provided script:
   ```bash
   ./generate_stl.sh
   ```
   
   Or manually with OpenSCAD:
   
   For the **bottom case** (default rendering):
   ```bash
   openscad -o case_bottom.stl acer_case.scad
   ```
   
   For the **top case** (uncomment the top rendering in the file first, or use the script)

3. **Slice and Print**:
   - Import STL files into your slicer (Cura, PrusaSlicer, etc.)
   - Recommended settings:
     - Layer height: 0.2mm
     - Infill: 20-30%
     - Wall thickness: 3-4 perimeters
     - Support: Use for overhangs if needed
   - Print time: 8-12 hours per part (varies by printer)

4. **Assembly**:
   - Place motherboard in bottom case
   - Secure with M3 screws through mounting posts
   - Install any SATA drives in the extension area
   - Attach top case using corner screws

## Customization

The OpenSCAD file (`acer_case.scad`) is fully parametric. You can customize:

- **Board dimensions**: Adjust `board_length` and `board_width`
- **Wall thickness**: Modify `wall_thickness`
- **Clearances**: Adjust `clearance_above_board`, `clearance_below_board`, `side_clearance`
- **SATA extension**: Change `sata_extension` length
- **Port positions**: Modify the cutout arrays for your specific board layout
- **Ventilation**: Adjust grille spacing and hole patterns

Simply edit the configuration parameters at the top of the file and regenerate the STL files.

## Files

- `acer_case.scad` - Main OpenSCAD design file
- `da0zrtmb6d0.cad` - Original schematic file (GenCAD format)
- `Acer laptop board schematic.txt` - Text version of schematic
- PDF files - Board view documentation

## Hardware Required

For assembly, you will need:
- M3 x 6mm screws (4x for case assembly)
- M3 x 8mm screws (4x for motherboard mounting)
- M2.5 x 5mm screws (4x for SATA drive mounting, if using)

## Notes

- The design is based on standard laptop motherboard dimensions and typical port locations
- You may need to adjust port cutout positions based on your specific board revision
- Ensure adequate ventilation during operation
- The case is designed for testing/development use, not as a replacement for the original laptop enclosure

## License

This design is provided as-is for personal and educational use. The schematic files are property of Acer/Quanta and are included for reference only.

## Contributing

Feel free to fork and modify the design for your needs. If you make improvements, consider submitting a pull request!

## Disclaimer

This is a community-created design and is not officially endorsed by Acer. Use at your own risk. Ensure proper cooling and ventilation when operating the motherboard in this case.
