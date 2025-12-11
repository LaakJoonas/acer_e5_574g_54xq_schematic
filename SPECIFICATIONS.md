# Case Design Specifications

## Overview
This document provides detailed specifications for the Acer E5-574G 3D-printable case design.

## Dimensions Summary

### Board and Case Dimensions
- **Motherboard Size**: 254mm (L) x 203mm (W) x 1.6mm (H)
- **Wall Thickness**: 3mm
- **Base Thickness**: 2mm

### Total Case Dimensions
- **Length** (with SATA extension): 393mm
- **Width** (with side clearance): 239mm
- **Bottom Height**: 7mm (2mm base + 5mm clearance)
- **Top Height**: 10mm (8mm lip + 2mm top)
- **SATA Extension Area**: 130mm x 203mm

### Clearances
- **Above Board**: 15mm (for components and airflow)
- **Below Board**: 5mm (for PCB traces)
- **Side Clearance**: 15mm on each side (for cable management)

## Port Cutouts

### Front Side (USB/Ethernet/SD)
| Port Type | Position (X) | Width | Height | Quantity |
|-----------|--------------|-------|--------|----------|
| USB       | 50mm         | 15mm  | 8mm    | 1        |
| USB       | 75mm         | 15mm  | 8mm    | 1        |
| USB       | 100mm        | 15mm  | 8mm    | 1        |
| Ethernet  | 25mm         | 16mm  | 14mm   | 1        |
| SD Card   | 130mm        | 25mm  | 3mm    | 1        |

### Right Side
| Port Type | Position (Y) | Width | Height |
|-----------|--------------|-------|--------|
| HDMI      | 50mm         | 16mm  | 8mm    |

### Left Side (SATA/Power)
| Feature   | Position (Y) | Width | Height |
|-----------|--------------|-------|--------|
| Power     | 101.5mm      | 12mm  | 6mm    |
| Fan       | 131.5mm      | 40mm  | 40mm   |

## Mounting Features

### PCB Mounting Posts
- **Location**: 4 corners at standard mounting hole positions
- **Post Diameter**: 7mm
- **Hole Diameter**: 3.5mm (for M3 screws)
- **Post Height**: 3mm (clearance_below - base_thickness)
- **Positions**:
  - Front-Left: (10mm, 10mm)
  - Front-Right: (244mm, 10mm)
  - Back-Right: (244mm, 193mm)
  - Back-Left: (10mm, 193mm)

### SATA Drive Standoffs
- **Type**: M2.5 screw compatible
- **Standoff Diameter**: 6mm
- **Hole Diameter**: 2.5mm
- **Height**: 3mm
- **Pattern**: Standard 2.5" SATA drive (100mm x 69.85mm)
- **Mounting Positions** (relative to SATA extension area):
  - (0, 0)
  - (61.72mm, 0)
  - (0, 76.6mm)
  - (61.72mm, 76.6mm)

### Corner Feet
- **Diameter**: 10mm
- **Height**: 3mm
- **Quantity**: 4 (one at each corner)
- **Purpose**: Stability and airflow underneath

## Ventilation Design

### Bottom Grille
- **Pattern**: Grid structure
- **Bar Width**: 2mm
- **Spacing**: 5mm
- **Coverage**: Majority of base plate (excludes 5mm border)
- **Purpose**: Maximum airflow and easy 3D printing

### Top Ventilation
- **Pattern**: Array of circular holes
- **Hole Diameter**: 3mm
- **Spacing**: 20mm (center to center)
- **Coverage**: Across entire top surface
- **Purpose**: Heat dissipation

### Side Ventilation
- **Fan Cutout**: 40mm x 40mm opening on left side
- **Position**: Aligned with typical laptop cooling system location

## Case Assembly

### Top-to-Bottom Attachment
- **Method**: Screw-free friction fit with elevated lip design
- **Alternative**: Corner screw holes for M3 screws
- **Tolerance**: 0.5mm clearance for proper fit
- **Lip Height**: 8mm (provides secure engagement)

### Screw Requirements
For full assembly with screws:
- **Case Assembly**: 4x M3 x 6mm (optional, for securing top to bottom)
- **Board Mounting**: 4x M3 x 8mm (to mount board to case)
- **SATA Drive**: 4x M2.5 x 5mm (if installing drive)

## Material Recommendations

### Filament Type
- **Primary Choice**: PETG (heat resistant, durable)
- **Alternative 1**: PLA (easy to print, adequate for low-power use)
- **Alternative 2**: ABS (high strength, heat resistant)

### Print Settings
- **Layer Height**: 0.2mm (recommended)
- **Wall Line Count**: 3-4 perimeters
- **Infill**: 20-30%
- **Support**: May be needed for overhangs
- **Print Speed**: 50-60mm/s
- **Bed Temperature**: Per filament manufacturer

### Estimated Print Time
- **Bottom Case**: 8-10 hours
- **Top Case**: 6-8 hours
- **Total**: 14-18 hours (varies by printer and settings)

### Estimated Material
- **Bottom Case**: ~200-250g of filament
- **Top Case**: ~150-200g of filament
- **Total**: ~350-450g per complete case

## Design Features

### Parametric Design
All dimensions can be customized by editing the configuration section at the top of `acer_case.scad`:

```openscad
// Board dimensions
board_length = 254;
board_width = 203;

// Case parameters
wall_thickness = 3;
base_thickness = 2;
clearance_above_board = 15;
clearance_below_board = 5;

// SATA extension
sata_extension = 130;

// Peripheral clearance
side_clearance = 15;
```

### Modular Construction
The design uses OpenSCAD modules for easy modification:
- `ventilation_grille()` - Customizable grille pattern
- `foot()` - Corner foot design
- `screw_post()` - PCB mounting posts
- `sata_standoff()` - Drive mounting standoffs

## Safety Notes

### Thermal Management
- Ensure adequate ventilation during operation
- Monitor component temperatures
- Do not block ventilation holes
- Consider adding thermal sensors

### Electrical Safety
- Ensure proper grounding
- Use appropriate power supply
- Check for short circuits before power-on
- Keep away from liquids

### Mechanical Stability
- Verify all screws are tight
- Place on stable, flat surface
- Ensure adequate clearance around case
- Do not stack other items on top

## Compatibility

### Supported Configurations
- Acer Aspire E5-574G
- Acer Aspire E5-573G
- Acer Aspire V3-574G
- Any motherboard using DA0ZRTMB6D0 or compatible revision

### Drive Support
- Standard 2.5" SATA drives (HDD/SSD)
- Optical drive to SSD adapters (up to 130mm length)
- Standard SATA cables and power connectors

### Limitations
- Does not support original laptop display
- No battery compartment
- No integrated keyboard/touchpad
- Requires external peripherals

## Revision History

### Version 1.0 (2024-12-11)
- Initial release
- Complete case design with all specified features
- Tested for OpenSCAD syntax compatibility
- Full documentation provided

## Future Enhancements (Suggested)

Potential improvements for future versions:
- [ ] Add support for additional cooling fans
- [ ] Include cable management channels
- [ ] Design stackable variant for multiple boards
- [ ] Add optional transparent top panel
- [ ] Include mounting points for external antennas
- [ ] Design modular port adapters for different revisions
- [ ] Add LED indicator windows
- [ ] Include dust filter attachment points

## License and Usage

This design is provided for personal and educational use. Users are responsible for ensuring safe operation of any assembled system. The design files can be modified and redistributed under the same terms.

For questions, issues, or contributions, please refer to the GitHub repository.
