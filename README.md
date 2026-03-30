# intel_job_interview

## Task 1 & 2: Mathematical Modeling & Bit-Width Optimization

* Analyze MATLAB/octave scripts:
  - a: f(x) (base value)
  - b: f'(x) (first derivative)
  - c: f''(x) (second derivative)

* Optimize coefficient in C++ script to reduce hardwear area:
  - a: optimized to 24-bit (s1.23)
  - b: optimized to 19-bit (s3.16)
  - c: optimized to 13-bit (s2.11)
 
## Task 3: Design RTL model

* Implementing missing RTL components
  - quadra.vh
  - quadra.vs
  - quadra_top.vs
 
 * Adding coefficient to LUT
  - creating MATLAB/octave script (`print_coeffs.m`) to convert signed coefficient into hex applicable for lut.vs
