#!/bin/bash
# Quick Start Guide - Generate STL Files for 3D Printing
# Usage: ./generate_stl.sh

echo "=========================================="
echo "Acer E5-574G Case STL Generator"
echo "=========================================="
echo ""

# Check if OpenSCAD is installed
if ! command -v openscad &> /dev/null; then
    echo "Error: OpenSCAD is not installed."
    echo "Please install it first:"
    echo "  Ubuntu/Debian: sudo apt-get install openscad"
    echo "  macOS: brew install openscad"
    echo "  Windows: Download from https://openscad.org/"
    exit 1
fi

echo "OpenSCAD found: $(openscad --version | head -1)"
echo ""

# Create output directory
mkdir -p output
echo "Output directory: ./output/"
echo ""

# Generate bottom case
echo "Generating case bottom STL..."
echo "This may take several minutes..."
openscad -o output/case_bottom.stl acer_case.scad 2>&1 | tail -5
if [ -f output/case_bottom.stl ]; then
    echo "✓ Bottom case generated: output/case_bottom.stl"
    ls -lh output/case_bottom.stl
else
    echo "✗ Failed to generate bottom case"
    exit 1
fi
echo ""

# Generate top case
echo "Generating case top STL..."
echo "This may take several minutes..."
# Create temporary file that only renders top
cat > /tmp/acer_case_top.scad << 'EOF'
// Include the main file
include <acer_case.scad>

// Override the default rendering to show only top
translate([0, 0, 0])
    case_top();
EOF

openscad -o output/case_top.stl /tmp/acer_case_top.scad 2>&1 | tail -5
if [ -f output/case_top.stl ]; then
    echo "✓ Top case generated: output/case_top.stl"
    ls -lh output/case_top.stl
else
    echo "✗ Failed to generate top case"
    exit 1
fi
echo ""

# Summary
echo "=========================================="
echo "Generation complete!"
echo "=========================================="
echo ""
echo "Files created:"
ls -lh output/*.stl 2>/dev/null
echo ""
echo "Next steps:"
echo "1. Import the STL files into your slicer (Cura, PrusaSlicer, etc.)"
echo "2. Configure print settings (see README.md for recommendations)"
echo "3. Print each part separately"
echo "4. Assemble the case with M3 screws"
echo ""
echo "See README.md and SPECIFICATIONS.md for detailed information."

# Clean up
rm -f /tmp/acer_case_top.scad
