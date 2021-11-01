# RiscV-Single-Cycle
Implementation of RiscV single cycle architecture consisting of six base instructions (R, I, B, S, J, U). 

This is an implementation of RiscV base single cycle processor. This basic design supports six base instructions mentioned as:

R-Type

I-Type

S-Type

B-Type

J-Type

U-type

All above instructions are 32 bit encoding based. 

Source code of all modules are provided in Source_code folder and all those modules are finally called in Top_level.v file. In order to test each module test benches for these modules are provided in separate folder named as test_Benches. And similarly in order to check the complete processor design a test bench file named as Single_cycle.v in test_Bench folder is used.

The demo code used to check the working of processor was a code to calculate GCD of two numbers and it's Assembly and Machine code is provided in folder named as Assembly and Machine Code.

According to the assembly of c code, the result (The GCD of two numbers) is stored in X17, so one can check the final result by declaring this register as output in top_level.v file or after simulation one can also check it through scope (This feature is available in Vivado, i don't know about any other simulation tool). 

The two numbers which I used in my assembly program was 5 and 10 and GCD of these two numbers is 5. Below a picture is attached of simulation which is showing that correct result (5) is stored in x17.

![Screenshot (139)](https://user-images.githubusercontent.com/93525537/139679257-e73fcc02-97c3-4d13-85ea-015958436e8f.png)






