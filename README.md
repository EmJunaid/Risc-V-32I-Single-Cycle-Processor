# Risc-V-Single-Cycle-Processor
Implementation of RiscV single cycle architecture consisting of six base instructions (R, I, B, S, J, U). 

This is an implementation of RiscV base single cycle processor. This basic design supports six base instructions mentioned as:

R-Type

I-Type

S-Type

B-Type

J-Type

U-type

All above instructions are 32 bit encoding based. 

# Source Codes and Test Benches

Source code of all modules are provided in Source_code folder and all those modules are finally called in Top_level.v file. In order to test each module test benches for these modules are provided in separate folder named as test_Benches. And similarly in order to check the complete processor design a test bench file named as Single_cycle.v in test_Bench folder is used.

# Testing

The demo code used to check the working of processor was a code to calculate GCD of two numbers and it's Assembly and Machine code is provided in folder named as Assembly and Machine Code.

According to the assembly of c code, the result (The GCD of two numbers) is stored in X17, so one can check the final result by declaring this register as output in top_level.v file or after simulation one can also check it through scope (This feature is available in Vivado, i don't know about any other simulation tool). 

The two numbers which I used in my assembly program was 5 and 10 and GCD of these two numbers is 5. Below a picture is attached of simulation which is showing that correct result (5) is stored in x17.

![Screenshot (139)](https://user-images.githubusercontent.com/93525537/139679257-e73fcc02-97c3-4d13-85ea-015958436e8f.png)

# Simulation

For Simulation I have used Vivado, and I have also uploaded my complete project folder with name project_1. If you have vivado setup istalled in your pc you can simply download this folder and can run project_1.xpr file inside project_1 folder.

Or if you want to make your own project then you need to make a new project and all the modules that are in Source code folders add them as design source and also add instruction.mem file from Assembly and Machine code folder as design source. Add singleCycle_tb.v file from test_Benches folder as simulation folder and then run the simulation.

# DataPath Which have been Followed

Below is the picture of data path which I followed to design the single cycle RiscV processor. The below diagram only supported these instructions:

R-Type

S-Type

I-Type

B-Type

In order to implement U-type and J-Type I did some ammendments according to the requirements but the main underlying datapath is same which is provided below.



![Screenshot (140)](https://user-images.githubusercontent.com/93525537/140441883-aca603de-333a-4f3a-b681-4184e4513293.png)


# Reference

All this material and understanding is taken from book " Digital Design and Computer Architecture RISC-V Edition " by Sarah L Harris and David M Harris.






