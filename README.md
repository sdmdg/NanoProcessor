# Nanoprocessor Design Project
## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Components](#components)
- [Assembly Program Example](#assembly-program-example)
- [Additional Features](#additional-features)
- [Simulation](#simulation)
- [Contributions](#contributions)
- [Repository Structure](#repository-structure)
- [Getting Started](#getting-started)

## Overview
This project, developed as part of the **CS1050 - Computer Organization and Digital Design** module, involves the design, simulation and implementation of a custom-built nanoprocessor. The processor is capable of executing a variety of arithmetic, logical and control operations, with additional features for enhanced performance and functionality.

## Features
- **4-bit Arithmetic Unit**: Supports addition and subtraction of signed integers.
- **Register Bank**: An 8-register bank for efficient data storage and retrieval.
- **Multiplexers**: Configurable 2-way, 4-way and 8-way multiplexers for streamlined data flow.
- **Decoders**: 2-to-4 and 3-to-8 decoders integrated for instruction decoding and control logic.
- **Instruction Set**: Custom assembly language to perform operations such as ADD, SUB, MOVI, JMP and more.
- **Simulation and Verification**: Comprehensive testbenches and timing diagrams for all components.

### Components

##### 1. Arithmetic and Logic Units
- **Half Adder**  
- **Full Adder**  
- **4-Bit Add/Subtract Unit**  

##### 2. Multiplexers
- **2-Way 3-Bit Multiplexer**  
- **8-Way 4-Bit Multiplexer**  

##### 3. Control and Storage
- **Program Counter**  
- **Register Bank**  
- **D Flip-Flops**  

## Assembly Program Example
The following program calculates the total of integers between 1 and 3

```
MOVI R7, 1   ; Load 1 into R7  
MOVI R6, 2   ; Load 2 into R6  
MOVI R5, 3   ; Load 3 into R5  
ADD  R7, R6  ; R7 = R7 + R6  
ADD  R7, R5  ; R7 = R7 + R5  
MOVI R0, 0   ; Initialize R0  
JZR  R0, 6   ; Jump if R0 is zero  
END          ; End of program  
```

## Additional Features
We have extended our nanoprocessor to accommodate the execution of up to 12 instructions inclusive of the initial 4 instructions.

- **`SUB Ra, Rb`**: Subtract the value of `Rb` from `Ra` and store the result in `Ra`.  
  - Executed by the 4-bit Add/Subtract Unit.  

- **`MUL Ra, Rb`**: Multiply `Rb` by `Ra` and store the result in `Ra` (supports only two bits).  
  - Executed by the newly added 2-bit Multiplier.  

- **`MOV Ra, Rb`**: Move the value of `Rb` to `Ra`.  

- **`JMP d`**: Jump instructions by `d` steps.  

- **`SHL Ra`**: Shift the value of `Ra` to the left by one bit.  
  - Executed by the newly added bit shifter.  

- **`RHL Ra`**: Shift the value of `Ra` to the right by one bit.  
  - Executed by the newly added bit shifter.  

- **`MAX Ra, Rb`**: Find the maximum value stored in `Ra` and `Rb`.  
  - Executed by the newly added comparator.  

- **`MIN Ra, Rb`**: Find the minimum value stored in `Ra` and `Rb`.  
  - Executed by the newly added comparator.  


## Simulation
All components were tested and verified using simulation files. Timing diagrams and elaborated schematics are available for review.

## Contributions
- **Gunawardana S.D.M.D.** : Simulation, testbench development and extended Nanoprocessor.
- **Talagala S.A.** : Component design and verification.
- **Samarasinghe Y.B.P.** : Assembly program development and testing.
- **Arachchi K.A.K.N.K.** : Integrating components and final testing.

## Repository Structure
- `src/`: Contains VHDL source files for all components
- `sim/`: Simulation and testbench files
- `docs/`: Reports, schematics, and timing diagrams

## Getting Started
- Clone the repository:
    ```
    git clone https://github.com/sdmdg/NanoProcessor
    ```
- Open the project in your preferred VHDL simulation tool (e.g. Xilinx Vivado).
- Run the testbenches to verify component functionality.
