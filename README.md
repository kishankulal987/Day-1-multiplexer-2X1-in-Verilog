Overview

This repository contains Verilog code for a 2x1 Multiplexer (MUX) implemented in three distinct styles: Conditional, Dataflow, and Gate-Level. A comprehensive testbench is included to verify the functionality of all three designs. The 2x1 MUX selects one of two input bits (I[0] or I[1]) based on a select line (s) and outputs the selected value (y).

Modules

1. MUX2x1_conditional
Description: Implements a 2x1 MUX using a conditional (ternary) operator.
Functionality: The output y is assigned I[1] if s is 1, otherwise I[0].
Style: dataflow modeling.
Code: Uses the ternary operator (assign y = s ? I[1] : I[0];) for a concise, high-level design.

2. MUX2X1_dataflow
Description: Implements a 2x1 MUX using dataflow modeling with continuous assignments.
Functionality: The output y is computed as (I[0] & ~s) | (I[1] & s), selecting I[0] when s is 0 and I[1] when s is 1.
Style: Dataflow modeling.
Advantage: Reflects data flow through logical operations, ideal for synthesis.

3. MUX2X1_gate
Description: Implements a 2x1 MUX using gate-level modeling with basic logic gates.
Functionality: Combines NOT, AND, and OR gates to produce the output y based on inputs and the select line.
Style: Structural modeling.
Components:
1 NOT gate (inverts s)
2 AND gates (compute I[0] & ~s and I[1] & s)
3 OR gate (combines AND gate outputs)
Advantage: Represents the hardware at a low level.


circuit Diagram

Below is the schematic diagram for the 2x1 MUX.
![2x1 mux diagram](https://github.com/user-attachments/assets/006509e6-8b04-4d61-ab0a-4bf81ec90f2f)

Simulation Output:

Below is the simultion waveform for the 2x1 MUX.
![Screenshot 2025-05-30 174506](https://github.com/user-attachments/assets/5afdd628-8dc1-4c8e-aa1b-2c2e694526be)

4. testbench
Description: A testbench to verify the functionality of all three MUX implementations.
Functionality:
Inputs: 2-bit vector I (I[0], I[1]) and select line s.
Outputs: y_conditional, y_dataflow, and y_gate for the three designs.
Tests all combinations of I (00, 01, 10, 11) and s (0, 1) using nested loops.
Displays results with a 10-time-unit delay using $display.
Purpose: Confirms all implementations produce correct, identical outputs.
