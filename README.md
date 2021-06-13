# v2bench
a very simple tool to convert verilog to bench files

How to get started:
1 - first you need to synthesize your target circuit but since the bench format is limited, it's easier if you don't allow the synthesis tool to use any complex gates. The bench format supports the following gates:
* AND NAND OR NOR XOR INV DFF
