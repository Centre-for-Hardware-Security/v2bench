# v2bench
a very simple tool to convert verilog to bench files

**How to get started:**
1. First you need to synthesize your target circuit but since the bench format is limited, it's easier if you don't allow the synthesis tool to use any complex gates. The bench format supports the following gates:
* AND
* NAND
* OR 
* NOR 
* XOR 
* INV DFF
2. Check the included sample synthesis script that works with Cadence Genus. The set_dont_use statements prevent the tool from using any complex gates. You should modify this script to match the names of the basic gates in your own ASIC library (.lib)
3. Take the generated netlist and put it through v2bench: *./v2bench input.v output.bench*
4. Now stare at the wonders of this outdated & unpractical format that for some reason keeps being support by academic tools...
