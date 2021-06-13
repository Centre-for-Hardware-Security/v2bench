# v2bench
a very simple tool to convert verilog to bench files

**How to get started:**
1. First you need to synthesize your target circuit but since the bench format is limited, it's easier if you don't allow the synthesis tool to use any complex gates. The bench format supports the following gates:
* AND
* NAND
* OR 
* NOR 
* INV 
* DFF
2. Check the included sample synthesis script that works with Cadence Genus. The set_dont_use statements prevent the tool from using any complex gates. You should modify this script to match the names of the basic gates in your own ASIC library (.lib)
3. The changes that you did to the synthesis script have to reflected in the *v2bench* parsing. For this you have to modify the cell definition string in /src/cell_definition.h. There is one string for each gate type, it is pretty straightforward.
4. Recompile *v2bench*. A sample single line compile script is provided in compile.sh
5. Take the generated netlist and put it through v2bench: *./v2bench input.v output.bench*
6. Now stare at the generated file and wonder why this outdated & unpractical format keeps being support by academic tools...
